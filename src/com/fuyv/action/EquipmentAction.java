package com.fuyv.action;

import com.fuyv.model.Equipment;
import com.fuyv.dao.EquipmentDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class EquipmentAction extends ActionSupport implements ModelDriven<Equipment>{


	private static final long serialVersionUID = 8000195525296901367L;
	
	public EquipmentDao equipmentDao;
	
	public EquipmentDao getEquipmentDao() {
		return equipmentDao;
	}
	public void setEquipmentDao(EquipmentDao equipmentDao) {
		this.equipmentDao = equipmentDao;
	}

	
	private Equipment equipment = new Equipment();
	@Override
	public Equipment getModel() {
		return equipment;
	}
	
	public String Equip_Add() {
		System.out.println("已经进入Action层的equipAction的equipAdd方法以添加设备！");
		
		System.out.println("测试输出从值栈获取到的设备对象属性值:设备名称--->"+equipment.getName()+"设备类型值---->"+equipment.getType());
		
		equipmentDao.add(equipment);
		
		return "Equip_Add_Success";
	}
	
	public String Equip_Delete() {
		System.out.println("已经进入Action层的equipAction的equipdelete方法以添加设备！");
		System.out.println("测试输出从值栈获取到的设备对象属性值:设备名称--->"+equipment.getName()+"设备类型值---->"+equipment.getType());
		
		equipmentDao.delete(equipment);
		
		return "Equip_Delete_Success";
	}
	
	public String Equip_Update() {
		
		System.out.println("已经进入Action层的equipAction的equipdelete方法以添加设备！");
		System.out.println("测试输出从值栈获取到的设备对象属性值:设备名称--->"+equipment.getName()+"设备类型值---->"+equipment.getType());
		
		equipmentDao.update(equipment);
		
		return "Equip_Update_Success";
	}

}
