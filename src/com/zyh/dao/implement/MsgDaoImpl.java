package com.zyh.dao.implement;

import java.util.List;
import javax.annotation.Resource;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.zyh.dao.MsgDao;
import com.zyh.po.Msg;
import com.zyh.po.Topic;
@Component("msgDao")
public class MsgDaoImpl implements MsgDao
{
	private SessionFactory sessionFactory;
	private int pageSize = 8;
	
	public boolean save(Msg m)
	{
		Session session =sessionFactory.getCurrentSession();
		session.save(m);
		return true;
	}
	
	public List<Msg> showAllMsgs(int topicId , int pageNo)
	{
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Msg m where topicId = :topicId");
		q.setParameter("topicId",topicId);
		int count = getPageCount(topicId);
		if (pageNo > count)
		{
			pageNo = count;
		}else if(pageNo < 0)
		{
			pageNo = 1;
		}
		q.setFirstResult((pageNo-1)*pageSize);
		q.setMaxResults(pageSize);
		ActionContext.getContext().put("msgPageCount", count);
		List<Msg> list = q.list();
		return list;
	}
	
	public List<Msg> getMsgs(int userId, int pageNo)
	{
		// TODO Auto-generated method stub
		return null;
	}
	public Msg getMsg(int id)
	{
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery(" from Msg m where id=:id");
		q.setParameter("id",id);
		return (Msg)q.uniqueResult();
	}
	
	public boolean delMsg(int id)
	{
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("delete from Msg m where id=:id");
		q.setParameter("id",id);
		if (q.executeUpdate()>0)
		{
			return true;
		}
		return false;
	}
	
	public int getPageCount(int topicId)
	{
		// TODO Auto-generated method stub
		int count = getMsgNum(topicId);
		if (count % pageSize == 0)
		{
			return count / pageSize;
		}
		return count / pageSize + 1;
	}
	public int getMsgNum(int topicId)
	{
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("select count(*) from Msg m where topicId = :topicId");
		q.setParameter("topicId", topicId);
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
