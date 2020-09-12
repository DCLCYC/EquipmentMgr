package com.fuyv.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.fuyv.dao.RoleDao;
import com.fuyv.dao.UserDao;
import com.fuyv.model.Role;
import com.fuyv.model.User;

public class RoleDaoImpl implements RoleDao {

	public SessionFactory sessionFactory;
	public UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void add(Role role) {
		System.out.println("已经进入了角色的Daoimpl类的添加方法！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction(); // 开启事务//通过HQL查询创建一个处于持久化状态的对象
			session.save(role); // 删除指定的用户信息
			tx.commit();// 提交事务
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback(); // 回滚事务
			}
		}
		System.out.println("角色信息添加成功");
	}

	@Override
	public void delete(Role role) {
		System.out.println("已经进入了角色的Daoimpl类的删除方法！应当首先改变role对应的user表中的用户的user_role字段"
				+ "将其改为空，即删除一个角色就代表着删除了一个用户已经分配过的角色且删除了这个角色对应的所有权限！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction(); // 开启事务//通过HQL查询创建一个处于持久化状态的对象
			// session.save(role); //删除指定的用户信息

			// 查询用户表，准备修改
			String sql = "select * from d_user where user_role = " + role.getId();
			@SuppressWarnings("unchecked")
			List<Object[]> user_list = session.createNativeQuery(sql).list();
			if (user_list.size() == 0 || user_list == null) {
				// 如果该角色没有被分配给任何用户，则不对用户表进行操作
				System.out.println("该角色没有被分配给任何用户！");
			} else {
				// 如果该角色被分配给一个用户，则先修改该用户，将其user_role置为空

				Object[] temp = user_list.get(0);
				System.out.println("该角色被分配给了ID为：" + temp[0] + "的用户，准备将该用户的user_role字段置为空！");
				User user_temp = new User(Integer.parseInt(String.valueOf(temp[0])), String.valueOf(temp[1]),
						String.valueOf(temp[2]), String.valueOf(temp[3]));
				userDao.update(user_temp);
			}

			// 查询角色权限关联表，准备删除该表中的记录。
			String sql_2 = "select * from d_role_permission where role_id = " + role.getId();
			List<Object[]> role_permission_list = session.createNativeQuery(sql_2).list();
			if (role_permission_list == null || role_permission_list.size() == 0) {
				// 说明该角色没有被分配给任何权限，可以直接删除该角色
				System.out.println("该角色没有任何权限，准备直接删除该角色");
				session.delete(role);
			} else {
				// 如果该角色已经被分配了权限。
				// 先试试级联删除。
				System.out.println("准备级联删除角色表和角色权限关联表中的数据");
				session.delete(role);
			}
			tx.commit();// 提交事务
			System.out.println("角色信息删除成功，大功告成");
		} catch (Exception e) {
			System.out.println("出现了未知的异常，事务回滚，方法执行失败");
			if (tx != null) {
				tx.rollback(); // 回滚事务
			}
		}

	}

	@Override
	public void update(Role role) {
		System.out.println("已经进入了角色的Daoimpl类的添加方法！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction(); // 开启事务//通过HQL查询创建一个处于持久化状态的对象
			session.save(role); // 删除指定的用户信息
			tx.commit();// 提交事务
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback(); // 回滚事务
			}
		}
		System.out.println("角色信息添加成功");

	}

	@Override
	public Role search(Role t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deletePermission(Role role) {

		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction(); // 开启事务//通过HQL查询创建一个处于持久化状态的对象

			// 查询角色权限关联表，准备删除该表中的记录。
			String sql_2 = "delete from d_role_permission where role_id = " + role.getId();
			session.createNativeQuery(sql_2).executeUpdate();
			tx.commit();// 提交事务
			System.out.println("角色权限关联表中的数据删除成功，大功告成");
		} catch (Exception e) {
			System.out.println("出现了未知的异常，事务回滚，方法执行失败");
			if (tx != null) {
				tx.rollback(); // 回滚事务
			}
		}
	}

	@Override
	public void addPermission(int role_id, String[] temp) {
		System.out.println("已进入角色的DaoImpl层的添加权限的方法！");
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction(); // 开启事务//通过HQL查询创建一个处于持久化状态的对象

			for (int i = 0; i < temp.length; i++) {
				String sql = "insert into d_role_permission(ROLE_ID, PERMISSION_ID) values("+role_id+","+temp[i]+")";
				session.createNativeQuery(sql).executeUpdate();
			}
			tx.commit();// 提交事务
			System.out.println("大功告成");
		} catch (Exception e) {
			System.out.println("出现了未知的异常，事务回滚，方法执行失败");
			if (tx != null) {
				tx.rollback(); // 回滚事务
			}
		}

	}

}
