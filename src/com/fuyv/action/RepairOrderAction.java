package com.fuyv.action;

import com.fuyv.model.Equipment;
import com.fuyv.model.RepairOrder;
import com.fuyv.utils.FileUploadUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.fuyv.dao.RepairOrderDao;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RepairOrderAction extends ActionSupport implements ModelDriven<RepairOrder> {

	private static final long serialVersionUID = 903575704475951054L;
	private RepairOrder repairOrder = new RepairOrder();
	private RepairOrderDao repairOrderDao;
	private File repairOrder_image;
	private String repairOrder_imageContentType;
	private String repairOrder_imageFileName;
	private String build_floor_num;

	public String getBuild_floor_num() {
		return build_floor_num;
	}

	public void setBuild_floor_num(String build_floor_num) {
		this.build_floor_num = build_floor_num;
	}

	public File getRepairOrder_image() {
		return repairOrder_image;
	}

	public void setRepairOrder_image(File repairOrder_image) {
		this.repairOrder_image = repairOrder_image;
	}

	public String getRepairOrder_imageContentType() {
		return repairOrder_imageContentType;
	}

	public void setRepairOrder_imageContentType(String repairOrder_imageContentType) {
		this.repairOrder_imageContentType = repairOrder_imageContentType;
	}

	public String getRepairOrder_imageFileName() {
		return repairOrder_imageFileName;
	}

	public void setRepairOrder_imageFileName(String repairOrder_imageFileName) {
		this.repairOrder_imageFileName = repairOrder_imageFileName;
	}

	public RepairOrderDao getRepairOrderDao() {
		return repairOrderDao;
	}

	public void setRepairOrderDao(RepairOrderDao repairOrderDao) {
		this.repairOrderDao = repairOrderDao;
	}

	@Override
	public RepairOrder getModel() {
		return repairOrder;
	}

	public String RepairOrder_Add() {

		// 验证方法被调用的输出
		System.out.println("1.已经进入保修单提交的的RepairOrderAction的添加方法之中");

		// 图片上传的代码
		try {
			System.out.println("2.获取的文件临时目录：" + repairOrder_image);
			System.out.println("3.获取的文件类型：" + repairOrder_imageContentType);
			System.out.println("4.获取的文件名：" + repairOrder_imageFileName);

			// 获取webContent目录下的用以保存文件目录并生成一个该次文件的保存地址
			String path = ServletActionContext.getServletContext()
					.getRealPath("/uploadImage/" + repairOrder_imageFileName);
			System.out.println("目标路径：" + path);
			// 完成文件上传的操作

//            FileOutputStream out = new FileOutputStream(path);
//            FileInputStream in = new FileInputStream(repairOrder_image);
//            
//            byte[] buffer = new byte[1024];
//            int len = 0;
//            while((len = in.read(buffer)) != -1) {
//            	out.write(buffer, 0, len);
//            }
//            out.close();
//            in.close();
			FileUploadUtils.copyFile(repairOrder_image, path);
			System.out.println("文件上传已完成，暂时先不存入数据库");
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("输出获取的build和floor值：");
		for (String str : build_floor_num.split(",")) {
			System.out.print(str + "----");
		}
		repairOrder.setEquipment_build(Integer.parseInt(build_floor_num.split(",")[0]));
		repairOrder.setEquipment_floor(Integer.parseInt(build_floor_num.split(",")[1]));
		repairOrder.setImage("/uploadImage/" + repairOrder_imageFileName);
		System.out.println("调用repairOrder的toString方法来输出从前台获取到的所有值：" + repairOrder.toString());
		System.out.println("输出完成，准备添加！");

		repairOrderDao.add(repairOrder);

		return "RepairOrder_Add_Success";
	}

	public String RepairOrder_Delete() {
		System.out.println("报修单的删除方法！");
		HttpServletRequest request = ServletActionContext.getRequest();

		int repair_id = Integer.parseInt(request.getParameter("repairOrder_id"));
		System.out.println("输出通过request获得的id值:" + repair_id);

		repairOrderDao.deleteByID(repair_id);

		return "RepairOrder_Delete_Success";
	}

	public String RepairOrder_Manage() {

		System.out.println("已进入报修单分配方法");

		System.out.println(
				"输出页面封装的数据信息：报修单ID:" + repairOrder.getId() + ",维修人员ID" + repairOrder.getService_user().getId());

		repairOrderDao.updateByShareUser(repairOrder.getId(), repairOrder.getService_user().getId());

		return "RepairOrder_Manage_Success";
	}

	public String RepairOrder_Record() {
		System.out.println("已进入报修单维修人员填写回执方法");
		System.out.println(
				"输出页面封装的数据信息：报修单ID:" + repairOrder.getId() + ",回执记录："+repairOrder.getRecord());

		repairOrderDao.updateByServiceUser(repairOrder.getId(),repairOrder.getRecord());
		
		return "RepairOrder_Record_Success";
	}

	public String RepairOrder_PepairUser_Add() {
		// 验证方法被调用的输出
				System.out.println("1.已经进入保修单提交的的RepairOrderAction的添加方法之中");

				// 图片上传的代码
				try {
					System.out.println("2.获取的文件临时目录：" + repairOrder_image);
					System.out.println("3.获取的文件类型：" + repairOrder_imageContentType);
					System.out.println("4.获取的文件名：" + repairOrder_imageFileName);

					// 获取webContent目录下的用以保存文件目录并生成一个该次文件的保存地址
					String path = ServletActionContext.getServletContext()
							.getRealPath("/uploadImage/" + repairOrder_imageFileName);
					System.out.println("目标路径：" + path);
					// 完成文件上传的操作

//		            FileOutputStream out = new FileOutputStream(path);
//		            FileInputStream in = new FileInputStream(repairOrder_image);
//		            
//		            byte[] buffer = new byte[1024];
//		            int len = 0;
//		            while((len = in.read(buffer)) != -1) {
//		            	out.write(buffer, 0, len);
//		            }
//		            out.close();
//		            in.close();
					FileUploadUtils.copyFile(repairOrder_image, path);
					System.out.println("文件上传已完成，暂时先不存入数据库");
				} catch (Exception e) {
					e.printStackTrace();
				}

				System.out.println("输出获取的build和floor值：");
				for (String str : build_floor_num.split(",")) {
					System.out.print(str + "----");
				}
				repairOrder.setEquipment_build(Integer.parseInt(build_floor_num.split(",")[0]));
				repairOrder.setEquipment_floor(Integer.parseInt(build_floor_num.split(",")[1]));
				repairOrder.setImage("/uploadImage/" + repairOrder_imageFileName);
				System.out.println("调用repairOrder的toString方法来输出从前台获取到的所有值：" + repairOrder.toString());
				System.out.println("输出完成，准备添加！");

				repairOrderDao.add(repairOrder);

				return "RepairOrder_PepairUser_Add_Success";
	}
	
}
