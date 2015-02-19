<#assign resultMap = {"0":"成功","1":"失败"}>
<!DOCTYPE html>
<html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" media="screen" href="<@full_path path="css/icity.css"/>"/>
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
					  <td><span>处理结果</span></td>
					  <td>
		    <select class="search_field_input search_field_select" id="result" name="result">
                <option value="">选择</option>
				<option value="0" <#if RequestParameters['result']! == '0'>selected='selected'</#if>>成功</option>
				<option value="1" <#if RequestParameters['result']! == '1'>selected='selected'</#if>>失败</option>
			</select>
				      </td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>发送用户</span></td>
					  <td>
		   <input class="search_field_input" id="fromUserName" name="fromUserName" type="text"  value="${RequestParameters['fromUserName']!}"/>
				      </td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>日志时间</span></td>
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

<div style="margin-top:10px;margin-bottom: 10px;"/>

<!-- 表格 -->
<table class="data_panel">
	<thead>
		<tr>
			<th><span>ID</span></th>
			<th><span>消息ID</span></th>
			<th><span>发送用户</span></th>
			<th><span>接收用户</span></th>
			<th><span>消息类型</span></th>
			<th><span>处理结果</span></th>
			<th><span>日志时间</span></th>
		     <th style="width: 100px;"><span>操作</span></th>
		</tr>
	</thead>
	<tbody>
	    <#list page.result as item>
		<tr>
			     <td><#if item.id?has_content>${item.id}</#if></td>
			     <td><#if item.msgId?has_content>${item.msgId}</#if></td>
			     <td><#if item.fromUserName?has_content>${item.fromUserName}</#if></td>
			     <td><#if item.toUserName?has_content>${item.toUserName}</#if></td>
			     <td><#if item.msgType?has_content>${item.msgType}</#if></td>
			     <td><#if item.result?has_content>${resultMap[item.result?string]}</#if></td>
			     <td><#if item.createTime?has_content>${item.createTime?datetime}</#if></td>
			     <td><a href="?act=SHOW_FORM&id=${item.id!}">查看</a></td>
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