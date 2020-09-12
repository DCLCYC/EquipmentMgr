package com.fuyv.model;

import java.util.HashSet;
import java.util.Set;

public class Role {

	private int id;//角色id
	private String name;//角色名称，管理员，调度员，维修人员1，2，3，4....
	private int type;//人员类型，四种类型，基本同上，用以分配报修单时查询维修人员。
	
	//根据PPT指导设计，role和权限之间是单向多对多的关系。
	private Set<Permission> role_permission_set = new HashSet<Permission>();//角色对应的多个权限。
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Set<Permission> getRole_permission_set() {
		return role_permission_set;
	}
	public void setRole_permission_set(Set<Permission> role_permission_set) {
		this.role_permission_set = role_permission_set;
	}
	
	
	public Role() {
		super();
	}
	public Role(int id, String name, int type) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
	}
	
	
}
