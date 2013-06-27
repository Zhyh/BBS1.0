package com.zyh.dao;

import java.util.List;
import com.zyh.po.Category;

public interface CategoryDao
{
	public boolean save(Category c);
	public boolean update(Category c);
	public boolean checkExist(String name);
    public List<Category> showAllCategories(int pageNo);
    public boolean delCategory(int id);
    public int getPageCount();
    public int getCategoryNum();
    public Category getCategory(int categoryId);
    public Category pickCategory(int userId);
	
   
}
