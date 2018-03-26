package bootsample.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.FileContent;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.File;

import bootsample.model.Admin;
import bootsample.model.Tintuc;
import bootsample.service.AdminService;
import bootsample.service.AdminService;
import bootsample.service.TintucService;
import bootsample.storage.StorageFileNotFoundException;
import bootsample.storage.StorageService;

@Controller
public class MainController {

	@Autowired
	private TintucService tintucService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private final StorageService storageService;

	public MainController(StorageService storageService) {
		this.storageService = storageService;
	}

	// hiển thị tin tức chinh
	@GetMapping("/xem")
	public String Xem(HttpServletRequest request) {
		request.setAttribute("tintuc", tintucService.xem());
		request.setAttribute("lienquan", tintucService.lienquan());
		request.setAttribute("mode", "MODE_tintucchinh");
		return "xem";
	}

	// xu lý xem thêm tin tức
	@GetMapping("/xemthem")
	public String xemthem(@RequestParam int id, HttpServletRequest request) {
		request.setAttribute("tintuc", tintucService.findTintuc(id));
		request.setAttribute("lienquan", tintucService.lienquan());
		request.setAttribute("mode", "MODE_tintucchinh");
		return "xem";
	}

	@GetMapping("/home")
	public String home(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_HOME");
		return "index";
	}

	// show ra tất cả tin tức
	@GetMapping("/all-tasks")
	public String allTasks(HttpServletRequest request) {
		request.setAttribute("tintucs", tintucService.findAll());
		request.setAttribute("mode", "MODE_TINTUC");
		return "index";
	}

	// điều hướng tới trang thêm tin tức
	@GetMapping("/new-task")
	public String newTask(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_NEW");
		return "index";
	}

	// chọn tin tức để updae
	@GetMapping("/update-task")
	public String updateTask(@RequestParam int id, HttpServletRequest request) {
		request.setAttribute("tintuc", tintucService.findTintuc(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "index";
	}

	// xóa tin tức
	@GetMapping("/delete-task")
	public String deleteTask(@RequestParam int id, HttpServletRequest request) {
		tintucService.delete(id);
		request.setAttribute("tintucs", tintucService.findAll());
		request.setAttribute("mode", "MODE_TINTUC");
		return "index";
	}

	@GetMapping("/login")
	public String login(HttpServletRequest request) {

		return "loginAdmin";
	}

	// xử lý đăng nhập
	@PostMapping("/login-admin")
	public String loginadmin(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpServletRequest request) {
		try {
			Admin admin = adminService.findadmin(username);
			if (admin.getUsername().equals(username) && admin.getPassword().equals(password)) {
				request.setAttribute("mode", "MODE_HOME");
				return "index";
			}else {
				request.setAttribute("message", "Saitk");
				return "loginAdmin";
			}
		}catch (Exception e) {
			request.setAttribute("message", "Saitk");
		}	
		return "loginAdmin";
	}

	// thêm hoặc update tin tức
	@PostMapping("/save-task")
	public String saveTask(@ModelAttribute Tintuc tintuc, BindingResult bindingResult,
			@RequestParam("Name") String name, @RequestParam("noidung") String noidung,
			@RequestParam("hinhanh") MultipartFile file, HttpServletRequest request) throws IOException {

		storageService.store(file);
		Drive service = getDriveService();
		File fileMetadata = new File();
		fileMetadata.setName(file.getOriginalFilename());
		java.io.File filePath = new java.io.File(
				"src/main/resources/static/uploadMedia/images/" + file.getOriginalFilename());
		FileContent mediaContent = new FileContent(file.getContentType(), filePath);
		File f = service.files().create(fileMetadata, mediaContent).setFields("id").execute();
		// System.out.println("File ID: " + f.getId()+" | "+f.getWebContentLink());

		tintuc.setHinhanh("https://drive.google.com/file/d/" + f.getId() + "/preview");
		/* tintuc.setHinhanh("https://drive.google.com/open?id=" + f.getId()); */
		tintuc.setThoigian(new Date());
		tintuc.setName(name);
		tintuc.setNoidung(noidung);
		tintucService.save(tintuc);
		request.setAttribute("tintucs", tintucService.findAll());
		request.setAttribute("mode", "MODE_TINTUC");
		return "index";
	}

	////////////////////////////////////////////////
	/** Application name. */
	private static final String APPLICATION_NAME = "Drive API Java Quickstart";

	/** Directory to store user credentials for this application. */
	private static final java.io.File DATA_STORE_DIR = new java.io.File(System.getProperty("user.home"),
			".credentials/drive-java-quickstart");

	/** Global instance of the {@link FileDataStoreFactory}. */
	private static FileDataStoreFactory DATA_STORE_FACTORY;

	/** Global instance of the JSON factory. */
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

	/** Global instance of the HTTP transport. */
	private static HttpTransport HTTP_TRANSPORT;

	/**
	 * Global instance of the scopes required by this quickstart.
	 *
	 * If modifying these scopes, delete your previously saved credentials at
	 * ~/.credentials/drive-java-quickstart
	 */
	private static final List<String> SCOPES = Arrays.asList(DriveScopes.DRIVE);

	static {
		try {
			HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
			DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
		} catch (Throwable t) {
			t.printStackTrace();
			System.exit(1);
		}
	}

	/**
	 * Creates an authorized Credential object.
	 * 
	 * @return an authorized Credential object.
	 * @throws IOException
	 */
	public static Credential authorize() throws IOException {
		// Load client secrets.
		InputStream in = MainController.class.getResourceAsStream("/client_secret.json");
		GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

		// Build flow and trigger user authorization request.
		GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT, JSON_FACTORY,
				clientSecrets, SCOPES).setDataStoreFactory(DATA_STORE_FACTORY).setAccessType("offline").build();
		Credential credential = new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver()).authorize("user");
		System.out.println("Credentials saved to " + DATA_STORE_DIR.getAbsolutePath());
		return credential;
	}

	/**
	 * Build and return an authorized Drive client service.
	 * 
	 * @return an authorized Drive client service
	 * @throws IOException
	 */
	public static Drive getDriveService() throws IOException {
		Credential credential = authorize();
		return new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential).setApplicationName(APPLICATION_NAME).build();
	}

	@GetMapping("/files/{filename:.+}")
	@ResponseBody
	public ResponseEntity<Resource> serveFile(@PathVariable String filename) {

		Resource file = storageService.loadAsResource(filename);
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
				.body(file);
	}

	@ExceptionHandler(StorageFileNotFoundException.class)
	public ResponseEntity handleStorageFileNotFound(StorageFileNotFoundException exc) {
		return ResponseEntity.notFound().build();
	}

}
