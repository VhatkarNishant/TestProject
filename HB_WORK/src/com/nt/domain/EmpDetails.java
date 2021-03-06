package com.nt.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class EmpDetails {

	@Id/*primary key*/
	private int no;
	private String fname;
	private String lname;
	private String mail;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
}//end class
