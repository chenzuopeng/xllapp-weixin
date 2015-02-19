package org.xllapp.portal.weixin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.xllapp.portal.main.dao.ConfigDao;
import org.xllapp.portal.main.entity.Config;

/**
 *
 *
 * @Copyright: Copyright (c) 2014 FFCS All Rights Reserved
 * @Company: 北京福富软件有限公司
 * @author 陈作朋 Dec 17, 2014
 * @version 1.00.00
 * @history:
 * 
 */
@Controller
public class WxAccountQRCodeController {

	private ConfigDao configDao;

	@RequestMapping("/getAccountQRCode")
	public String getAccountQRcode(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception {
		Config config = this.configDao.getConfig("weixin", "account_qrcode");
		String  accountQRCodeUrl="";
		if(null!=config){
			accountQRCodeUrl=config.getConfigValue();
		}
		model.addAttribute("accountQRCodeUrl", accountQRCodeUrl);
		return "accountqrcode/account-qrcode";
	}

	@Autowired
	public void setConfigDao(ConfigDao configDao) {
		this.configDao = configDao;
	}

}
