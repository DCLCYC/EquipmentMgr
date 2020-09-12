package com.fuyv.dao;

import com.fuyv.model.Permission;
import com.fuyv.model.RepairOrder;

public interface RepairOrderDao extends BaseDao<RepairOrder> {

	public void deleteByID(int id);
	public void updateByShareUser(int repairOrder_id, int serviceUser_id);
	public void updateByServiceUser(int repairOrder_id, String record);
}
