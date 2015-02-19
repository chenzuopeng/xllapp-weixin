package org.xllapp.portal.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * 
 * @Copyright: Copyright (c) 2014 FFCS All Rights Reserved
 * @Company: 北京福富软件有限公司
 * @author 陈作朋 Mar 13, 2014
 * @version 1.00.00
 * @history:
 * 
 */
@Controller
public class IndexController {

	@RequestMapping("/index")
	public Object index(HttpServletRequest request, Model model) {
		return "index";
	}

}
