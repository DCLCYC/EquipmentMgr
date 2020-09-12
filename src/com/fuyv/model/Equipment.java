package com.fuyv.model;

public class Equipment {

	private int id;//设备编号
	private String name;//设备名称
	private int type;//设备类型，通过0，1，2，3，4，5。。。写死
	
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
	public Equipment() {
		super();
	}
	public Equipment(int id, String name, int type) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
	}
	
}
