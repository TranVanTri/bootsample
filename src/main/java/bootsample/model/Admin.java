package bootsample.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.Table;

@Entity()
@Table(name="admin")
public class Admin implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Id	
	@Column(name = "username",nullable=false)
	private String username;
	
	@Column(name = "password",nullable=false)
	private String password;
	
	
	
	public Admin() {}
	
	

	public Admin(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}





	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	@Override
	public String toString() {
		return "Admin [username=" + username + ", password=" + password + "]";
	}



	


	
	
	
	
}
