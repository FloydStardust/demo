package com.example.entity;

public class User extends Entity {

	/**
	 * auto increament
	 */
	private String id;

    private String userName;

    private String realName;

    private String phone;

    private String email;

    private String password;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public User(String userName, String phone, String email, String password) {
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.password = password;
	}

	public User() {
	}
}
