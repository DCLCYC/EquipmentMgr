package com.fuyv.model;

public class Area {

	private int id;//区域自动生成id
	private int build;//区域楼栋号
	private int floor;//区域楼层号
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBuild() {
		return build;
	}
	public void setBuild(int build) {
		this.build = build;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public Area() {
		super();
	}
	public Area(int id, int build, int floor) {
		super();
		this.id = id;
		this.build = build;
		this.floor = floor;
	}
	
	
}
