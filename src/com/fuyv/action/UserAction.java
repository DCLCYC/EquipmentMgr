package com.fuyv.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.fuyv.model.User;
import com.fuyv.dao.UserDao;
import com.fuyv.utils.MD5Utils;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements ModelDriven<User> {

	private UserDao userDao;
	private User user = new User();

	@Override
	public User getModel() {
		return user;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public String Login() {

		System.out.println("UserAction中的Login方法已被调用！");
		System.out.println("输出从前台获取到的账户信息：" + user.getAccount() + "," + user.getPassword());

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User temp = new User();
		temp = userDao.search(user);
		if (temp == null) {
			// 账号信息不存在，无法登录，发送提示信息，账号不存在。
			request.setAttribute("account_error_tip", "账号信息不存在！");
			return LOGIN;
		} else {
			if (MD5Utils.MD5(user.getPassword()).equalsIgnoreCase(temp.getPassword())) {
				// 密码比对成功，成功登录！
				session.setAttribute("nowuser", temp);
				// 此处应当是继续查询用户-角色-权限表，然后将urlList放入session新建的属性内，以供接下来检查用户权限使用！
				// 暂时省略。
				return SUCCESS;
			} else {
				// 密码比对失败，登陆错误，发送提示信息，密码错误
				request.setAttribute("pwd_error_tip", "账号或密码错误！");
				return LOGIN;
			}
		}
	}

	public String User_Logout() {

		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("nowuser");
		if (user != null) {
			session.setAttribute("nowuser", null);
			return "User_Logout_Success";
		}
		return "User_Logout_Success";

	}

	public String User_Add() {

		System.out.println("已经进入action层的userAction的添加用户方法！");
		System.out.println("从前台获取到的数据通过值栈传输后为：昵称--->" + user.getNickname() 
		+ "，账户--->" + user.getAccount() + "，密码--->"+ user.getPassword());
		
		User temp = userDao.search(user);
		if(temp == null) {
			//说明不存在此账号的账户，可以添加用户！
			user.setPassword(MD5Utils.MD5(user.getPassword()));
			
			userDao.add(user);
			
			return "User_Add_Success";
		}else {
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("user_add_fail", "已存在此账号，请勿重复添加！");
			return "User_Add_Fail";
			//存在此账号的用户，不允许添加！
		}
		
	}
	
	public String User_Delete(){
		
		System.out.println("已经进入action层的userAction的删除方法！");
		System.out.println("从前台获取到的数据通过值栈传输后为：id--->"+user.getId()+"昵称--->" + user.getNickname() 
		+ "，账户--->" + user.getAccount() + "，密码--->"+ user.getPassword());
		
		userDao.delete(user);
		
		
		return "User_Delete_Success";
	}

	public String User_Update() {
		
		System.out.println("已经进入action层的userAction的修改用户方法！");
		System.out.println("从前台获取到的数据通过值栈传输后为：新昵称--->" + user.getNickname() 
		+ "，新账户--->" + user.getAccount() + "，新密码--->"+ user.getPassword());
		
		user.setPassword(MD5Utils.MD5(user.getPassword()));
		
		userDao.update(user);
		
		return "User_Update_Success";
	}
	
	public String User_Manage_Role() {
		
		System.out.println("已进入UserAction的分配角色的方法！");
		System.out.println("输出User的值：ID-->"+user.getId()+",user_role-->"+user.getUser_role());
		userDao.update(user);
		return "User_Manage_Role_Success";
	}
}
