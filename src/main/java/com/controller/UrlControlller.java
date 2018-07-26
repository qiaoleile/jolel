package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="url",produces="text/html;charset=utf-8")
public class UrlControlller {
	@RequestMapping("go")
	public String go(String page) {
		return "WEB-INF/"+page;
	}
	@RequestMapping("exit")
	public String exit(HttpSession session){
		session.invalidate();
		return "WEB-INF/login";
	}
}
