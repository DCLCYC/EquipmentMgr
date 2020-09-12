package com.fuyv.interceptor;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.fuyv.model.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		System.out.println("拦截器被调用！");
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("nowuser");
		System.out.println("拦截器获得的登录用户：");
		System.out.println(user);
		System.out.println(user == null);
		if(user != null) {
			return arg0.invoke();
		}else {
			return "nologin";
		}
		
		
	}

	
	
}
