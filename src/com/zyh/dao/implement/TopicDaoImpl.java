package com.zyh.dao.implement;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.zyh.dao.TopicDao;
import com.zyh.po.Topic;
@Component("topicDao")
public class TopicDaoImpl implements TopicDao
{
     private SessionFactory sessionFactory;
     private int pageSize=8;
	public boolean save(Topic t)
	{
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
		return true;
	}

	public List<Topic> showAllTopics(int categoryId,int pageNo)
	{
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Topic t where categoryId = :categoryId and type = 1 order by lastPostTime desc");
		q.setParameter("categoryId",categoryId);
		int count = getPageCount(categoryId);
		if (pageNo > count)
		{
			pageNo = count;
		}else if(pageNo < 0)
		{
			pageNo = 1;
		}
		q.setFirstResult((pageNo-1)*pageSize);
		q.setMaxResults(pageSize);
		ActionContext.getContext().put("topicPageCount", count);
		return q.list();
	}
	public List<Topic> showZDTopics(int categoryId)
	{
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Topic t where categoryId = :categoryId and type = 2 order by lastPostTime desc");
		q.setParameter("categoryId",categoryId);
		return q.list();
	}

	public List<Topic> showQZDTopics()
	{
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Topic t where  type = 3 order by lastPostTime desc");
		return q.list();
	}
     public Topic getTopic(int id)
     {
        Session session = sessionFactory.getCurrentSession();
 		Query q = session.createQuery("from Topic t where id = :id");
 		q.setParameter("id",id);
 		
 		return (Topic)q.uniqueResult();
     }
     
     public List<Topic> getTopics(int userId, int pageNo)
 	{
 		// TODO Auto-generated method stub
 		return null;
 	}

 	
	public boolean delTopic(int id)
	{
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete from Msg m where topicId = :id)");
		Query q = session.createQuery("delete from Topic t where id = :id");
        query.setParameter("id", id);
		q.setParameter("id",id);
		query.executeUpdate();
		if (q.executeUpdate()>0)
		{
			return true;
		}
		return false;
	}

	public boolean update(Topic t)
	{
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
		return true;
	}
	public boolean insertMsg(int topicId)
	{
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("update Topic t set layers=layers+1,msgNum=msgNum+1" +
				"where id = :id");
		q.setParameter("id", topicId);
		if (q.executeUpdate()>0)
		{
			return true;
		}
		return false;
	}
	
	public int getPageCount(int categoryId)
	{
		// TODO Auto-generated method stub
		int count = getTopicNum(categoryId);
		if (count % pageSize == 0)
		{
			return count / pageSize;
		}
		return count  /pageSize + 1;
	}
	public int getTopicNum(int categoryId)
	{
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("select count(*) from Topic t where categoryId = :categoryId");
		q.setParameter("categoryId", categoryId);
		int count =Integer.valueOf(String.valueOf(q.uniqueResult()));
		return count;
	}
	
	
    
	public SessionFactory getSessionFactory()
	{
		return sessionFactory;
	}
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}

	

	


}
