package com.zyh.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.zyh.po.User;

public class UserCRUDInterceptor implements Interceptor
{

	public void destroy(){}

	public void init(){}

	public String intercept(ActionInvocation ai) throws Exception
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User) request.getSession().getAttribute("loginUser");
		if (user.getGroup().getId() > 3)
		{
			return ai.invoke();
		}
		return "error";
	}

}
