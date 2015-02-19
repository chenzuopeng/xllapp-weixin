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
				messageId: {
						required:true
				},
				articleUrl: {
						url: true
				},
				orderNo: {
						required:true,
						number: true
				}
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
<input id="id" name="id"  type="hidden"  value="<#if entity?has_content>${entity.id}</#if>"/>
<input id="messageId" name="messageId"  type="hidden"  value="<#if entity?has_content>${entity.messageId!}<#else>${RequestParameters['mid']!}</#if>" />
<table class="save_form_table" border="1">
	        <tr>
				<td class="save_form_field_label"><span>图文标题</span></td>
				<td><input class="save_form_field_input" id="articleTitle" name="articleTitle"  type="text"  value="<#if entity?has_content>${entity.articleTitle!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>图文描述</span></td>
				<td><textarea class="save_form_field_textarea" id="articleDescription" name="articleDescription" ><#if entity?has_content>${entity.articleDescription!}</#if></textarea></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>图片</span></td>
				<td><input class="save_form_field_input" id="articlePic" name="articlePic"  type="text"  value="<#if entity?has_content>${entity.articlePic!}</#if>" fileUploadType="image"/></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>跳转URL</span></td>
				<td><input class="save_form_field_input" id="articleUrl" name="articleUrl"  type="text"  value="<#if entity?has_content>${entity.articleUrl!}</#if>" /></td>
		    </tr>
		    <tr>
				<td class="save_form_field_label"><span>排序号</span></td>
				<td><input class="save_form_field_input" id="orderNo" name="orderNo"  type="text"  value="<#if entity?has_content>${entity.orderNo!}</#if>" /></td>
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