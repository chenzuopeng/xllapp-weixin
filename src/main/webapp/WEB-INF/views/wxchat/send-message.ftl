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
                content: {
                        required: function() {
                                  var messageId =$("#messageId").find("option:selected").val();
                                  return jQuery.trim(messageId).length == 0;
                             }
                },
                messageId: {
                        required: function() {
                                  var content =$("#content").val();
                                  return jQuery.trim(content).length == 0;
                             }
                },
		 },
		 errorClass:"search_error",
		 errorElement:"div"});
		 
		 $("#saveForm").submit(function() {
                $.ajax({
                   type:"POST",
                   url:"<@full_path path="wxchat"/>",
                   data:{
                       openId:$("#openId").val(),
                       messageId:$("#messageId").find("option:selected").val(),
                       content:$("#content").val()
                   },
                   success:function(data){
                        $.jBox.success(data, '');
                       $("#chat_log_list").attr('src', $("#chat_log_list").attr('src'));
                   },
                   error:function(xhr,data,error){
                       $.jBox.error(desc, '发送失败');
                   }
                });
               return false;
         });
		 
	  $(".reset").click(function() {
           validator.resetForm();
      });
      
});

//-->
</script>

</head>

<body>
	<form id="saveForm" method="post" action="">
	    <input type="hidden" id="openId" name="openId"  value="${RequestParameters['openId']!}"/>
		<table class="save_form_table" border="1">
			<tr>
				<td class="save_form_field_label"><span>预置消息</span></td>
				<td><select class="search_field_input search_field_select" id="messageId" name="messageId" >
				            <option value="">选择</option>
				            <#list messageNames as item>
							<option value="${item.id}" <#if entity?has_content && entity.messageId!?string == item.id?string>selected='selected'</#if>>${item.messageName}</option>
							</#list>
			       </select></td>
		    </tr>
		    <tr>
				<td class="save_form_field_label"><span>临时消息</span></td>
				<td><textarea class="save_form_field_textarea" id="content" name="content"><#if entity?has_content>${entity.messageContent!}</#if></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="save_form_button_panel"><input type="submit" value="发送" /><input type="reset" class="reset" value="重置" /></td>
			</tr>
		</table>
	</form>

	<table class="save_form_table" border="1" style="margin-top: 10px;">
		<tr>
			<td style="padding: 10px;height: 500px;"><iframe id="chat_log_list" width="100%" height="100%" marginheight="0" marginwidth="0"  frameborder="0" scrolling="auto" src="<@full_path path=" /wxChatLog"/>" /></td>
		</tr>
	</table>

</body>
</html>