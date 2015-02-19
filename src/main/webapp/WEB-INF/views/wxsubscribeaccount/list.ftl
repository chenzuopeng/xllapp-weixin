<#assign subscribeMap = {"1":"关注","0":"取消关注"}>
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
					  <td><span>关注状态</span></td>
					  <td>
		    <select class="search_field_input search_field_select" id="subscribe" name="subscribe">
                <option value="">选择</option>
				<option value="1" <#if RequestParameters['subscribe']! == '1'>selected='selected'</#if>>关注</option>
				<option value="0" <#if RequestParameters['subscribe']! == '0'>selected='selected'</#if>>取消关注</option>
			</select>
				      </td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>openId</span></td>
					  <td>
		   <input class="search_field_input" id="openId" name="openId" type="text"  value="${RequestParameters['openId']!}"/>
				      </td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>昵称</span></td>
					  <td>
		   <input class="search_field_input" id="nickname" name="nickname" type="text"  value="${RequestParameters['nickname']!}"/>
				      </td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>城市</span></td>
					  <td>
		   <input class="search_field_input" id="city" name="city" type="text"  value="${RequestParameters['city']!}"/>
				      </td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>省份</span></td>
					  <td>
		   <input class="search_field_input" id="province" name="province" type="text"  value="${RequestParameters['province']!}"/>
				      </td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>国家</span></td>
					  <td>
		   <input class="search_field_input" id="country" name="country" type="text"  value="${RequestParameters['country']!}"/>
				      </td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>关注时间</span></td>
					  <td>
		   <input class="search_field_input" id="subscribeTimeBegin" name="subscribeTimeBegin" type="text" readonly="readonly" onclick="showDatePicker('subscribeTimeBegin')" value="${RequestParameters['subscribeTimeBegin']!}"/>至<input class="search_field_input" id="subscribeTimeEnd" name="subscribeTimeEnd" type="text" readonly="readonly" onclick="showDatePicker('subscribeTimeEnd')" value="${RequestParameters['subscribeTimeEnd']!}"/>
				      </td>
		         </tr>
			</table>
            <table class="search_field">
				 <tr>
					  <td><span>取消关注时间</span></td>
					  <td>
		   <input class="search_field_input" id="unsubscribeTimeBegin" name="unsubscribeTimeBegin" type="text" readonly="readonly" onclick="showDatePicker('unsubscribeTimeBegin')" value="${RequestParameters['unsubscribeTimeBegin']!}"/>至<input class="search_field_input" id="unsubscribeTimeEnd" name="unsubscribeTimeEnd" type="text" readonly="readonly" onclick="showDatePicker('unsubscribeTimeEnd')" value="${RequestParameters['unsubscribeTimeEnd']!}"/>
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
<div style="margin-top:10px;margin-bottom: 10px;"/>

<!-- 表格 -->
<table class="data_panel">
	<thead>
		<tr>
			<th><span>昵称</span></th>
			<th style="width: 50px;"><span>性别</span></th>
			<th style="width: 100px;"><span>头像</span></th>
			<th style="width: 100px;"><span>关注状态</span></th>
		    <th style="width: 150px;"><span>操作</span></th>
		</tr>
	</thead>
	<tbody>
	    <#list page.result as item>
		<tr>
			     <td><#if item.nickname?has_content>${item.nickname}</#if></td>
			     <td><#if item.sex?has_content>${item.sex}</#if></td>
			     <td><img src="<#if item.headImgUrl?has_content>${item.headImgUrl}</#if>"  width="48px" height="48px"/></td>
			     <td><#if item.subscribe?has_content>${subscribeMap[item.subscribe?string]}</#if></td>
			     <td><a href="<@full_path path=" /wxchat"/>?openId=${item.openId}">聊天</a> | <a href="?act=SHOW_FORM&id=${item.id!}">详细资料</a></td>
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