package com.zyh.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sun.org.apache.regexp.internal.recompile;
import com.zyh.dao.CategoryDao;
import com.zyh.po.Category;

@Component("categoryService")
public class CategoryService
{
   private CategoryDao categoryDao;
    
   @Transactional(propagation=Propagation.REQUIRED)
   public boolean addCategory(Category c)
   {
	   if (categoryDao.checkExist(c.getName()))
	{
		   return false;
	}
	   return categoryDao.save(c);
   }
   
   @Transactional(readOnly=true)
   public List<Category> getAllCategories(int pageNo)
   {
	   return categoryDao.showAllCategories(pageNo);
   }
   
   @Transactional(propagation=Propagation.REQUIRED)
   public boolean delCategory(int id)
   {
	   return categoryDao.delCategory(id);
   }
   
   @Transactional(readOnly=true)
   public Category getCategory(int id)
   {
	   return categoryDao.getCategory(id);
   }
   @Transactional(readOnly=true)
   public Category pickCategory(int userId)
   {
	   return categoryDao.pickCategory(userId);
   }
   @Transactional(propagation=Propagation.REQUIRED)
   public boolean update(Category c)
   {
	   return categoryDao.update(c);
   }
   
   
   
	public CategoryDao getCategoryDao()
	{
		return categoryDao;
	}
	 @Resource
	public void setCategoryDao(@Qualifier("categoryDao") CategoryDao categoryDao)
	{
		this.categoryDao = categoryDao;
	}
   
   
  
   
   
   
   
   
   
}
