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

</head>

<body>
<table class="save_form_table" border="1">
	        <tr>
				<td class="save_form_field_label"><span>ID</span></td>
				<td><input class="save_form_field_input"  id="id" name="id"  value="<#if entity?has_content>${entity.id}</#if>" /></td>
		    </tr>
		    <tr>
				<td class="save_form_field_label"><span>消息ID</span></td>
				<td><input class="save_form_field_input" id="msgId" name="msgId"  type="text"  value="<#if entity?has_content>${entity.msgId!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>发送用户</span></td>
				<td><input class="save_form_field_input" id="toUserName" name="toUserName"  type="text"  value="<#if entity?has_content>${entity.toUserName!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>接收用户</span></td>
				<td><input class="save_form_field_input" id="fromUserName" name="fromUserName"  type="text"  value="<#if entity?has_content>${entity.fromUserName!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>消息类型</span></td>
				<td><input class="save_form_field_input" id="msgType" name="msgType"  type="text"  value="<#if entity?has_content>${entity.msgType!}</#if>" /></td>
		    </tr>
				<td class="save_form_field_label"><span>消息内容</span></td>
				<td><textarea class="save_form_field_textarea" id="inMessage" name="inMessage" ><#if entity?has_content>${entity.inMessage!}</#if></textarea></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>响应内容</span></td>
				<td><textarea class="save_form_field_textarea" id="outMessage" name="outMessage" ><#if entity?has_content>${entity.outMessage!}</#if></textarea></td>
		    </tr>
		    <tr>
				<td class="save_form_field_label"><span>处理结果</span></td>
				<td><select class="search_field_input search_field_select" id="result" name="result" >
				            <option value="">选择</option>
							<option value="0" <#if entity?has_content && entity.result!?string == '0'>selected='selected'</#if>>成功</option>
							<option value="1" <#if entity?has_content && entity.result!?string == '1'>selected='selected'</#if>>失败</option>
			       </select></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>错误信息</span></td>
				<td><textarea class="save_form_field_textarea" id="error" name="error" ><#if entity?has_content>${entity.error!}</#if></textarea></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>日志时间</span></td>
				<td><input class="save_form_field_input save_form_field_readonly" id="createTime" name="createTime" type="text" readonly="true" onfocus="this.blur();" value="<#if entity?has_content && entity.createTime?has_content>${entity.createTime?datetime}</#if>"/></td>
		    </tr>
</table>
</body>
</html>