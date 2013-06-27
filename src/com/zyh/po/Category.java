package com.zyh.po;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;

@Entity
@DynamicInsert
@DynamicUpdate
public class Category
{
   private int id;
   private String name;
   private String createDate;
   private Date lastPostTime;
   private int topicNum;
   private int msgNum;
   private User user;
   private int todayPostNum;
   private int status;//1表示锁定版块,0表示正常
   @Id
   @GeneratedValue
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getTopicNum()
	{
		return topicNum;
	}
	public void setTopicNum(int topicNum)
	{
		this.topicNum = topicNum;
	}
	public int getMsgNum()
	{
		return msgNum;
	}
	public void setMsgNum(int msgNum)
	{
		this.msgNum = msgNum;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Generated(GenerationTime.ALWAYS)
	public Date getLastPostTime()
	{
		return lastPostTime;
	}
	public void setLastPostTime(Date lastPostTime)
	{
		this.lastPostTime = lastPostTime;
	}
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.MERGE)
	@JoinColumn(name="userId")
	public User getUser()
	{
		return user;
	}
	public void setUser(User user)
	{
		this.user = user;
	}
	public int getTodayPostNum()
	{
		return todayPostNum;
	}
	public void setTodayPostNum(int todayPostNum)
	{
		this.todayPostNum = todayPostNum;
	}
	public void setCreateDate(String createDate)
	{
		this.createDate = createDate;
	}
	public String getCreateDate()
	{
		return createDate;
	}
	public int getStatus()
	{
		return status;
	}
	public void setStatus(int status)
	{
		this.status = status;
	}
	   
}
