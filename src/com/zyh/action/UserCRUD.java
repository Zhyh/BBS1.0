package com.zyh.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import com.opensymphony.xwork2.ActionSupport;
import com.zyh.po.Category;
import com.zyh.po.Group;
import com.zyh.po.Msg;
import com.zyh.po.Topic;
import com.zyh.po.User;
import com.zyh.service.CategoryService;
import com.zyh.service.GroupService;
import com.zyh.service.MsgService;
import com.zyh.service.TopicService;
import com.zyh.service.UserService;
import com.zyh.utils.IPUtils;

@Component("user")
@Scope("prototype")
public class UserCRUD extends ActionSupport 
{
	private String username;
    private String psd;
    private String sex;
    private String bz;
    private String name;
    private String addr;
    private String phone;
    private String email;
    private int id;
    private User user;
    private UserService userService;
    private int flag;//判断是请求显示用户信息还是更新
    private List<User> uList;
    private List<Category> cList;
    private List<Topic> tList;
    private List<Msg> mList;
    private int pageNo;
    private int groupId;
    private Group group;
    private MsgService msgService;
    private TopicService topicService;
    private CategoryService categoryService;
    private int categoryId;
    private Category category;
    private int topicId;
    private GroupService groupService;
    HttpServletRequest request = ServletActionContext.getRequest();
    User  u = (User)request.getSession().getAttribute("loginUser");
    public String showUser()
    {
	   user = userService.getUser(id);
	   if (flag == 1)
	{
		   return "show";
	}
		return "update";
    }
   public String updateUser()
   {
	   if (u.getId() == id)
	{
		    u.setAddr(addr);
			u.setBz(bz);
			u.setEmail(email);
			u.setName(name);
			u.setPhone(phone);
			u.setPsd(psd);
			u.setSex(sex);
			userService.updateUser(u);
		   return SUCCESS;
	}
		return "error";
   }
   //添加版块版主
   public String grantRight()
   {
	   if (u.getGroup().getId() > 2)
	{
		user = userService.getUser(id);
		if(user.getGroup().getId() ==1 )
		{   //已经存在版主
			category = categoryService.getCategory(categoryId);
			if (category.getUser() != null)
			{
				System.out.println("此版块已有版主-----");
				return "error";
			}
			System.out.println("此版块没有版主-----");
			group = groupService.getGroup(user.getGroup().getId());
			group.getUsers().remove(user);
			
			category.setUser(user);
			System.out.println(category.getUser().getId()+"-------------");
			group = groupService.getGroup(2);
			group.getUsers().add(user);
			user.setGroup(group);
		    userService.updateUser(user);
		    System.out.println("授权成功-----");
		    return "grant";
		}
		System.out.println("此人权限大于或等于2-----");
		   return "error";
	}
	   System.out.println("你不够权限-----");
	   return "error";
   }
   public String demoteUser()
   {
	   user = userService.getUser(id);
	   //是版块版主的话应将版块的版主栏同时清空
	   if (user.getGroup().getId() == 2)
	{
		category = categoryService.pickCategory(id);
		category.setUser(null);
	}
	   group = groupService.getGroup(user.getGroup().getId());
	   group.getUsers().remove(user);
	   
	   group = groupService.getGroup(1);
	   user.setGroup(group);
	   userService.updateUser(user);
	   return "demote";
   }
   public String showAllUsers()
   {
	  uList = userService.getAllUsers(groupId,pageNo);
      if(groupId == 2 || groupId == 3)
	   {
	      return "monitorAdmin";
	   }else  
		  return "userAdmin"; 
   }
   
   public String removeUser()
  {    
	   user = userService.getUser(id);
	   if (user.getGroup().getId() == 2)
		{
			category = categoryService.pickCategory(id);
			category.setUser(null);
		}
	   group = groupService.getGroup(user.getGroup().getId());
	   group.getUsers().remove(user);
		userService.delUser(id);
		return "remove"; 
  }
    public String lockUser()
    {
    	 user = userService.getUser(id);
         user.setStatus(1);
         userService.updateUser(user);
         return "lock";
    }
    public String unLockUser()
    {
   		 user = userService.getUser(id);
         user.setStatus(0);
         userService.updateUser(user);
         return "unLock";
    }
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	
	public UserService getUserService()
	{
		return userService;
	}
	@Resource
	public void setUserService(UserService userService)
	{
		this.userService = userService;
	}
	public User getUser()
	{
		return user;
	}
	public void setUser(User user)
	{
		this.user = user;
	}
	public int getFlag()
	{
		return flag;
	}
	public void setFlag(int flag)
	{
		this.flag = flag;
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
	public List<User> getUList()
	{
		return uList;
	}
	public void setUList(List<User> uList)
	{
		this.uList = uList;
	}
	public int getGroupId()
	{
		return groupId;
	}
	public void setGroupId(int groupId)
	{
		this.groupId = groupId;
	}
	public int getPageNo()
	{
		return pageNo;
	}
	public void setPageNo(int pageNo)
	{
		this.pageNo = pageNo;
	}
	public MsgService getMsgService()
	{
		return msgService;
	}
	@Resource
	public void setMsgService(MsgService msgService)
	{
		this.msgService = msgService;
	}
	public TopicService getTopicService()
	{
		return topicService;
	}
	@Resource
	public void setTopicService(TopicService topicService)
	{
		this.topicService = topicService;
	}
	public List<Category> getCList()
	{
		return cList;
	}
	public void setCList(List<Category> cList)
	{
		this.cList = cList;
	}
	public List<Topic> getTList()
	{
		return tList;
	}
	public void setTList(List<Topic> tList)
	{
		this.tList = tList;
	}
	public CategoryService getCategoryService()
	{
		return categoryService;
	}
	@Resource
	public void setCategoryService(CategoryService categoryService)
	{
		this.categoryService = categoryService;
	}
	public List<Msg> getMList()
	{
		return mList;
	}
	public void setMList(List<Msg> mList)
	{
		this.mList = mList;
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
	public Group getGroup()
	{
		return group;
	}
	public void setGroup(Group group)
	{
		this.group = group;
	}
	public int getCategoryId()
	{
		return categoryId;
	}
	public void setCategoryId(int categoryId)
	{
		this.categoryId = categoryId;
	}
	public Category getCategory()
	{
		return category;
	}
	public void setCategory(Category category)
	{
		this.category = category;
	}
	public int getTopicId()
	{
		return topicId;
	}
	public void setTopicId(int topicId)
	{
		this.topicId = topicId;
	}
	
}
