package com.fuyv.action;

import com.fuyv.model.Permission;
import com.fuyv.dao.PermissionDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class PermissionAction extends ActionSupport implements ModelDriven<Permission>{


	private static final long serialVersionUID = 8757171535488890373L;
	private Permission permission = new Permission(); 
	private PermissionDao permissionDao;
	
	public PermissionDao getPermissionDao() {
		return permissionDao;
	}
	public void setPermissionDao(PermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}
	@Override
	public Permission getModel() {
		return permission;
	}

	public String Permission_Add() {
		
		System.out.println("您已进入PermissionAction的添加方法");
		System.out.println("测试输出从页面值栈中获取到的数据，ID--->"+permission.getId()+",name-->"+permission.getName()
		+",type--->"+permission.getType()+",URL-->"+permission.getUrl());
		
		permissionDao.add(permission);
		
		return "Permission_Add_Success";
	}
	
	public String Permission_Delete() {
		System.out.println("您已进入PermissionAction的删除方法");
		System.out.println("测试输出从页面值栈中获取到的数据，name-->"+permission.getName()
		+"type--->"+permission.getType()+"URL-->"+permission.getUrl());
		
		permissionDao.delete(permission);
		
		return "Permission_Delete_Success";
	}
	
	public String Permission_Update() {
		System.out.println("您已进入PermissionAction的修改方法");
		System.out.println("测试输出从页面值栈中获取到的数据，ID--->"+permission.getId()+",name-->"+permission.getName()
		+",type--->"+permission.getType()+",URL-->"+permission.getUrl());
		
		permissionDao.update(permission);
		
		return "Permission_Update_Success";
	}
	
}
