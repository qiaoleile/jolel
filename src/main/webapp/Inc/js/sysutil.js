/******张三的公用js文件*******/

/*
 *程序功能：远程数据下拉框绑定
 *参数1：number类型，表格ID
 *参数2：String类型，TD的id
 *参数3：String类型，颜色
 *参数4：number类型，待绑定ID，-1代表暂不绑定
 */

function bindCombox($source,sUrl,oField,ckId){	//其中三个参数详见easyui4.jsp
	$source.combobox({
		url:sUrl,
		valueField:oField.k,
		textField:oField.v,
		onLoadSuccess:function(){
			var array=$(this).combobox('getData');
			if(array.length>0){
				if(ckId ==-1){
					$(this).combobox('select',array[0][oField.k]);
				}else{
					$(this).combobox('select',ckId);
				}
				
			}
		}
	});
	
}

/*
 * 更换主题 
 */
changeTheme = function(type){
	var $easyuiTheme = $('#easyuiTheme');
	var url = $easyuiTheme.prop('href');
	console.info(url);
	
	var href = url.substring(0, url.indexOf('easyui'))+ 'easyui/themes/' + type + '/easyui.css';
	console.info(href);
	$easyuiTheme.prop('href',href);
	
	/* 如果使用了iframe  则要添加下面这段代码、否则的话iframe中的内容不会出现样式的改变*/
	var $iframe = $('iframe');
	if($iframe.length > 0){
		for ( var i = 0; i < $iframe.length; i++) {
			var ifr = $iframe[i];
			$(ifr).contents().find('#easyuiTheme').prop('href', href);
			
		}
	}
	
	$.cookie('easyuiThemeName', type, {
		expires : 7
	});
};
