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
	var t;
	$(function(){
		changeTh();
		loadTree();
		t=$('#layout_center_tabs');
	});
	
	//加载树菜单

	function loadTree() {
		$('#tt').tree({
			url : 'menu/findAll.do',
			parentField : "pid",
			textFiled : "text",
			idFiled : "id",
			//点击节点增加选项卡
			onClick : function(node) {
				addTab(node);
			}
		});

	}
	function addTab(node) {
		if (t.tabs('exists', node.text)) {
			//激活
			t.tabs('select', node.text);
			return;
		}
		
		//如果url地址不存在提示出错
		if(node.attributes.url ==null){
			$.messager.show({
				title:'系统消息',
				msg:'节点错误，联系管理员',
				timeout:5000
			});
			return;
		}
		
		//开进度条
		$.messager.progress({
			text:'页面加载中...',
			interval:100
		});
		
		if(node.attributes.url!=null){
			t.tabs('add',{
							title : node.text,
							content : 'Tab Body',
							closable : true,
							content : '<iframe src="<%=basePath%>url/go.do?page=pages/'+node.attributes.url+'" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>',
							tools:[{
								iconCls:'icon-mini-refresh',
								handler:function(){
									//刷新当前选项卡
									refreshTab(node.text);
								}
							}]
			}); 
		}
		//关进度条
		$.messager.progress('close');
	}
		
	//刷新tabs
	function refreshTab(title){ 
		//开进度条
		$.messager.progress({
			text:'页面加载中...',
			interval:100
		});		
		
		//得到指定标题的选项卡
		var tabObj=t.tabs('getTab',title);
		t.tabs('update',{
			tab:tabObj,
			options:tabObj.panel('options')
		});
		
		//关进度条
		$.messager.progress('close');
	}
	
		
	//换肤
	function changeTh(){
		//更换皮肤
		$('#em_sel').combobox({
			onSelect:function(record){
				changeTheme(record.value);
			}
		});
	}
</script>
</head>
<body class="easyui-layout">  		
	<div region="north" split="true" border="false" style="overflow: hidden; height: 90px;
	        background: url('Inc/img/main_top.jpg') #7f99be repeat-x center 50%;
	        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
	        
	        <span style="float:right;
	        	padding-top:60px; 
	        	padding-right:10px;
	        	font-size: 16px;" 
	        	class="head">
	        	欢迎
	        	<sapn style="color:red;"> 【${sessionScope.users.rname }】</sapn>
	        	 登录本系统
	        	<a href="url/exit.do" id="loginOut" style="color:yellow;text-decoration: none;">
	        		【安全退出】
	        	</a>
		        <select id="em_sel" class="easyui-combobox" style="width:100px;"> 
				    <option value="default" selected="selected">默认皮肤</option>   
				    <option value="black">古天乐黑</option> 
				    <option value="dark-hive">包青天黑</option>  
				    <option value="bootstrap">浅灰色</option>
				    <option value="gray">深灰色</option>
				    <option value="cupertino">青蓝色</option>
				    <option value="sunny">阳光色</option>   
				</select>		        	
	        </span>
	        
    </div>
    
    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer"></div>
    </div>  
    
     
    <div data-options="region:'west',title:'菜单栏',split:true" style="width:180px;">
    	<!-- 树菜单 -->
    	<ul id="tt"></ul>
    </div>  
    
     
    <div data-options="region:'center',title:'主界面'" style="padding:5px;background:#eee;">
    	
    	<div id="layout_center_tabs" class="easyui-tabs" data-options="fit:true,border:false" style="overflow: hidden;">
			<div title="首页"></div>			
		
		</div>
    </div>  
</body>

</html>