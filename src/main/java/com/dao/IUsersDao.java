package com.dao;

import java.util.Map;

import com.po.Users;

public interface IUsersDao {
	public Users login(Map<String,Object> params);
}
