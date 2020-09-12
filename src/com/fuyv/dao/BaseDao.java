package com.fuyv.dao;

import org.hibernate.SessionFactory;

public interface BaseDao<T> {

	public abstract void add(T t);
	public abstract void delete(T t);
	public abstract void update(T t);
	public abstract T search(T t);
	
	
}
