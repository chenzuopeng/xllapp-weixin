
<#macro getMessageId>${RequestParameters['mid']!}</#macro>

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

<!-- 按钮栏 -->
<table class="button_panel">
	<tr>
		<td><span style="color: red;">注意:微信图文消息最多只能有10条,因此只有前10个条会生效.</span><input class="action_button"  type="button" value="添加" onclick="showUrlByButton('?act=SHOW_FORM&mid=<@getMessageId/>')"></td>
	</tr>
</table>

<!-- 表格 -->
<table class="data_panel">
	<thead>
		<tr>
			<th><span>ID</span></th>
			<th><span>排序号</span></th>
			<th><span>图文标题</span></th>
			<th><span>创建时间</span></th>
		     <th style="width: 100px;"><span>操作</span></th>
		</tr>
	</thead>
	<tbody>
	    <#list page.result as item>
		<tr>
			     <td><#if item.id?has_content>${item.id}</#if></td>
			     <td><#if item.orderNo?has_content>${item.orderNo}</#if></td>
			     <td><#if item.articleTitle?has_content>${item.articleTitle}</#if></td>
			   　 <td><#if item.createTime?has_content>${item.createTime?datetime}</#if></td>
			     <td><a href="?act=SHOW_FORM&id=${item.id!}">更新</a> | <a href="?act=DELETE&ids=${item.id!}&mid=<@getMessageId/>">删除</a></td>
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