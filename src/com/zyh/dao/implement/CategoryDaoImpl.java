package com.zyh.dao.implement;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.zyh.dao.CategoryDao;
import com.zyh.po.Category;
@Component("categoryDao")
public class CategoryDaoImpl implements CategoryDao
{
	private SessionFactory sessionFactory;
	private int pageSize=12;
	
	public boolean save(Category c)
	{
		Session session =sessionFactory.getCurrentSession();
		session.save(c);
		return true;
	}
	public boolean checkExist(String name)
	{
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
	   Query q = session.createQuery("select count(*) from Category c where name = :name");
	   q.setParameter("name",name);
	   long count = (Long)q.uniqueResult();
	   if (count == 0)
	{
		   return false;
	}
		return true;
	}
	public List<Category> showAllCategories(int pageNo)
	{
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Category c");
		int count =getPageCount();
		if (pageNo > count)
		{
			pageNo = count;
		}else if(pageNo < 0)
		{
			pageNo = 1;
		}
		q.setFirstResult((pageNo-1)*pageSize);
		q.setMaxResults(pageSize);
		ActionContext.getContext().put("categoryPageCount", count);
		List<Category> list = q.list();
		return list;
	}
	
	public Category getCategory(int categoryId)
	{
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery(" from Category c where id=:categoryId");
		q.setParameter("categoryId",categoryId);
	
		return (Category) q.uniqueResult();
	}
	//根据版主的id找到版块
	public Category pickCategory(int userId)
	{
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery(" from Category c where userId= :id");
		q.setParameter("id",userId);
		return (Category)q.uniqueResult();
	}
	
	public boolean delCategory(int id)
	{
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete from Msg m where topicId in ( select id from " +
				"Topic t where categoryId = :id)");
		query.setParameter("id", id);
		Query query2 = session.createQuery("delete from Topic t where categroyId = :id");
		query2.setParameter("id", id);
		Query q = session.createQuery("delete from Category c where id=:id");
		q.setParameter("id", id);
		query.executeUpdate();
		query2.executeUpdate();
		 q.executeUpdate();
			return true;
	}
	
	public boolean update(Category c)
	{
		Session session = sessionFactory.getCurrentSession();
		Date now = new Date();
		Date lastPostTime = c.getLastPostTime();
		if (now.getDate()>lastPostTime.getDate())
		{
			c.setTodayPostNum(1);
		}
		session.saveOrUpdate(c);
		return true;
	}
	
	public int getPageCount()
	{
		// TODO Auto-generated method stub
		if (getCategoryNum()%pageSize == 0)
		{
			return getCategoryNum()/pageSize;
		}
		return getCategoryNum()/pageSize + 1;
	}
	public int getCategoryNum()
	{
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("select count(*) from Category c");
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
