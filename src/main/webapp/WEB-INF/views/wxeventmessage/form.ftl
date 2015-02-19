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
				event: {
						required:true
				},
				messageId: {
						required:true
				},
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
				<td class="save_form_field_label"><span>事件类型</span></td>
				<td><input class="save_form_field_input" id="event" name="event"  type="text"  value="<#if entity?has_content>${entity.event!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>事件描述</span></td>
				<td><input class="save_form_field_input" id="description" name="description"  type="text"  value="<#if entity?has_content>${entity.description!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>关联的消息ID</span></td>
				<td><select class="search_field_input search_field_select" id="messageId" name="messageId" >
				            <option value="">选择</option>
				            <#list messageNames as item>
							<option value="${item.id}" <#if entity?has_content && entity.messageId!?string == item.id?string>selected='selected'</#if>>${item.messageName}</option>
							</#list>
			       </select></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>创建时间</span></td>
				<td><input class="save_form_field_input save_form_field_readonly" id="createTime" name="createTime" type="text" readonly="true" onfocus="this.blur();" value="<#if entity?has_content && entity.createTime?has_content>${entity.createTime?datetime}</#if>"/></td>
		    </tr>
		<tr>
			<td colspan="2" class="save_form_button_panel"><input type="submit"  value="保存"/><input type="reset" class="reset" value="重置"/></td>
		</tr>
</table>
</form>
</body>
</html>