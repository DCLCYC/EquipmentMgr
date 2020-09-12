package com.fuyv.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.fuyv.model.Area;
import com.fuyv.dao.AreaDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AreaAction extends ActionSupport implements ModelDriven<Area>{

	
	private static final long serialVersionUID = 14654654L;
	private AreaDao areaDao;
	private Area area = new Area();
	
	@Override
	public Area getModel() {
		return area;
	}
	public AreaDao getAreaDao() {
		return areaDao;
	}
	public void setAreaDao(AreaDao areaDao) {
		this.areaDao = areaDao;
	}

	public String Delete_Area() {
		System.out.println("Delete方法已被调用！");
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println(request.getParameter("id"));
		int id = Integer.parseInt(request.getParameter("id"));
		int build = Integer.parseInt(request.getParameter("build"));
		int floor = Integer.parseInt(request.getParameter("floor"));
		
		areaDao.delete(new Area(id, build, floor));
		
		return SUCCESS;
	}
	
	public String Add_Area() {
		
		System.out.println("Area的添加方法已被调用!");
		System.out.println("测试从值栈对象中自动获取到的区域数据：楼栋号--->"+area.getBuild()+"楼层号---->"+area.getFloor());
		if(area.getBuild() != 0) {
			areaDao.add(area);
		}
		return SUCCESS;
	}
	
	public String Update_Area() {
		System.out.println("Area的添加方法已被调用!");
		System.out.println("测试从值栈对象中自动获取到的区域数据：ID--->"+area.getId()+"楼栋号--->"+area.getBuild()+"楼层号---->"+area.getFloor());
		
		areaDao.update(area);
		
		return SUCCESS;
	}

}
