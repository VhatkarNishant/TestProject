package com.hibernate;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Student {

	@Id /* Primary key */
	private int RollNo;	
	private String Name;
	private String Address;
	
	//Generates setters and getters
	
	public int getRollNo() {
		return RollNo;
	}
	public void setRollNo(int rollNo) {
		RollNo = rollNo;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	

}//end class
