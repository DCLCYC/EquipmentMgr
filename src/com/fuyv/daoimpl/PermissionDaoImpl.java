package com.fuyv.daoimpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.fuyv.dao.PermissionDao;
import com.fuyv.model.Permission;

public class PermissionDaoImpl implements PermissionDao {

	public SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void add(Permission permission) {
		System.out.println("已经进入了权限的daoimpl类的添加方法！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  session.save(permission);  //删除指定的用户信息
		  tx.commit();//提交事务
		}catch(Exception e){
		  if(tx!=null){
		    tx.rollback();  //回滚事务
		  }
		}
		
	}

	@Override
	public void delete(Permission permission) {
		System.out.println("已经进入了PermissionDaoimpl类的删除方法！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  
		  String sql = "delete from d_role_permission where permission_id = " + permission.getId();
		  session.createNativeQuery(sql).executeUpdate();
		  String sql2 = "delete from permission where id = "+permission.getId();
		  session.createNativeQuery(sql2).executeUpdate();
		  tx.commit();
		}catch(Exception e){
		  if(tx!=null){
		    tx.rollback();  //回滚事务
		  }
		}
	}

	@Override
	public void update(Permission permission) {
		System.out.println("已经进入了PermissionDaoimpl类的修改方法！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  session.update(permission);  //删除指定的用户信息
		  tx.commit();//提交事务
		}catch(Exception e){
		  if(tx!=null){
		    tx.rollback();  //回滚事务
		  }
		}

	}

	@Override
	public Permission search(Permission t) {
		// TODO Auto-generated method stub
		return null;
	}

}
