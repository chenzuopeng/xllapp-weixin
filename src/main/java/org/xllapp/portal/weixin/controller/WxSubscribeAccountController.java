package org.xllapp.portal.weixin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ffcs.icity.mvc.controller.SimpleController;
import com.ffcs.icity.mvc.dao.CRUDDao;

import org.xllapp.portal.weixin.dao.WxSubscribeAccountDao;
import org.xllapp.portal.weixin.entity.WxSubscribeAccount;


@RequestMapping("wxSubscribeAccount")
@Controller
public class WxSubscribeAccountController extends SimpleController<WxSubscribeAccount>{

	private WxSubscribeAccountDao wxSubscribeAccountDao;

	@Override
	protected CRUDDao<WxSubscribeAccount> getDao() {
		return this.wxSubscribeAccountDao;
	}

	@Autowired
	public void setWxSubscribeAccountDao(WxSubscribeAccountDao wxSubscribeAccountDao) {
		this.wxSubscribeAccountDao = wxSubscribeAccountDao;
	}
	
}
