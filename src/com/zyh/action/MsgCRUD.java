package com.zyh.action;

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
import com.zyh.po.Msg;
import com.zyh.po.Topic;
import com.zyh.po.User;
import com.zyh.service.CategoryService;
import com.zyh.service.MsgService;
import com.zyh.service.TopicService;
import com.zyh.service.UserService;

@Component("msg")
@Scope("prototype")
public class MsgCRUD  extends ActionSupport
{
	  private MsgService service;
	  private List<Msg> mList;
	  private int id;
	  private int topicId;
	  private String content;
	  private int pageNo;
	  private Topic topic;
	  private TopicService topicService;
	  private int toLayerUserId;
	  private CategoryService categoryService;
	  private UserService userService;
	  //返回到对应板块的列表
	  private int categoryId;
	  private int toLayer;
	  HttpServletRequest request = ServletActionContext.getRequest();
	  User  u = (User)request.getSession().getAttribute("loginUser");
	 public String addMsg()
	 {
		 User u = (User) ActionContext.getContext().getSession().get("loginUser");
		 topic = topicService.getTopic(topicId);
		 Category c = topic.getCategory();
		 if ((u.getStatus() == 0 ) && (topic.getStatus() == 0) && (c.getStatus() == 0))
			{
				
		 u.setScore(u.getScore()+1);
		 u.setMsgNum(u.getMsgNum()+1);
		 userService.updateUser(u);
		 
		 
		 topic.setLayers(topic.getLayers()+1);
		 topic.setMsgNum(topic.getMsgNum()+1);
		 topic.setLastPostUserName(u.getUsername());
		 topicService.update(topic);
		 
		
		 c.setMsgNum(c.getMsgNum()+1);
		 c.setTodayPostNum(c.getTodayPostNum()+1);
		 categoryService.update(c);
		 
		Msg m = new Msg();
		 m.setContent(content);
		 m.setUser(u);
		 m.setToLayer(toLayer);
		 m.setToLayerUserId(toLayerUserId);
		 m.setTopic(topic);
		 m.setLayer(topic.getLayers());
		 service.addMsg(m);
	   	  return SUCCESS;
		}
	 return "error";
	 }
	  public String removeMsg()
	  {

		  int groupId = u.getGroup().getId();
		  if (groupId > 2 || ( u.getId() == service.getMsg(id).getTopic().getCategory().getUser().getId()))
		{
			  service.delMsg(id);
	          return SUCCESS;
		}
			return "error";
	  }
	  
	  public String getAllMsgs()
	  {
		  topic = topicService.getTopic(topicId);
		  mList = service.getAllMsgs(topicId,pageNo);
		  return SUCCESS;
	  }
	  
	  
	  
	  
	public MsgService getService()
	{
		return service;
	}
	@Resource
	public void setService(@Qualifier("msgService") MsgService service)
	{
		this.service = service;
	}
	public List<Msg> getMList()
	{
		return mList;
	}
	public void setMList(List<Msg> mList)
	{
		this.mList = mList;
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
	public int getTopicId()
	{
		return topicId;
	}
	public void setTopicId(int topicId)
	{
		this.topicId = topicId;
	}
	public int getPageNo()
	{
		return pageNo;
	}
	public void setPageNo(int pageNo)
	{
		this.pageNo = pageNo;
	}
	public Topic getTopic()
	{
		return topic;
	}
	public void setTopic(Topic topic)
	{
		this.topic = topic;
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
	public int getToLayerUserId()
	{
		return toLayerUserId;
	}
	public void setToLayerUserId(int toLayerUserId)
	{
		this.toLayerUserId = toLayerUserId;
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
	public int getToLayer()
	{
		return toLayer;
	}
	public void setToLayer(int toLayer)
	{
		this.toLayer = toLayer;
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
	public int getCategoryId()
	{
		return categoryId;
	}
	public void setCategoryId(int categoryId)
	{
		this.categoryId = categoryId;
	}
	
}
