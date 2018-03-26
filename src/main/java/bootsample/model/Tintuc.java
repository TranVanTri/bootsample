package bootsample.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import javassist.tools.framedump;

@Entity()
@Table(name="tintuc")
public class Tintuc implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id",nullable=false)
	private int id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "noidung")
	private String noidung;
	
	@Column(name = "hinhanh")
	private String hinhanh;
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "thoigian")
	private Date thoigian;
	
	
	public Tintuc() {}
	
	public Tintuc(String name, String noidung, String hinhanh, Date thoigian) {
		super();
		this.name = name;
		this.noidung = noidung;
		this.hinhanh = hinhanh;
		this.thoigian = thoigian;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	
	
	public String getNoidung() {
		return noidung;
	}
	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	public Date getThoigian() {
		return thoigian;
	}
	public void setThoigian(Date thoigian) {
		this.thoigian = thoigian;
	}

	@Override
	public String toString() {
		return "Tintuc [id=" + id + ", name=" + name + ", noidung=" + noidung + ", hinhanh=" + hinhanh + ", thoigian="
				+ thoigian + "]";
	}
	
	
	
}
