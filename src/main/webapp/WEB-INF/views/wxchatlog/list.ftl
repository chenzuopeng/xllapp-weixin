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

<style type="text/css">

.chat_panel {
	border-collapse: collapse;
	border: 1px solid #BFD8E0;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: auto;
	margin-right:auto;
	width: 95%;
}

.chat_panel_tr {
	background-color: white;
}

.chat_panel_tr>td:first-of-type {
	padding: 10px;
	border: none;
	width: 60px;
	text-align: right;
}

.chat_panel_tr > td:last-of-type {
	padding: 10px;
	border: none;
}

.head_img_url {
	width: 50px;
	height: 50px;
}

.chat_message {
	border: none;
	width: 100%;
}

.chat_user_nickname {
	font-size: 15px;
	color: black;
	width: 70%;
}

.chat_time {
	font-size: 14px;
	color: #8d8d8d;
	width: 30%;
}

.chat_content {
	font-size: 14px;
	color: #8d8d8d;
}
</style>

</head>

<body style="background-color: white;">
<#list page.result as item>
<table class="chat_panel">
   <tr class="chat_panel_tr"   >
        <td><img class="head_img_url" src="<#if  item.sender!?string == '0'>${item.account.headImgUrl}<#else></#if>"></td>
        <td>
          <table class="chat_message">
             <tr>
                 <td class="chat_user_nickname"><#if  item.sender!?string == '0'>${item.account.nickname}<#else>平台</#if></td>
                 <td class="chat_time">${item.sendTime?datetime}</td>
             </tr>
             <tr>
                 <td class="chat_content" colspan="2">
                     <#if  item.messageType! == 'text'>
                      ${item.content}
                      <#else>
                       [${item.messageType!}]
                      </#if>
                </td>
           </tr>
          </table>
        </td>
   </tr>
</table>
</#list>

<!-- 分页栏 -->
<table class="pager_panel" style="margin: auto;">
	<tr>
		<td><@page_navigator/></td>
	</tr>
</table>
</body>
</html>