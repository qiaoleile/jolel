package com.biz.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biz.IUsersBiz;
import com.dao.IUsersDao;
import com.po.Users;

@Service
public class UsersBizImpl implements IUsersBiz{
	@Resource
	private IUsersDao iud;
	
	@Override
	public Users login(String n, String p) {
		Map<String,Object> params =new HashMap<String,Object>();
		params.put("lname", n);
		params.put("lpass", p);
		
		return iud.login(params);
	}

}
