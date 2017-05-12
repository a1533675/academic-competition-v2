package com.fuchen.academic.domain;

/**
 * 用户实体（管理员、参赛者、发布者和校领导都使用此账号）
 * @author yshin1992
 *
 */
public class Users {
	
	/**
	 * 自增编号
	 */
	private String number;
	
	/**
	 * 密码
	 */
	private String password;
	
	/**
	 * 姓名
	 */
	private String name;
	
	/**
	 * 用户类型 : 发布者、校领导、参赛者、管理员
	 */
	private String type;
	
	/**
	 * 手机号
	 */
	private String tel;
	
	/**
	 * 电子邮箱
	 */
	private String email;
	
	/**
	 * 评审等级（对于学生而言为0、总共分为1,2,3级）
	 */
	private int reviewlv = 0;
	
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

	public int getReviewlv() {
		return reviewlv;
	}

	public void setReviewlv(int reviewlv) {
		this.reviewlv = reviewlv;
	}

	@Override
	public String toString() {
		return "Users [number=" + number + ", password=" + password + ", name=" + name + ", type=" + type + ", tel="
				+ tel + ", email=" + email + ", reviewlv=" + reviewlv + "]";
	}

	
	
}
