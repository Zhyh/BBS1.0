package com.zyh.po;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="t_right")
public class Right
{
  private int id;
   private String name;
   private Set<Group> groups = new HashSet<Group>();
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
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	@ManyToMany(mappedBy="rights",cascade=CascadeType.ALL)
	public Set<Group> getGroups()
	{
		return groups;
	}
	public void setGroups(Set<Group> groups)
	{
		this.groups = groups;
	}
}
