package com.zyh.dao;

import java.util.List;

import com.zyh.po.Category;
import com.zyh.po.Topic;

public interface TopicDao
{
	public boolean save(Topic t);
	public boolean update(Topic t);
	public List<Topic> showAllTopics(int categoryId,int pageNo);
	public List<Topic> showZDTopics(int categoryId);
    public List<Topic> showQZDTopics();
    public List<Topic> getTopics(int userId,int pageNo);
    public boolean delTopic(int id);
    public Topic getTopic(int id);
    public int getTopicNum(int categoryId);
    public int getPageCount(int categoryId);
    public boolean insertMsg(int id);
}
