package com.zyh.dao;

import java.util.List;
import com.zyh.po.Msg;

public interface MsgDao
{
	public boolean save(Msg m);
	public List<Msg> showAllMsgs(int topicId,int pageNo);
	public Msg getMsg(int id);
    public List<Msg> getMsgs(int userId,int pageNo);
    public boolean delMsg(int id);
    public int getPageCount(int topicId);
    public int getMsgNum(int topicId);
   
}
