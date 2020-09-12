package com.fuyv.action;

import com.fuyv.model.Role;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.fuyv.dao.RoleDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RoleAction extends ActionSupport implements ModelDriven<Role> {

	private static final long serialVersionUID = -4887362812434935867L;
	private Role role = new Role();
	private RoleDao roleDao;
	private String[] permission_value;

	public String[] getPermission_value() {
		return permission_value;
	}
	public void setPermission_value(String[] permission_value) {
		this.permission_value = permission_value;
	}
	public RoleDao getRoleDao() {
		return roleDao;
	}
	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	public Role getModel() {
		return role;
	}

	public String Role_Add() {

		System.out.println("已经进入RoleAction的添加方法");
		System.out.println("输出从页面获取到的值：name->" + role.getName() + ",type--》" + role.getType());

		roleDao.add(role);

		return "Role_Add_Success";
	}

	public String Role_ManagePermission() {

		System.out.println("已经进入RoleAction分配权限的方法！");
		int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("role_id"));
		System.out.println(id);
		System.out.println("---------------------");

		for (String string : permission_value) {
			System.out.println(string);
		}
		roleDao.addPermission(id, permission_value);
		return "Role_ManagePermission_Success";
	}

	public String Role_Delete() {
		System.out.println("已经进入RoleAction的添加方法");
		System.out.println("输出从页面获取到的值：id-->" + role.getId() + "name->" + role.getName() + ",type--》" + role.getType());

		roleDao.delete(role);

		return "Role_Delete_Success";
	}

	public String Role_Permission_Manage_DeleteAll() {
		
		System.out.println("已经进入权限Action的清空该用户所有权限的action方法，为重新为角色分配权限做准备！");
		System.out.println("从页面获取到的值为：ID--》"+role.getId());
		
		roleDao.deletePermission(role);
		
		return "Role_Permission_Manage_DeleteAll_Success";
	}

}
