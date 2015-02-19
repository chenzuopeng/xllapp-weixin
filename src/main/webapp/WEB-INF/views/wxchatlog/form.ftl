<!DOCTYPE html>
<html>
<head>
<title>表单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" media="screen" href="<@full_path path="js/jBox/Skins/Default/jbox.css"/>"/>
<link type="text/css" rel="stylesheet" media="screen" href="<@full_path path="css/icity.css"/>"/>
<script type="text/javascript" src="<@full_path path="js/jquery/jquery-1.8.0.min.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jquery/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jquery/jquery.validate.messages_zh.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/My97DatePicker/WdatePicker.js"/>" ></script>
<script type="text/javascript" src="<@full_path path="js/jBox/jquery.jBox-2.3.min.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/jBox/i18n/jquery.jBox-zh-CN.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/icity.js"/>"></script>
<script type="text/javascript" src="<@full_path path="js/uploadfile.js"/>"></script>
<script type="text/javascript" src="<@full_path path="upload/file/js/variables"/>"></script>

<script type="text/javascript">
<!--
$().ready(function() {
     var validator = $("#saveForm").validate({
          rules: {
		 },
		 errorClass:"search_error",
		 errorElement:"div"});
	  $(".reset").click(function() {
           validator.resetForm();
      });
});
//-->
</script>
</head>

<body>
<form id="saveForm" method="post"  action="?act=SAVE">
<input type="hidden" id="id" name="id"  value="<#if entity?has_content>${entity.id}</#if>"/>
<table class="save_form_table" border="1">
	        <tr>
				<td class="save_form_field_label"><span>appId</span></td>
				<td><input class="save_form_field_input" id="appId" name="appId"  type="text"  value="<#if entity?has_content>${entity.appId!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>发送方</span></td>
				<td><input class="save_form_field_input" id="sender" name="sender"  type="text"  value="<#if entity?has_content>${entity.sender!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>openId</span></td>
				<td><input class="save_form_field_input" id="openId" name="openId"  type="text"  value="<#if entity?has_content>${entity.openId!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>消息类型</span></td>
				<td><input class="save_form_field_input" id="messageType" name="messageType"  type="text"  value="<#if entity?has_content>${entity.messageType!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>消息内容</span></td>
				<td><textarea class="save_form_field_textarea" id="content" name="content" ><#if entity?has_content>${entity.content!}</#if></textarea></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>消息ID</span></td>
				<td><input class="save_form_field_input" id="messageId" name="messageId"  type="text"  value="<#if entity?has_content>${entity.messageId!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>发送时间</span></td>
				<td><input class="save_form_field_input save_form_field_readonly" id="sendTime" name="sendTime"  type="text" readonly="true"  onfocus="this.blur();" value="<#if entity?has_content>${entity.sendTime!}</#if>" /></td>
		    </tr>
		<tr>
			<td colspan="2" class="save_form_button_panel"><input type="submit"  value="保存"/><input type="reset" class="reset" value="重置"/></td>
		</tr>
</table>
</form>
</body>
</html>