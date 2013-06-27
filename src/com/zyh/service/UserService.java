package com.zyh.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.zyh.dao.implement.UserDaoImpl;
import com.zyh.po.User;

@Component("userService")
public class UserService
{
   private UserDaoImpl userDao;
  
   @Transactional(propagation=Propagation.REQUIRED)
   public boolean addUser(User u)
   {
	   if ( userDao.getUser(u.getUsername(), u.getPsd())!=null)
	{
		return false;
	}
	   return userDao.save(u);
   }

   @Transactional(propagation=Propagation.REQUIRED)
   public boolean delUser(int id)
   {
	   return userDao.delUser(id);
   }
   
   @Transactional(readOnly=true)
   public User getUser(String username,String psd)
   {
	   return userDao.getUser(username, psd);
   }
   @Transactional(readOnly=true)
   public User getUser(int id)
   {
	   return userDao.getUser(id);
   }
   @Transactional(readOnly=true)
   public List<User> getAllUsers(int groupId,int pageNo)
   {
	   return userDao.showAllUsers(groupId,pageNo);
   }
   
   @Transactional(propagation=Propagation.REQUIRED)
   public boolean updateUser(User u)
   {
	   return userDao.updateUser(u);
   }
   
   
	public UserDaoImpl getUserDao()
	{
		return userDao;
	}
	@Resource
	public void setUserDao(UserDaoImpl userDao)
	{
		this.userDao = userDao;
	}
   
}
