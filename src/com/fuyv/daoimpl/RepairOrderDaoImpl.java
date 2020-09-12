package com.fuyv.daoimpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.fuyv.dao.RepairOrderDao;
import com.fuyv.model.RepairOrder;

public class RepairOrderDaoImpl implements RepairOrderDao {

	public SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void add(RepairOrder repairOrder) {

		System.out.println("已进入报修单的DaoImpl的添加方法！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  session.save(repairOrder);
		  tx.commit();//提交事务
		  System.out.println("添加成功！");
		}catch(Exception e){
			System.out.println("出现了异常！添加异常！");
			if(tx!=null){
				tx.rollback();  //回滚事务
			}
		}
	}

	@Override
	public void delete(RepairOrder t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(RepairOrder t) {
	}

	@Override
	public RepairOrder search(RepairOrder t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteByID(int id) {

		System.out.println("已进入报修单的DaoImpl的删除方法！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  
		  String sql = "DELETE FROM repairorder WHERE ID = "+id;
		  session.createNativeQuery(sql).executeUpdate();
		  tx.commit();//提交事务
		  System.out.println("删除成功！");
		}catch(Exception e){
			System.out.println("出现了异常！删除异常！");
			if(tx!=null){
				tx.rollback();  //回滚事务
			}
		}
	}

	@Override
	public void updateByShareUser(int repairOrder_id, int serviceUser_id) {

		System.out.println("已进入报修单的DaoImpl的调度员分配方法！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  String sql = "UPDATE repairorder SET SERVICE_USER = "+serviceUser_id+" WHERE ID = "+repairOrder_id;
		  session.createNativeQuery(sql).executeUpdate();
		  tx.commit();//提交事务
		  System.out.println("分配维修员成功！");
		}catch(Exception e){
			System.out.println("出现了异常！");
			if(tx!=null){
				tx.rollback();  //回滚事务
			}
		}
	}

	@Override
	public void updateByServiceUser(int repairOrder_id, String record) {

		
		System.out.println("已进入报修单的DaoImpl的维修员填写回执方法！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  String sql = "UPDATE repairorder SET record = '"+record+"', STATUS = 1 WHERE ID = "+repairOrder_id;
		  session.createNativeQuery(sql).executeUpdate();
		  tx.commit();//提交事务
		  System.out.println("维修员填写回执成功！");
		}catch(Exception e){
			System.out.println("出现了异常！");
			if(tx!=null){
				tx.rollback();  //回滚事务
			}
		}
		
	}

	

}
