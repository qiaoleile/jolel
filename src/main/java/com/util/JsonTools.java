package com.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.PropertyFilter;
import com.alibaba.fastjson.serializer.SerializerFeature;

public class JsonTools {
	/***
	 * 普通转换JSON
	 * @param obj 转换的源对象
	 * @return
	 */
	public static String writeJson(Object obj){
		String jsonStr="";
		
		jsonStr=JSON.toJSONString(obj);
		
		return jsonStr;
	}
		
	/***
	 * 高级转换JSON,过滤不需要的属性
	 * @param obj 转换的源对象
	 * @param propertyNames 字符串数组结构：不想转换的属性，例：new String[]{"pro_1","pro_2"}
	 * @return
	 */
	public static String writeJson(Object obj,String... propertyNames){
		String jsonStr="";
		
		try {
			//过滤属性
			PropertyFilter pf= filterProperty(propertyNames);
			//套用过滤规则
			//SerializerFeature.DisableCircularReferenceDetect关闭引用
			jsonStr=JSON.toJSONString(obj, pf, SerializerFeature.DisableCircularReferenceDetect);
			
			System.out.println("json:"+jsonStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jsonStr;
	}
	
	//过滤方法
	private static PropertyFilter filterProperty(final String... propertyNames) {
		// 过滤不显示的属性及关联属性
		PropertyFilter propertyFilter = new PropertyFilter() {

			public boolean apply(Object arg0, String propertyName, Object arg2) {
				if (propertyNames != null && propertyNames.length > 0) {
					for (String pname : propertyNames) {
						if (propertyName.equals(pname)) {
							return false;
						}
					}
				}
				return true;
			}
		};

		return propertyFilter;
	}
}
