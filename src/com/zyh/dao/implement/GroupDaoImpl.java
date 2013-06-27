package com.zyh.dao.implement;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;
import com.zyh.dao.GroupDao;
import com.zyh.po.Group;
@Component("groupDao")
public class GroupDaoImpl implements GroupDao
{
   private SessionFactory sessionFactory;
	public Group getGroup(int id)
	{
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Group g where id = :id");
		query.setParameter("id", id);
		return (Group)query.uniqueResult();
	}
	
	public boolean delGroup(int id)
	{
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete from Group g where id = :id");
		query.setParameter("id", id);
		if (query.executeUpdate()>0)
		{
			return true;
		}
		return false;
	}
	
	public boolean addGroup(Group g)
	{
		Session session = sessionFactory.getCurrentSession();
		if (checkExist(g.getName()))
		{
			return false;
		}
		session.save(g);
		return true;
	}
	
	public boolean checkExist(String name)
	{
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Group g where name = :name");
		query.setParameter("name", name);
		if (query.uniqueResult() != null)
		{
			return true;
		}
		return false;
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
