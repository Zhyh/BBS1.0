package com.zyh.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.zyh.dao.MsgDao;
import com.zyh.po.Msg;

@Component("msgService")
public class MsgService
{
   private MsgDao msgDao;
    
   @Transactional(propagation=Propagation.REQUIRED)
   public boolean addMsg(Msg m)
   {
	   return msgDao.save(m);
   }
   
   @Transactional(readOnly=true)
   public List<Msg> getAllMsgs(int topicId,int pageNo)
   {
	   return msgDao.showAllMsgs(topicId,pageNo);
   }
   
   @Transactional(propagation=Propagation.REQUIRED)
   public boolean delMsg(int id)
   {
	   return msgDao.delMsg(id);
   }
   @Transactional(propagation=Propagation.REQUIRED)
   public Msg getMsg(int id)
   {
	   return msgDao.getMsg(id);
   }
	public MsgDao getMsgDao()
	{
		return msgDao;
	}
	@Resource
	public void setMsgDao(@Qualifier("msgDao") MsgDao msgDao)
	{
		this.msgDao = msgDao;
	}
   
   
   
   
    
	
   
  
   
   
   
   
   
   
}
