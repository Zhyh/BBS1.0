package com.zyh.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import com.opensymphony.xwork2.ActionSupport;
import com.zyh.po.Group;
import com.zyh.po.User;
import com.zyh.service.GroupService;
import com.zyh.service.UserService;
import com.zyh.utils.IPUtils;
@Component("registerAndLogin")
@Scope("prototype")
public class RegisterAndLogin extends ActionSupport
{
 
    private UserService service;
    private String username;
    private String psd;
    private String sex;
    private String bz;
    private String name;
    private String addr;
    private String phone;
    private String email;
    private GroupService groupService;
	public String register() throws Exception
	{
		// TODO Auto-generated method stub
		User user = new User();
		user.setAddr(addr);
		user.setUsername(username);
		user.setBz(bz);
		user.setEmail(email);
		user.setName(name);
		user.setPhone(phone);
		user.setPsd(psd);
		user.setSex(sex);
		Group g = groupService.getGroup(1);
		user.setGroup(g);
		g.getUsers().add(user);
		if(service.addUser(user))
		{
			return "login";
		}
		return "register";
	}
	
    public String login()
    {
    	User user = service.getUser(username, psd);
    	if(user != null)
    	{
    		HttpServletRequest request = ServletActionContext.getRequest();
    		request.getSession().setAttribute("loginUser", user);
    		user.setIP(IPUtils.getRemoteAddr(request));
    		user.setScore(user.getScore()+1);
				return SUCCESS;
    	}
    	return "login";
    }
    
    public String adminLogin()
    {
    	User user = service.getUser(username, psd);
    	if(user != null && user.getGroup().getId() >= 3)
    	{
    		HttpServletRequest request = ServletActionContext.getRequest();
    		user.setIP(IPUtils.getRemoteAddr(request));
    		user.setScore(user.getScore()+1);
    	    request.getSession().setAttribute("loginUser", user);
			return "admin"; 
    	}
    	return "login";
    }
   
    public String exit()
    {
    	HttpServletRequest request = ServletActionContext.getRequest();
    	request.getSession().removeAttribute("loginUser");
    	return "login";
    }
    
	public UserService getService()
	{
		return service;
	}
    @Resource
	public void setService(@Qualifier("userService") UserService service)
	{
		this.service = service;
	}


	public String getUsername()
	{
		return username;
	}


	public void setUsername(String username)
	{
		this.username = username;
	}


	public String getPsd()
	{
		return psd;
	}


	public void setPsd(String psd)
	{
		this.psd = psd;
	}


	public String getSex()
	{
		return sex;
	}


	public void setSex(String sex)
	{
		this.sex = sex;
	}


	public String getBz()
	{
		return bz;
	}


	public void setBz(String bz)
	{
		this.bz = bz;
	}


	public String getName()
	{
		return name;
	}


	public void setName(String name)
	{
		this.name = name;
	}


	public String getAddr()
	{
		return addr;
	}


	public void setAddr(String addr)
	{
		this.addr = addr;
	}


	public String getPhone()
	{
		return phone;
	}


	public void setPhone(String phone)
	{
		this.phone = phone;
	}


	public String getEmail()
	{
		return email;
	}


	public void setEmail(String email)
	{
		this.email = email;
	}

	public GroupService getGroupService()
	{
		return groupService;
	}
    @Resource
	public void setGroupService(GroupService groupService)
	{
		this.groupService = groupService;
	}
	

	

}
