<#assign isBranchMap = {"0":"是","1":"否"}>
<#assign menuTypeMap = {"click":"点击推事件","view":"跳转URL"}>
<#assign menuLevelMap = {"1":"一级菜单","2":"二级菜单"}>
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
					  <td><span>是否菜单组</span></td>
					  <td><select class="search_field_input search_field_select" id="isBranch" name="isBranch">
                　　　　　　　　　　　　　<option value="">选择</option>
				　　　　　　　　　　　　　<option value="0" <#if RequestParameters['isBranch']! == '0'>selected='selected'</#if>>是</option>
				　　　　　　　　　　　　　<option value="1" <#if RequestParameters['isBranch']! == '1'>selected='selected'</#if>>否</option>
			　　　　　　　　　　　　　　</select></td>
		         </tr>
			</table>
			<table class="search_field">
				 <tr>
					  <td><span>父菜单</span></td>
					  <td><select class="search_field_input search_field_select" id="pid" name="pid"  >
				            <option value="">选择</option>
				            <#list branchMenus as item>
							<option value="${item.id}" <#if RequestParameters['pid']!?string == item.id?string>selected='selected'</#if>>${item.menuName}</option>
							</#list>
			       </select></td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>菜单名</span></td>
					  <td><input class="search_field_input" id="menuName" name="menuName" type="text"  value="${RequestParameters['menuName']!}"/></td>
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
		<td><input class="action_button"  type="button" value="添加" onclick="showUrlByButton('?act=SHOW_FORM')"><input class="action_button"  type="button" value="同步" onclick="showUrlByButton('<@full_path path="/wxMenu/syncToWeixin"/>')"></td>
	</tr>
</table>

<!-- 表格 -->
<table class="data_panel">
	<thead>
		<tr>
			<th><span>菜单ID</span></th>
			<th><span>菜单等级</span></th>
			<th><span>排序编号</span></th>
			<th><span>菜单组</span></th>
			<th><span>菜单类型</span></th>
			<th><span>菜单名</span></th>
			<th><span>创建时间</span></th>
		     <th style="width: 100px;"><span>操作</span></th>
		</tr>
	</thead>
	<tbody>
	    <#list page.result as item>
		<tr>
			     <td><#if item.id?has_content>${item.id}</#if></td>
			     <td><#if item.menuLevel?has_content>${menuLevelMap[item.menuLevel?string]}</#if></td>
			     <td><#if item.orderNo?has_content>${item.orderNo}</#if></td>
			     <td><#if item.isBranch?has_content>${isBranchMap[item.isBranch?string]}</#if></td>
			     <td><#if item.menuType?has_content>${menuTypeMap[item.menuType?string]}<#else>菜单组</#if></td>
			     <td><#if item.menuName?has_content>${item.menuName}</#if></td>
			     <td><#if item.createTime?has_content>${item.createTime?datetime}</#if></td>
			     <td><a href="?act=SHOW_FORM&id=${item.id!}">更新</a> | <a href="?act=DELETE&ids=${item.id!}">删除</a></td>
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