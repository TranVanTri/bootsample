package bootsample.dao;




import org.springframework.data.repository.CrudRepository;



import bootsample.model.Admin;


public interface AdminRepostiory extends CrudRepository<Admin, String> {

	Admin findByUsername(String username);
	
}
