package com.fuyv.model;

public class RepairOrder {
	
	private int id;//报修单id
	private int equipment_type;//报修单设备类型
	private String equipment_name;//报修单设备名称
	private int equipment_build;//报修设备所在楼栋
	private int equipment_floor;//报修设备所在楼层
	private String equipment_address;//报修设备详细地址
	private String image;//拍摄图片
	private String remark;//报修备注
	private String record;//维修人员记录与总结
	private int status;//报修单状态
	private User repair_user;
	private User service_user;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEquipment_type() {
		return equipment_type;
	}
	public void setEquipment_type(int equipment_type) {
		this.equipment_type = equipment_type;
	}
	public String getEquipment_name() {
		return equipment_name;
	}
	public void setEquipment_name(String equipment_name) {
		this.equipment_name = equipment_name;
	}
	public int getEquipment_build() {
		return equipment_build;
	}
	public void setEquipment_build(int equipment_build) {
		this.equipment_build = equipment_build;
	}
	public int getEquipment_floor() {
		return equipment_floor;
	}
	public void setEquipment_floor(int equipment_floor) {
		this.equipment_floor = equipment_floor;
	}
	public String getEquipment_address() {
		return equipment_address;
	}
	public void setEquipment_address(String equipment_address) {
		this.equipment_address = equipment_address;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public User getRepair_user() {
		return repair_user;
	}
	public void setRepair_user(User repair_user) {
		this.repair_user = repair_user;
	}
	public User getService_user() {
		return service_user;
	}
	public void setService_user(User service_user) {
		this.service_user = service_user;
	}
	
	
	public RepairOrder() {
		super();
	}
	public RepairOrder(int id, int equipment_type, String equipment_name, int equipment_build, int equipment_floor,
			String equipment_address, String image, String remark, String record, int status, User repair_user,
			User service_user) {
		super();
		this.id = id;
		this.equipment_type = equipment_type;
		this.equipment_name = equipment_name;
		this.equipment_build = equipment_build;
		this.equipment_floor = equipment_floor;
		this.equipment_address = equipment_address;
		this.image = image;
		this.remark = remark;
		this.record = record;
		this.status = status;
		this.repair_user = repair_user;
		this.service_user = service_user;
	}
	@Override
	public String toString() {
		return "RepairOrder [id=" + id + ", equipment_type=" + equipment_type + ", equipment_name=" + equipment_name
				+ ", equipment_build=" + equipment_build + ", equipment_floor=" + equipment_floor
				+ ", equipment_address=" + equipment_address + ", image=" + image + ", remark=" + remark + ", record="
				+ record + ", status=" + status + ", repair_user=" + repair_user + ", service_user=" + service_user
				+ "]";
	}
	
}
