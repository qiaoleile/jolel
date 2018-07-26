package com.biz.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.biz.IMenuBiz;
import com.dao.IMenuDao;
import com.pageModel.PageMenu;
import com.po.Menu;

@Service
public class MenuBizImpl implements IMenuBiz {
	@Resource
	private IMenuDao imd;
	@Override
	public List<PageMenu> findAll() {
		List<PageMenu> pList=null;
		List<Menu> mList=imd.findAll();
		if(mList!=null&&mList.size()>0) {
			pList=new ArrayList<PageMenu>(mList.size());
			PageMenu pm=null;
			for (Menu menu : mList) {
				pm=new PageMenu();
				pm.setId(menu.getId());
				pm.setPid(menu.getPid());
				pm.setText(menu.getText());
				Map<String,Object> attribute=new HashMap<String,Object>();
				attribute.put("url", menu.getUrl());
				pm.setAttributes(attribute);
				pList.add(pm);
			}
			return pList;
		}
		return null;
	}

}
