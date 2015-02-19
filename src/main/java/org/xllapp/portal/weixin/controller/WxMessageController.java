package org.xllapp.portal.weixin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ffcs.icity.mvc.controller.SimpleController;
import com.ffcs.icity.mvc.dao.CRUDDao;

import org.xllapp.portal.weixin.dao.WxMessageDao;
import org.xllapp.portal.weixin.entity.WxMessage;


@RequestMapping("wxMessage")
@Controller
public class WxMessageController extends SimpleController<WxMessage>{

	private WxMessageDao wxMessageDao;

	@Override
	protected CRUDDao<WxMessage> getDao() {
		return this.wxMessageDao;
	}

	@Autowired
	public void setWxMessageDao(WxMessageDao wxMessageDao) {
		this.wxMessageDao = wxMessageDao;
	}
	
}
