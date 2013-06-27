package com.zyh.action;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zyh.po.Category;
import com.zyh.po.User;
import com.zyh.service.CategoryService;
@Component("category")
@Scope("prototype")
public class CategoryCRUD extends ActionSupport
{
	   private String name;
	   private int id;
	   private CategoryService service;
	   private List<Category> cList;
	   private int pageNo;
	   private Category category;
	   HttpServletRequest request = ServletActionContext.getRequest();
	   User  u = (User)request.getSession().getAttribute("loginUser");
	   
    public String addCategory()
    {
    	Category c = new Category();
    	c.setName(name);
    	if (service.addCategory(c))
		{
			return SUCCESS;
		}
    	return "error";
    }
    
    public String getAllCategories()
    {
    	cList = service.getAllCategories(pageNo);
			return SUCCESS;
    }

    public String removeCategory()
    {
    		service.delCategory(id);
    		return SUCCESS;
    }
    
    public String lockCategory()
    {
    	category = service.getCategory(id);
		category.setStatus(1);
		service.update(category);
		return "lock";
    }
    
    public String unLockCategory()
    {
    	category = service.getCategory(id);
		category.setStatus(0);
		service.update(category);
		return "unLock";
    }
   
    
    
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}
	public CategoryService getService()
	{
		return service;
	}
    @Resource
	public void setService(@Qualifier("categoryService") CategoryService service)
	{
		this.service = service;
	}

	public List<Category> getCList()
	{
		return cList;
	}

	public void setCList(List<Category> cList)
	{
		this.cList = cList;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getPageNo()
	{
		return pageNo;
	}

	public void setPageNo(int pageNo)
	{
		this.pageNo = pageNo;
	}

	public Category getCategory()
	{
		return category;
	}

	public void setCategory(Category category)
	{
		this.category = category;
	}
	

}
