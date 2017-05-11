package com.fuchen.academic.domain;

/**
 * 
 * @author yshin1992
 *
 */
public class Users {
	
	/**
	 * 学号/教师编号
	 */
	private String number;
	
	private String password;
	
	private String name;
	
	private String type;
	
	private String tel;
	
	private String email;
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Users [number=" + number + ", password=" + password + ", name="
				+ name + ", type=" + type + ", tel=" + tel + ", email=" + email
				+ "]";
	}

	
}
