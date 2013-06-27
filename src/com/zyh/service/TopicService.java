package com.zyh.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.zyh.dao.TopicDao;
import com.zyh.po.Topic;

@Component("topicService")
public class TopicService
{
   private TopicDao topicDao;
    
   @Transactional(propagation=Propagation.REQUIRED)
   public boolean addTopic(Topic t)
   {
	   return topicDao.save(t);
   }
   @Transactional(propagation=Propagation.REQUIRED)
   public boolean update(Topic t)
   {
	   return topicDao.update(t);
   }
   
   @Transactional(readOnly=true)
   public List<Topic> getAllTopics(int categoryId,int pageNo)
   {
	   return topicDao.showAllTopics(categoryId,pageNo);
   }
   
   @Transactional(readOnly=true)
   public List<Topic> getZDTopics(int categoryId)
   {
	   return topicDao.showZDTopics(categoryId);
   }
   
   @Transactional(readOnly=true)
   public List<Topic> getQZDTopics()
   {
	   return topicDao.showQZDTopics();
   }
   
   @Transactional(propagation=Propagation.REQUIRED)
   public boolean delTopic(int id)
   {
	   return topicDao.delTopic(id);
   }
   
  /* @Transactional(propagation=Propagation.REQUIRED)
   public boolean delTopics(int userId)
   {
	   return topicDao.delTopics(userId);
   }*/
   
   @Transactional(readOnly=true)
   public Topic getTopic(int id)
   {
	   return topicDao.getTopic(id);
   }
   
   @Transactional(propagation=Propagation.REQUIRED)
   public boolean insertMsg(int topicId)
   {
	   return topicDao.insertMsg(topicId);
   }
   
    
	public TopicDao getTopicDao()
	{
		return topicDao;
	}
	@Resource
	public void setTopicDao(@Qualifier("topicDao") TopicDao topicDao)
	{
		this.topicDao = topicDao;
	}
   
   
  
   
   
   
   
   
   
}
