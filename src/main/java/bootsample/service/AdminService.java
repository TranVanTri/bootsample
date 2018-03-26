package bootsample.service;



import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bootsample.dao.AdminRepostiory;

import bootsample.model.Admin;



@Service
@Transactional
public class AdminService {
	
	@Autowired
	private final AdminRepostiory adminRepostiory;
	
	
	public AdminService(AdminRepostiory adminRepostiory) {
		this.adminRepostiory=adminRepostiory;
	}
	
	public Admin findadmin(String username) {
		return adminRepostiory.findByUsername(username);
	}

}
