package com.zyh.dao;

import com.zyh.po.Group;

public interface GroupDao
{
    public Group getGroup(int id);
    public boolean delGroup(int id);
    public boolean addGroup(Group g);
    public boolean checkExist(String name);
}
