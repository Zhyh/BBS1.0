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
public class Msg
{
   private int id;
   private String content;
   private Date createDate;
   private Topic topic;
   private User user;
   private int layer;
   private int toLayer;
   private int toLayerUserId;
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
	@Temporal(TemporalType.TIMESTAMP)
	@Generated(GenerationTime.INSERT)
	public Date getCreateDate()
	{
		return createDate;
	}
	public void setCreateDate(Date createDate)
	{
		this.createDate = createDate;
	}
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="topicId")
	public Topic getTopic()
	{
		return topic;
	}
	public void setTopic(Topic topic)
	{
		this.topic = topic;
	}
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="userId")
	public User getUser()
	{
		return user;
	}
	public void setUser(User user)
	{
		this.user = user;
	}
	@Column(updatable=false)
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public int getLayer()
	{
		return layer;
	}
	public void setLayer(int layer)
	{
		this.layer = layer;
	}
	public int getToLayer()
	{
		return toLayer;
	}
	public void setToLayer(int toLayer)
	{
		this.toLayer = toLayer;
	}
	public int getToLayerUserId()
	{
		return toLayerUserId;
	}
	public void setToLayerUserId(int toLayerUserId)
	{
		this.toLayerUserId = toLayerUserId;
	}
	
   
}
