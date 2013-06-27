package com.zyh.po;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
public class Topic
{
   private int id;
   private String title;
   private String createDate;
   private Category category;
   private Date lastPostTime;
   private String content;
   private User user;
   private int msgNum;
   private int layers;
   private String lastPostUserName;
   private int status;
   private int type;//1-∆’Õ®,2-±æ∞Ê÷√∂•,3-»´’æ÷√∂•
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
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="categoryId")
	public Category getCategory()
	{
		return category;
	}
	public void setCategory(Category category)
	{
		this.category = category;
	}
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="userId")
	public User getUser()
	{
		return user;
	}
	public void setUser(User user)
	{
		this.user = user;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
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
	public int getLayers()
	{
		return layers;
	}
	public void setLayers(int layers)
	{
		this.layers = layers;
	}
	public String getLastPostUserName()
	{
		return lastPostUserName;
	}
	public void setLastPostUserName(String lastPostUserName)
	{
		this.lastPostUserName = lastPostUserName;
	}
	@Column(updatable=false)
	public String getCreateDate()
	{
		return createDate;
	}
	public void setCreateDate(String createDate)
	{
		this.createDate = createDate;
	}
	public int getStatus()
	{
		return status;
	}
	public void setStatus(int status)
	{
		this.status = status;
	}
	public int getType()
	{
		return type;
	}
	public void setType(int type)
	{
		this.type = type;
	}
   
}
