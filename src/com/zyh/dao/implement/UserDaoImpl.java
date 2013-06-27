package com.zyh.dao.implement;

import java.util.List;

import javax.annotation.Resource;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.zyh.dao.UserDao;
import com.zyh.po.Topic;
import com.zyh.po.User;
@Component("userDao")
public class UserDaoImpl implements UserDao
{
	private SessionFactory sessionFactory;
	private int pageSize = 8;

	public boolean save(User u)
	{
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(u);
		return true;
	}
     
	public boolean updateUser(User u)
	{
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(u);
		return true;
	}

	public boolean delUser(int userId)
	{
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete from Msg m where userId = :userId");
		query.setParameter("userId", userId);
		Query query2 = session.createQuery("delete from Msg m where topicId in (select id " +
				"from Topic t where userId = :userId))");
		query2.setParameter("userId",userId);
		Query query3 = session.createQuery("delete from Topic t where userId = :userId");
		query3.setParameter("userId",userId);
		 Query q = session.createQuery("delete from User u where id= :id");
		 q.setParameter("id", userId);
		 query.executeUpdate();
		 query2.executeUpdate();
		 query3.executeUpdate();
		 q.executeUpdate();
        	 return true;
	}
	public User getUser(String username,String psd)
	{
		Session session = sessionFactory.getCurrentSession();
		 Query q = session.createQuery(" from User u where username= :username and psd = :psd");
		 q.setParameter("username", username);
		 q.setParameter("psd", psd);
		return (User) q.uniqueResult();
	}
	
	public User getUser(int id)
	{
		Session session = sessionFactory.getCurrentSession();
		 Query q = session.createQuery(" from User u where id = :id");
		 q.setParameter("id", id);
		return (User)q.uniqueResult();
	}
	public List<User> showAllUsers(int groupId,int pageNo)
	{
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery(" from User u where groupId = :groupId");
		q.setParameter("groupId", groupId);
		int count = getPageCount(groupId);
		if (pageNo > count)
		{
			pageNo = count;
		}else if(pageNo < 0)
		{
			pageNo = 1;
		}
		q.setFirstResult((pageNo-1)*pageSize);
		q.setMaxResults(pageSize);
		ActionContext.getContext().put("userPageCount", count);
		return q.list();
	}
	
	public int getPageCount(int groupId)
	{
		// TODO Auto-generated method stub
		int count = getUserNum(groupId);
		if (count % pageSize == 0)
		{
			return count / pageSize;
		}
		return count  /pageSize + 1;
	}
	public int getUserNum(int groupId)
	{
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("select count(*) from User u where groupId = :groupId");
		q.setParameter("groupId", groupId);
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

	public int getPageSize()
	{
		return pageSize;
	}

	public void setPageSize(int pageSize)
	{
		this.pageSize = pageSize;
	}

	

	

	

	

	
	



  
}
