<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!-- 引入jquery的文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/Inc/js/easyui/jquery.min.js"></script>

<!-- 引入jquery的form插件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/Inc/js/jquery.form.js"></script>

<!-- 引入jquery.cookie文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/Inc/js/jquery.cookie.js"></script>

<%
		//从cookies中读取主题名称
		String easyuiThemeName = "default";
		Cookie cookies[] = request.getCookies();
		if(cookies != null && cookies.length > 0){
			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals("easyuiThemeName")){
					easyuiThemeName = cookies[i].getValue();
					break;
				}
			}
		}
	%>


<!-- 引入easyui的样式表 -->
<link id="easyuiTheme" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/Inc/js/easyui/themes/<%=easyuiThemeName%>/easyui.css" ></link>
<!-- 引入easyui的图标导航 -->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/Inc/js/easyui/themes/icon.css" ></link>
<!-- 引入easyui的文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/Inc/js/easyui/jquery.easyui.min.js"></script>
<!-- 引入easyui的中文语言包，如果不导入，自动引入所有的语言包 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/Inc/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- easyui tree的扩展 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/Inc/js/extEasyUI.js"></script>
<!-- 自定义的JS扩展 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/Inc/js/sysutil.js"></script>