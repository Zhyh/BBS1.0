package com.zyh.dao;

import java.util.List;

import com.zyh.po.User;

public interface UserDao
{
	public boolean save(User u);
    public List<User> showAllUsers(int groupId,int pageNo);
    public boolean updateUser(User u);
    public boolean delUser(int id);
    public User getUser(String username,String psd);
    public User getUser(int id);
    public int getPageCount(int groupId);
    public int getUserNum(int groupId);
}
