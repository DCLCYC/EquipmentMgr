package com.fuyv.model;

import java.util.Set;

public class Permission {

	private int id;//权限id
	private String url;//权限所管理的地址
	private String name;//权限名称，地址的中文简称
	private String type;//权限类型，权限管理的地址应当能被什么等级的用户访问
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	
	public Permission() {
		super();
	}
	public Permission(int id, String url, String name, String type) {
		super();
		this.id = id;
		this.url = url;
		this.name = name;
		this.type = type;
	}
	
	
}
