package com.zyh.po;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="t_group")
public class Group
{
   private int id;
   private String name;
   private Set<User> users = new HashSet<User>();
   private Set<Right> rights = new HashSet<Right>();
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
	@OneToMany(mappedBy="group",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	public Set<User> getUsers()
	{
		return users;
	}
	public void setUsers(Set<User> users)
	{
		this.users = users;
	}
	@ManyToMany(cascade=CascadeType.MERGE,fetch=FetchType.LAZY)
	@JoinTable(name="group_right",
	joinColumns={@JoinColumn(name="groupId",referencedColumnName="id")},
	inverseJoinColumns={@JoinColumn(name="rightId",referencedColumnName="id")})
	public Set<Right> getRights()
	{
		return rights;
	}
	public void setRights(Set<Right> rights)
	{
		this.rights = rights;
	}
	   
   
   
}
