package com.zyh.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.zyh.dao.GroupDao;
import com.zyh.po.Group;

@Component("groupService")
public class GroupService
{
   private GroupDao groupDao;
  
   @Transactional(propagation=Propagation.REQUIRED)
   public boolean addGroup(Group g)
   {
	  return groupDao.addGroup(g);
   }

   @Transactional(propagation=Propagation.REQUIRED)
   public boolean delGroup(int id)
   {
	   return groupDao.delGroup(id);
   }
   
   @Transactional(readOnly=true)
   public Group getGroup(int id)
   {
	   return groupDao.getGroup(id);
   }

		public GroupDao getGroupDao()
		{
			return groupDao;
		}
		@Resource
		public void setGroupDao(GroupDao groupDao)
		{
			this.groupDao = groupDao;
		}
		   
   
   
   
   
}
