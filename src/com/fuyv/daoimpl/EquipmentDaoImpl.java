package com.fuyv.daoimpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.fuyv.dao.EquipmentDao;
import com.fuyv.model.Equipment;

public class EquipmentDaoImpl implements EquipmentDao {

	public SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void add(Equipment equipment) {
		System.out.println("已进入Dao层的设备daoimpl的addequip方法！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  session.save(equipment);
		  tx.commit();//提交事务
		}catch(Exception e){
		  if(tx!=null){
		    tx.rollback();  //回滚事务
		  }
		}
		System.out.println("方法执行完毕，设备信息已被添加!");
	}

	@Override
	public void delete(Equipment equipment) {
		System.out.println("已进入Dao层的设备daoimpl的deleteEquip方法！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  session.delete(equipment);
		  tx.commit();//提交事务
		}catch(Exception e){
		  if(tx!=null){
		    tx.rollback();  //回滚事务
		  }
		}
		System.out.println("方法执行完毕，设备信息已被删除!");
	}

	@Override
	public void update(Equipment equipment) {
		System.out.println("已进入Dao层的设备daoimpl的updateEquip方法！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  session.update(equipment);
		  tx.commit();//提交事务
		}catch(Exception e){
		  if(tx!=null){
		    tx.rollback();  //回滚事务
		  }
		}
		System.out.println("方法执行完毕，设备信息已被删除!");
	}

	@Override
	public Equipment search(Equipment equipment) {

		return null;
	}

}
