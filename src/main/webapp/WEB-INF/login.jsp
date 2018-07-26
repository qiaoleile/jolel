<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		init();
	});
	function init(){
		bindLoginDialog();
	}
	function bindLoginDialog(){
		$('#loginDialog').dialog({
			title:"登录窗口" ,
			width:290,
			height:150,
			iconCls:'icon-tip',
			resizable:false,
			modal:true,
			closable:false,

	        buttons:[
	        	{
	        		text:'登录',
	        		handler:function(){
	        			$('#loginForm').ajaxSubmit({	
	        				type:'post',
	        				url:'users/login.do',
	        				success:function(data){
	        					//转json对象
	        					var jsonObj=$.parseJSON(data);
	        					
			                	if(jsonObj.success){
			                		//跳转
			                		$(location).prop('href','url/go.do?page=index');
			                	}else{
			                		$.messager.show({
										title:'提示',
										showType : 'show',
										msg:jsonObj.msg,
										timeout:5000
									});
			                	}
			                	
			                } 
	        			});
	        		}
	        	},
	        	{
	        		text:'注册',
	        		handler:function(){
	        			alert('功能待开发');
	        		}
	        	}
	        ]
		})
	}
	
</script>
</head>
<body>
	<div id="loginDialog" class="easyui-dialog" >   
   		<form id="loginForm">
   			<table align="center">
	    		<tr>
	    			<td algin="right">用户名：</td>
	    			<td><input type="text" name="lname" value="admin"/></td>
	    		</tr>
	    		<tr>
	    			<td algin="right">密码：</td>
	    			<td><input type="password" name="lpass" value="admin"/></td>
	    		</tr>
	    	</table>
   		</form>
	</div> 
</body>
</html>









