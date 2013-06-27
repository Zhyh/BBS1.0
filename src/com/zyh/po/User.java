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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;

@Entity
@Table(name="users")
@DynamicInsert
@DynamicUpdate
public class User
{
   private int id;
   private String username;
   private String psd;
   private String name;
   private String email;
   private String addr;
   private String bz;
   private String phone;
   private String sex;
   private int score;
   private String IP;
   private Date lastVisitTime;
   private int topicNum;
   private int msgNum;
   private Group group;
   private int status;//判断用户是否被封禁0正常、1锁定
   @Id
   @GeneratedValue
   @Column(updatable=false)
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	@Column(nullable=false,updatable=false)
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	@Column(nullable=false)
	public String getPsd()
	{
		return psd;
	}
	public void setPsd(String psd)
	{
		this.psd = psd;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getAddr()
	{
		return addr;
	}
	public void setAddr(String addr)
	{
		this.addr = addr;
	}
	public String getBz()
	{
		return bz;
	}
	public void setBz(String bz)
	{
		this.bz = bz;
	}
	public String getPhone()
	{
		return phone;
	}
	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	public String getSex()
	{
		return sex;
	}
	public void setSex(String sex)
	{
		this.sex = sex;
	}
	public int getScore()
	{
		return score;
	}
	public void setScore(int score)
	{
		this.score = score;
	}
	public String getIP()
	{
		return IP;
	}
	public void setIP(String iP)
	{
		IP = iP;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Generated(GenerationTime.ALWAYS)
	public Date getLastVisitTime()
	{
		return lastVisitTime;
	}
	public void setLastVisitTime(Date lastVisitTime)
	{
		this.lastVisitTime = lastVisitTime;
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
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name="groupId")
	public Group getGroup()
	{
		return group;
	}
	public void setGroup(Group group)
	{
		this.group = group;
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
