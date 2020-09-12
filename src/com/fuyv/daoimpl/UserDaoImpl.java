package com.fuyv.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fuyv.dao.UserDao;
import com.fuyv.model.User;

@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class UserDaoImpl implements UserDao {

	public SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	@Override
	public void add(User user) {
		System.out.println("已进入Dao层的UserDao的add方法，准备获取session以添加用户。");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  session.save(user);
		  tx.commit();//提交事务
		}catch(Exception e){
		  if(tx!=null){
		    tx.rollback();  //回滚事务
		  }
		}
		System.out.println("Dao层UserDao的add方法执行完毕，用户应当已经加入数据库中并展示在页面上。");
		
	}

	@Override
	public void delete(User user) {

		System.out.println("已进入Dao层的UserDao的delete方法，准备获取session以删除用户。");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  
		  String sql = "DELETE FROM d_user WHERE ID = "+user.getId();
		  session.createNativeQuery(sql).executeUpdate();
		  tx.commit();//提交事务
		  System.out.println("已成功删除用户");
		}catch(Exception e){
		System.out.println("出现错误，捕捉异常，回滚事务");
		  if(tx!=null){
		    tx.rollback();  //回滚事务
		  }
		}
	}

	@Override
	public void update(User user) {

		System.out.println("已进入Dao层的UserDao的update方法，准备获取session以修改用户。");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try{
		  tx = session.beginTransaction();  //开启事务//通过HQL查询创建一个处于持久化状态的对象
		  session.update(user);
		  tx.commit();//提交事务
		}catch(Exception e){
		  if(tx!=null){
		    tx.rollback();  //回滚事务
		  }
		}
		System.out.println("UserDaoImpl的update方法已经执行完毕，数据已经被添加到数据库中！");
	}

	@Override
	public User search(User user) {
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery("from User u where u.account = ?");
		q.setString(0,user.getAccount());
		List<User> list = (List<User>)q.list();
		
		if(list.size() <= 0 || list == null) {
			return null;
		}else {
			return (User)list.get(0);
		}
	}
}
