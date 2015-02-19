<#assign menuTypeMap = {"click":"点击推事件","view":"跳转URL"}>
<#assign menuLevelMap = {"1":"一级菜单","2":"二级菜单"}>
<!DOCTYPE html>
<html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>

<p><span style="font-weight:bold;">同步结果:</span> <span style="color: red;">${message}</span></p>

<p style="font-weight:bold;">以下为没有同步到微信的无效的菜单:</p>
<table style="border-collapse:collapse;border:none;">
	<thead>
		<tr>
			<th style="border:solid#000 1px;width: 100px;"><span>菜单ID</span></th>
			<th style="border:solid#000 1px;width: 100px;"><span>菜单等级</span></th>
			<th style="border:solid#000 1px;width: 100px;"><span>菜单类型</span></th>
			<th style="border:solid#000 1px;width: 100px;"><span>菜单名</span></th>
		</tr>
	</thead>
	<tbody>
	    <#list invalidMenus as item>
		<tr>
			     <td style="border:solid#000 1px;width: 100px;" align="center"><#if item.id?has_content>${item.id}</#if></td>
			     <td style="border:solid#000 1px;width: 100px;" align="center"><#if item.menuLevel?has_content>${menuLevelMap[item.menuLevel?string]}</#if></td>
			     <td style="border:solid#000 1px;width: 100px;" align="center"><#if item.menuType?has_content>${menuTypeMap[item.menuType?string]}<#else>菜单组</#if></td>
			     <td style="border:solid#000 1px;width: 100px;" align="center"><#if item.menuName?has_content>${item.menuName}</#if></td>
		</tr>
		</#list>
	</tbody>
</table>
<br>
<a href="<@full_path path="/wxMenu"/>">返回菜单列表</a>
</body>
</html>