package com.fuyv.dao;

import com.fuyv.model.Role;

public interface RoleDao extends BaseDao<Role>{

	public void deletePermission(Role role);
	public void addPermission(int role_id, String[] temp);
}
