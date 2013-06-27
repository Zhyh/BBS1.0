package com.zyh.test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import junit.framework.Assert;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import com.zyh.action.CategoryCRUD;
import com.zyh.action.MsgCRUD;
import com.zyh.action.TopicCRUD;
import com.zyh.po.Category;
import com.zyh.po.Msg;
import com.zyh.po.Topic;
import com.zyh.po.User;
import com.zyh.service.CategoryService;
import com.zyh.service.MsgService;
import com.zyh.service.TopicService;
import com.zyh.service.UserService;
@ContextConfiguration(locations={"classpath:beans-conf.xml"})
public class ServiceTest extends AbstractTransactionalJUnit4SpringContextTests
{
	private TopicService topicService;
	private MsgService msgService;
	private CategoryService categoryService;
	private UserService userService;
	private Topic topic;
	private Msg msg;
	private User user;
	private Category category;
	
	@Test
	public void testTopic() throws Exception
	{
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("beans-conf.xml");
		topicService = ac.getBean("topicService",TopicService.class);
		topic = topicService.getTopic(4);
		topic.setTitle("你们什么时候去吃饭？");
        System.out.println("---msgNum="+topic.getMsgNum());
		topic.setMsgNum(topic.getMsgNum()+1);
		topicService.update(topic);
		
		category = topic.getCategory();
		System.out.println("---category.name="+category.getName()+category.getMsgNum());
		category.setMsgNum(category.getMsgNum()+1);
		categoryService.update(category);
		
		user = userService.getUser("zhang", "zhang");
		user.setBz("我是一名管理员");
		userService.updateUser(user);
		
	}
	
	@Test
	public void testMsg() throws Exception
	{
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("beans-conf.xml");
		MsgCRUD mc = ac.getBean("msg",MsgCRUD.class);
		List<Msg> list = msgService.getAllMsgs(1,1);
		System.out.println(list.size()+"---");
	}
	@Test
	public void testCategoryByPage() throws Exception
	{
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("beans-conf.xml");
		CategoryCRUD cc = ac.getBean("category",CategoryCRUD.class);
		List<Category> list = categoryService.getAllCategories(8);
		System.out.println(list.size()+"---");
	}
	@Test
	public void testCategoryGetTopicNum()
	{
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("beans-conf.xml");
		CategoryCRUD cc = ac.getBean("category",CategoryCRUD.class);
		//Assert.assertEquals("success", cc.getAllCategories());
		System.out.println(new Timestamp(new Date().getTime()));
	}
	
	@Test
	public void testTime()
	{
		Date date1 = new Date();
		Date date2 = categoryService.getCategory(1).getLastPostTime();
		System.out.println(date1.getDate());
			if (date1.getDate()>date2.getDate())
			{
				System.out.println("1");
			}
			else {System.out.println("2");}
	}
	
	
	
	
	
	
	
	
	public TopicService getTopicService()
	{
		return topicService;
	}
	@Resource
	public void setTopicService(@Qualifier("topicService") TopicService topicservice)
	{
		this.topicService = topicservice;
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

	public CategoryService getCategoryService()
	{
		return categoryService;
	}
     @Resource
	public void setCategoryService(CategoryService categoryService)
	{
		this.categoryService = categoryService;
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

}
