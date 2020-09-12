package com.fuyv.model;

public class User {

	private int id;//用户id
	private String nickname;//用户昵称
	private String account;//用户账户
	private String password;//用户密码
	
	//根据指导PPT设计，用户与角色之间为单向一对一的关系。使用基于外键的方式来实现
	private Role user_role;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Role getUser_role() {
		return user_role;
	}
	public void setUser_role(Role user_role) {
		this.user_role = user_role;
	}
	
	public User() {
		super();
	}
	public User(int id, String nickname, String account, String password) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.account = account;
		this.password = password;
	}
}
