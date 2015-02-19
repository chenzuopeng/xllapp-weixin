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
		    </tr
	        <tr>
				<td class="save_form_field_label"><span>openId</span></td>
				<td><input class="save_form_field_input" id="openId" name="openId"  type="text"  value="<#if entity?has_content>${entity.openId!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>昵称</span></td>
				<td><input class="save_form_field_input" id="nickname" name="nickname"  type="text"  value="<#if entity?has_content>${entity.nickname!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>性别</span></td>
				<td><input class="save_form_field_input" id="sex" name="sex"  type="text"  value="<#if entity?has_content>${entity.sex!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>城市</span></td>
				<td><input class="save_form_field_input" id="city" name="city"  type="text"  value="<#if entity?has_content>${entity.city!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>省份</span></td>
				<td><input class="save_form_field_input" id="province" name="province"  type="text"  value="<#if entity?has_content>${entity.province!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>国家</span></td>
				<td><input class="save_form_field_input" id="country" name="country"  type="text"  value="<#if entity?has_content>${entity.country!}</#if>" /></td>
		    </tr>
		    <tr>
				<td class="save_form_field_label"><span>用户的语言</span></td>
				<td><input class="save_form_field_input" id="language" name="language"  type="text"  value="<#if entity?has_content>${entity.language!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>头像url</span></td>
				<td><input class="save_form_field_input" id="headImgUrl" name="headImgUrl"  type="text"  value="<#if entity?has_content>${entity.headImgUrl!}</#if>" /><br><img src="<#if entity?has_content>${entity.headImgUrl!}</#if>" width="100px" height="100px"  style="margin-top:5px;margin-left: 5px;"/></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>unionid</span></td>
				<td><input class="save_form_field_input" id="unionId" name="unionId"  type="text"  value="<#if entity?has_content>${entity.unionId!}</#if>" /></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>关注状态</span></td>
				<td><select class="search_field_input search_field_select" id="subscribe" name="subscribe" >
				            <option value="">选择</option>
							<option value="1" <#if entity?has_content && entity.subscribe!?string == '1'>selected='selected'</#if>>关注</option>
							<option value="0" <#if entity?has_content && entity.subscribe!?string == '0'>selected='selected'</#if>>取消关注</option>
			       </select></td>
		    </tr>
		    <tr>
				<td class="save_form_field_label"><span>关注时间</span></td>
				<td><input class="save_form_field_input" id="subscribeTime" name="subscribeTime" type="text" readonly="true" value="<#if entity?has_content && entity.subscribeTime?has_content>${entity.subscribeTime?datetime}</#if>"/></td>
		    </tr>
		    <tr>
				<td class="save_form_field_label"><span>取消关注时间</span></td>
				<td><input class="save_form_field_input" id="unsubscribeTime" name="unsubscribeTime" type="text" readonly="true" value="<#if entity?has_content && entity.unsubscribeTime?has_content>${entity.unsubscribeTime?datetime}</#if>"/></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>入库时间</span></td>
				<td><input class="save_form_field_input save_form_field_readonly" id="createTime" name="createTime" type="text" readonly="true" onfocus="this.blur();" value="<#if entity?has_content && entity.createTime?has_content>${entity.createTime?datetime}</#if>"/></td>
		    </tr>
</table>
</body>
</html>