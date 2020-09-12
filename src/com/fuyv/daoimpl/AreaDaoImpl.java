package com.fuyv.daoimpl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import com.fuyv.dao.AreaDao;
import com.fuyv.model.Area;


@Transactional
public class AreaDaoImpl implements AreaDao{

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void add(Area area) {
		System.out.println("已进入Dao层的AreaDao的addArea方法，准备获取session以添加区域记录。");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  session.save(area);
		  tx.commit();//提交事务
		}catch(Exception e){
		  if(tx!=null){
		    tx.rollback();  //回滚事务
		  }
		}
		System.out.println("Dao层AreaDao的addArea方法执行完毕，区域记录应当已经加入数据库中并展示在页面上。");
	}
	@Override
	public void delete(Area area) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  session.delete(area);  //删除指定的用户信息
		  tx.commit();//提交事务
		}catch(Exception e){
		  if(tx!=null){
		    tx.rollback();  //回滚事务
		  }
		}
	}
	@Override
	public void update(Area area) {
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  session.update(area);  //删除指定的用户信息
		  tx.commit();//提交事务
		}catch(Exception e){
		  if(tx!=null){
		    tx.rollback();  //回滚事务
		  }
		}
	}
	@Override
	public Area search(Area area) {
		// TODO Auto-generated method stub
		return null;
	}

}
