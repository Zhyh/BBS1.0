package com.zyh.action;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zyh.po.Category;
import com.zyh.po.Topic;
import com.zyh.po.User;
import com.zyh.service.CategoryService;
import com.zyh.service.TopicService;
import com.zyh.service.UserService;

@Component("topic")
@Scope("prototype")
public class TopicCRUD  extends ActionSupport
{
	  private String title;
	  private int id;
	  private int categoryId;
	  private TopicService service;
	  //普通帖子列表
	  private List<Topic> tList;
	  //本版置顶帖子列表
	  private List<Topic> ttList;
	  //全站置顶帖子列表
	  private List<Topic> tttList;
	  private String content;
	  private int pageNo;
	  private CategoryService categoryService;
	  private Category category;
	  private UserService userService;
	  private Topic topic;
	  HttpServletRequest request = ServletActionContext.getRequest();
	  User  u = (User)request.getSession().getAttribute("loginUser");
	  public String addTopic()
	  {
		  User u = (User) ActionContext.getContext().getSession().get("loginUser");
		  category = categoryService.getCategory(categoryId);
		  if ((u.getStatus() == 0) && (category.getStatus() == 0))
		{
		  u.setScore(u.getScore()+2);
		  u.setTopicNum(u.getTopicNum()+1);
		  userService.updateUser(u);
		  
		 
		  category.setTopicNum(category.getTopicNum()+1);
		  category.setTodayPostNum(category.getTodayPostNum()+1);
		  categoryService.update(category);
		  
		  Topic t = new Topic();
		  t.setTitle(title);
		  t.setContent(content);
		  t.setCategory(category);
		  
		  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		  t.setCreateDate(df.format(new Date()));
		  t.setUser(u);
		  t.setLastPostUserName(u.getUsername());
		  t.setLayers(1);
		  service.addTopic(t);
		 return SUCCESS;
		}
		  return "error";
	  }
	  
	  public String getAllTopics()
	  {
		  tList = service.getAllTopics(categoryId,pageNo);
		  ttList = service.getZDTopics(categoryId);
		  tttList = service.getQZDTopics();
		  category = categoryService.getCategory(categoryId);
			 return SUCCESS;
	  }
	  
	  public String removeTopic()
	  {
		  int groupId = u.getGroup().getId();
		  if (service.getTopic(id).getType()>2)
		{
			if (groupId > 2)
			{
				 service.delTopic(id);
		         return SUCCESS;
			}
		}
		  if (groupId > 2 || (u.getId() == service.getTopic(id).getCategory().getUser().getId()))
		{
			  service.delTopic(id);
	          return SUCCESS;
		}
			return "error";
	  }
	  public String lockTopic()
	  {
		  int groupId = u.getGroup().getId();
		  if (service.getTopic(id).getType()>2)
			{
				if (groupId > 2)
				{
					 topic = service.getTopic(id);
					  topic.setStatus(1);
					  service.update(topic);
			          return "lock";
				}
			}
		  if (groupId > 2 || (u.getId() == service.getTopic(id).getCategory().getUser().getId()))
		{
			  topic = service.getTopic(id);
			  topic.setStatus(1);
			  service.update(topic);
	          return "lock";
		}
			return "error";
	  }
	  
	  public String unLockTopic()
	  {
		  int groupId = u.getGroup().getId();
		  if (service.getTopic(id).getType()>2)
			{
				if (groupId > 2)
				{
					 topic = service.getTopic(id);
					  topic.setStatus(0);
					  service.update(topic);
			          return "unLock";
				}
			}
		  if (groupId > 2 || (u.getId() == service.getTopic(id).getCategory().getUser().getId()))
		{
			  topic = service.getTopic(id);
			  topic.setStatus(0);
			  service.update(topic);
	          return "unLock";
		}
			return "error";
	  }
	  
	  public String ZDTopic()
	  {
		  int groupId = u.getGroup().getId();
		  if (groupId > 2 || (u.getId() == service.getTopic(id).getCategory().getUser().getId()))
		{
			  topic = service.getTopic(id);
			  topic.setType(2);
			  service.update(topic);
	          return "zd";
		}
			return "error";
	  }
	  
	  public String unZDTopic()
	  {
		  int groupId = u.getGroup().getId();
		  if (groupId > 2 || (u.getId() == service.getTopic(id).getCategory().getUser().getId()))
		{
			  topic = service.getTopic(id);
			  topic.setType(1);
			  service.update(topic);
	          return "unZd";
		}
			return "error";
	  }
	  
	  public String QZDTopic()
	  {
		  int groupId = u.getGroup().getId();
				if (groupId > 2)
				{
					 topic = service.getTopic(id);
					  topic.setType(3);
					  service.update(topic);
			          return "qzd";
				}
			return "error";
	  }
	  
	  public String unQZDTopic()
	  {
		  int groupId = u.getGroup().getId();
				if (groupId > 2)
				{
					 topic = service.getTopic(id);
					  topic.setType(1);
					  service.update(topic);
			          return "unQzd";
				}
			return "error";
	  }
	  
	  
	  
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public TopicService getService()
	{
		return service;
	}
	@Resource
	public void setService(@Qualifier("topicService") TopicService service)
	{
		this.service = service;
	}
	public List<Topic> getTList()
	{
		return tList;
	}
	public void setTList(List<Topic> tList)
	{
		this.tList = tList;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getCategoryId()
	{
		return categoryId;
	}
 
	public void setCategoryId(int categoryId)
	{
		this.categoryId = categoryId;
	}

	public int getPageNo()
	{
		return pageNo;
	}

	public void setPageNo(int pageNo)
	{
		this.pageNo = pageNo;
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

	public Category getCategory()
	{
		return category;
	}

	public void setCategory(Category category)
	{
		this.category = category;
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

	public Topic getTopic()
	{
		return topic;
	}

	public void setTopic(Topic topic)
	{
		this.topic = topic;
	}

	public List<Topic> getTtList()
	{
		return ttList;
	}

	public void setTtList(List<Topic> ttList)
	{
		this.ttList = ttList;
	}

	public List<Topic> getTttList()
	{
		return tttList;
	}

	public void setTttList(List<Topic> tttList)
	{
		this.tttList = tttList;
	}
}
