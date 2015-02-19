<#assign messageTypeMap = {"text":"文本","news":"图文","image":"图片","voice":"语音","video":"视频","music":"音乐"}>
<!DOCTYPE html>
<html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" media="screen" href="<@full_path path="css/icity.css"/>"/>
<style type="text/css">
.button_panel a{
     margin-right: 5px;
     margin-left: 5px;
}
</style>
<script type="text/javascript" src="<@full_path path="js/jquery/jquery-1.8.0.min.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jquery/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jquery/jquery.validate.messages_zh.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/My97DatePicker/WdatePicker.js"/>" ></script>
<script type="text/javascript" src="<@full_path path="js/icity.js"/>"></script>
<script type="text/javascript">
<!--
$().ready(function() {
		 renderTable();
});
//-->
</script>
</head>

<body>

<!-- 查询表单 -->
<form id="searchForm" action="?act=QUERY" method="post">
	<fieldset class="search_panel">
		<legend>查询条件</legend>
            <table class="search_field">
				 <tr>
					  <td><span>消息类型</span></td>
					  <td>
		    <select class="search_field_input search_field_select" id="messageType" name="messageType">
                <option value="">选择</option>
				<option value="text" <#if RequestParameters['messageType']! == 'text'>selected='selected'</#if>>文本</option>
				<option value="news" <#if RequestParameters['messageType']! == 'news'>selected='selected'</#if>>图文</option>
				<option value="image" <#if RequestParameters['messageType']! == 'image'>selected='selected'</#if>>图片</option>
				<option value="voice" <#if RequestParameters['messageType']! == 'voice'>selected='selected'</#if>>语音</option>
				<option value="video" <#if RequestParameters['messageType']! == 'video'>selected='selected'</#if>>视频</option>
				<option value="music" <#if RequestParameters['messageType']! == 'music'>selected='selected'</#if>>音乐</option>
			</select>
				      </td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>消息名</span></td>
					  <td>
		   <input class="search_field_input" id="messageName" name="messageName" type="text"  value="${RequestParameters['messageName']!}"/>
				      </td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>创建时间</span></td>
					  <td>
		   <input class="search_field_input" id="createTimeBegin" name="createTimeBegin" type="text" readonly="readonly" onclick="showDatePicker('createTimeBegin')" value="${RequestParameters['createTimeBegin']!}"/>至<input class="search_field_input" id="createTimeEnd" name="createTimeEnd" type="text" readonly="readonly" onclick="showDatePicker('createTimeEnd')" value="${RequestParameters['createTimeEnd']!}"/>
				      </td>
		         </tr>
			</table>
			<table class="search_button_panel">
				 <tr>
					  <td><input class="search_button" type="submit" value="查询"><input class="search_button" type="button" value="清空" onclick="cleanForm('#searchForm')"></td>
				 </tr>
			</table>
	</fieldset>
</form>

<!-- 按钮栏 -->
<table class="button_panel">
	<tr>
		<td><a href="?act=SHOW_FORM&messageType=text">文本</a><a href="?act=SHOW_FORM&messageType=news">图文</a><a href="?act=SHOW_FORM&messageType=image">图片</a><a href="?act=SHOW_FORM&messageType=voice">语音</a><a href="?act=SHOW_FORM&messageType=video">视频</a><a href="?act=SHOW_FORM&messageType=music">音乐</a></td>
	</tr>
</table>

<!-- 表格 -->
<table class="data_panel">
	<thead>
		<tr>
			<th style="width: 50px;"><span>ID</span></th>
			<th><span>消息类型</span></th>
			<th><span>消息名</span></th>
		     <th style="width: 200px;"><span>操作</span></th>
		</tr>
	</thead>
	<tbody>
	    <#list page.result as item>
		<tr>
			     <td><#if item.id?has_content>${item.id}</#if></td>
			     <td><#if item.messageType?has_content>${messageTypeMap[item.messageType?string]}</#if></td>
			     <td><#if item.messageName?has_content>${item.messageName}</#if></td>
			     <td><#if item.messageType! =='news'><a href="<@full_path path="/wxMessageArticle"/>?mid=${item.id!}">添加图文项目</a> | </#if><a href="?act=SHOW_FORM&id=${item.id!}&messageType=${item.messageType!}">更新</a> | <a href="?act=DELETE&ids=${item.id!}">删除</a></td>
		</tr>
		</#list>
	</tbody>
</table>

<!-- 分页栏 -->
<table class="pager_panel">
	<tr>
		<td><@page_navigator/></td>
	</tr>
</table>
</body>
</html>