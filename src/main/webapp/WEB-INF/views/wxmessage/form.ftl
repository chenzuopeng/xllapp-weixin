<#assign messageType=RequestParameters['messageType']!?string>

<#macro getFileUploadConfig messageType>
<#if messageType == 'image'>
   <#t>fileUploadType="image" fileUploadStrategy="image-message"
<#elseif messageType == 'voice'>
   <#t>fileUploadType="file" fileUploadStrategy="voice-message"
<#elseif messageType == 'video'>
    <#t>fileUploadType="file" fileUploadStrategy="video-message"
<#elseif messageType == 'music'>
    <#t>fileUploadType="file" fileUploadStrategy="music-message"
</#if>
</#macro>

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
                <#if messageType=='image'||messageType=='voice'||messageType=='video'||messageType=='music'>
                messageMedia: {
                        required:true
                },
                </#if>
                <#if messageType == 'music' >
                messageThumb: {
                        required:true
                },
                </#if>
				messageType: {
						required:true
				},
				messageName: {
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
<input type="hidden" id="messageType" name="messageType"  value="${messageType}"/>
<table class="save_form_table" border="1">
	        <tr>
				<td class="save_form_field_label"><span>消息名</span></td>
				<td><input class="save_form_field_input" id="messageName" name="messageName"  type="text"  value="<#if entity?has_content>${entity.messageName!}</#if>" /></td>
		    </tr>
		    
		    <#if messageType == 'text'>
	        <tr>
				<td class="save_form_field_label"><span>消息内容</span></td>
				<td><textarea class="save_form_field_textarea" id="messageContent" name="messageContent" ><#if entity?has_content>${entity.messageContent!}</#if></textarea></td>
		    </tr>
		    </#if>
		    
		    <#if messageType=='video'||messageType=='music'>	    
	        <tr>
				<td class="save_form_field_label"><span>消息的标题</span></td>
				<td><input class="save_form_field_input" id="messageTitle" name="messageTitle"  type="text"  value="<#if entity?has_content>${entity.messageTitle!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>消息的描述</span></td>
				<td><textarea class="save_form_field_textarea" id="messageDescription" name="messageDescription" ><#if entity?has_content>${entity.messageDescription!}</#if></textarea></td>
		    </tr>
		    </#if>
		    
		    <#if messageType=='image'||messageType=='voice'||messageType=='video'||messageType=='music'>
	        <tr>
				<td class="save_form_field_label"><span>媒体文件</span></td>
				<td><input class="save_form_field_input" id="messageMedia" name="messageMedia" readonly="true"  type="text"  value="<#if entity?has_content>${entity.messageMedia!}</#if>" <@getFileUploadConfig messageType/>　/></td>
		    </tr>
		    </#if>
		    
		    <#if messageType == 'music' >
	        <tr>
				<td class="save_form_field_label"><span>高清的媒体文件</span></td>
				<td><input class="save_form_field_input" id="messageHqMedia" name="messageHqMedia" readonly="true"  type="text"  value="<#if entity?has_content>${entity.messageHqMedia!}</#if>" fileUploadType="file" fileUploadStrategy="hdmusic-message"/></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>消息的缩略图</span></td>
				<td><input class="save_form_field_input" id="messageThumb" name="messageThumb"  type="text" readonly="true"  value="<#if entity?has_content>${entity.messageThumb!}</#if>" fileUploadType="image" fileUploadStrategy="message-thumb"/></td>
		    </tr>
		     </#if>
		     
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