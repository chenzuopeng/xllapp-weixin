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
          		menuLevel: {
						required:true
				},
				isBranch: {
						required:true
				},
				menuName: {
						required:true
				},
				menuUrl:{
				        url: true
				},
                orderNo: {
						required:true,
						number: true
				}
		 },
		 errorClass:"search_error",
		 errorElement:"div",
		 submitHandler: function(form) {
             form.submit();
         }});
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
				<td class="save_form_field_label"><span>菜单等级</span></td>
				<td><select class="search_field_input search_field_select" id="menuLevel" name="menuLevel" >
				            <option value="">选择</option>
							<option value="1" <#if entity?has_content && entity.menuLevel!?string == '1'>selected='selected'</#if>>一级菜单</option>
							<option value="2" <#if entity?has_content && entity.menuLevel!?string == '2'>selected='selected'</#if>>二级菜单</option>
			       </select></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>所属菜单组</span></td>
				<td><select class="search_field_input search_field_select" id="pid" name="pid"  >
				            <option value="">选择</option>
				            <#list branchMenus as item>
							<option value="${item.id}" <#if entity?has_content && entity.pid!?string == item.id?string>selected='selected'</#if>>${item.menuName}</option>
							</#list>
			       </select></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>是否菜单组</span></td>
				<td><select class="search_field_input search_field_select" id="isBranch" name="isBranch" >
				            <option value="">选择</option>
							<option value="0" <#if entity?has_content && entity.isBranch!?string == '0'>selected='selected'</#if>>是</option>
							<option value="1" <#if entity?has_content && entity.isBranch!?string == '1'>selected='selected'</#if>>否</option>
			       </select><br><span style="margin-left: 5px;">注:菜单组最多只能有3个</span></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>菜单类型</span></td>
				<td><select class="search_field_input search_field_select" id="menuType" name="menuType" >
				            <option value="">选择</option>
							<option value="click" <#if entity?has_content && entity.menuType!?string == 'click'>selected='selected'</#if>>点击推事件</option>
							<option value="view" <#if entity?has_content && entity.menuType!?string == 'view'>selected='selected'</#if>>跳转URL</option>
			       </select></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>菜单名</span></td>
				<td><input class="save_form_field_input" id="menuName" name="menuName"  type="text"  value="<#if entity?has_content>${entity.menuName!}</#if>" /><br><span style="margin-left: 5px;">注:菜单组最多只能有3个;非菜单组菜单最多只能5个</span></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>菜单KEY</span></td>
				<td><input class="save_form_field_input" id="menuKey" name="menuKey"  type="text"  value="<#if entity?has_content>${entity.menuKey!}</#if>" /></td>
		    </tr>
		    <tr>
				<td class="save_form_field_label"><span>消息</span></td>
				<td><select class="search_field_input search_field_select" id="messageId" name="messageId" >
				            <option value="">选择</option>
				            <#list messageNames as item>
							<option value="${item.id}" <#if entity?has_content && entity.messageId!?string == item.id?string>selected='selected'</#if>>${item.messageName}</option>
							</#list>
			       </select></td>
		    </tr>
	        <tr>
				<td class="save_form_field_label"><span>页面连接</span></td>
				<td><input class="save_form_field_input" id="menuUrl" name="menuUrl"  type="text"  value="<#if entity?has_content>${entity.menuUrl!}</#if>" /></td>
		    </tr>
		    <tr>
				<td class="save_form_field_label"><span>排序编号</span></td>
				<td><input class="save_form_field_input" id="orderNo" name="orderNo"  type="text"  value="<#if entity?has_content>${entity.orderNo!}</#if>" /><br><span style="margin-left: 5px;">注:数值大的在前</span></td>
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