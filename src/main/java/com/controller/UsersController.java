package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.IUsersBiz;
import com.po.Users;
import com.util.JsonTools;
import com.util.MD5Util;
import com.util.RespJson;

@Controller
@RequestMapping(value="users",produces="text/html;charset=utf-8")
public class UsersController {
	@Resource
	private IUsersBiz iub;
	@Resource
	private RespJson rj;
	
	@RequestMapping("login")
	@ResponseBody
	public String login(Users users,HttpSession session){
		rj.setMsg("登录失败");
		
		Users u= iub.login(users.getLname(), MD5Util.md5Encode(users.getLpass()));
		
		if(u !=null){
			session.setAttribute("users", u);
			rj.setSuccess(true);
			rj.setMsg("登录成功");
		}
		return JsonTools.writeJson(rj);
	}
	
	@RequestMapping("exit")
	public String exit(HttpSession session){
		session.invalidate();
		return "login";
	}
}














