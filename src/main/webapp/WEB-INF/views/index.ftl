<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<link href="<@full_path path="dwz/themes/default/style.css"/>" rel="stylesheet" type="text/css" media="screen"/>
<link href="<@full_path path="dwz/themes/css/core.css"/>" rel="stylesheet" type="text/css" media="screen"/>
<link href="<@full_path path="dwz/themes/css/print.css"/>" rel="stylesheet" type="text/css" media="print"/>
<link href="<@full_path path="dwz/uploadify/css/uploadify.css"/>" rel="stylesheet" type="text/css" media="screen"/>
<!--[if IE]>
<link href="<@full_path path="dwz/themes/css/ieHack.css"/>" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="<@full_path path="dwz/js/speedup.js"/>" type="text/javascript"></script>
<![endif]-->

<script src="<@full_path path="dwz/js/jquery-1.7.2.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/jquery.cookie.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/jquery.validate.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/jquery.bgiframe.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/xheditor/xheditor-1.2.1.min.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/xheditor/xheditor_lang/zh-cn.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/uploadify/scripts/jquery.uploadify.js"/>" type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="text/javascript" src="<@full_path path="dwz/chart/raphael.js"/>"></script>
<script type="text/javascript" src="<@full_path path="dwz/chart/g.raphael.js"/>"></script>
<script type="text/javascript" src="<@full_path path="dwz/chart/g.bar.js"/>"></script>
<script type="text/javascript" src="<@full_path path="dwz/chart/g.line.js"/>"></script>
<script type="text/javascript" src="<@full_path path="dwz/chart/g.pie.js"/>"></script>
<script type="text/javascript" src="<@full_path path="dwz/chart/g.dot.js"/>"></script>

<script src="<@full_path path="dwz/js/dwz.core.ext.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.util.date.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.validate.method.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.barDrag.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.drag.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.tree.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.accordion.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.ui.js"/>"  type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.theme.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.switchEnv.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.alertMsg.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.contextmenu.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.navTab.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.tab.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.resize.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.dialog.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.dialogDrag.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.sortDrag.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.cssTable.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.stable.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.taskBar.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.ajax.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.pagination.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.database.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.datepicker.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.effects.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.panel.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.checkbox.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.history.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.combox.js"/>" type="text/javascript"></script>
<script src="<@full_path path="dwz/js/dwz.print.js"/>" type="text/javascript"></script>

<script src="<@full_path path="dwz/js/dwz.regional.zh.js"/>" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	DWZ.init("<@full_path path="dwz/dwz.frag.xml"/>", {
		debug:true,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
		}
	});
});
</script>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav"></div>
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>

				<div class="accordion" fillSpace="sidebar">
					
				    <div class="accordionHeader">
						<h2><span>Folder</span>微信管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
									<li><a href="<@full_path path="/wxMenu"/>" target="navTab" rel="wx_menu" external="true">菜单管理</a></li>
									<li><a href="<@full_path path="/wxKeyword"/>" target="navTab" rel="wx_keyword" external="true">关键词管理</a></li>
									<li><a href="<@full_path path="/wxMessage"/>" target="navTab" rel="wx_message" external="true">消息管理</a></li>
									<li><a href="<@full_path path="/wxEventMessage"/>" target="navTab" rel="wx_event_message" external="true">配置管理</a></li>
									<li><a href="<@full_path path="/wxSubscribeAccount"/>" target="navTab" rel="wx_subscribe_account" external="true">关注用户</a></li>
									<li><a href="<@full_path path="/wxLog"/>" target="navTab" rel="wx_log" external="true">微信日志</a></li>
									<li><a href="<@full_path path="/getAccountQRCode"/>" target="navTab" rel="wx_account_qrcode" external="true">账号二维码</a></li>
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>系统配置</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
									<li><a href="<@full_path path="/config"/>" target="navTab" rel="wx_config" external="true">系统配置</a></li>
　　　　　　　　　　　　　　　　　　　　　　　　</ul>
					</div>
					
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
				</div>
			</div>
		</div>
	</div>
</body>
</html>