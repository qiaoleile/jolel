package com.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.IMenuBiz;
import com.util.JsonTools;

@Controller
@RequestMapping(value="menu",produces="text/html;charset=utf-8" )
public class MenuController {
	@Resource
	private IMenuBiz imb;
	@RequestMapping("findAll")
	@ResponseBody
	public String findAll() {
		return JsonTools.writeJson(imb.findAll());
	}
	
}
