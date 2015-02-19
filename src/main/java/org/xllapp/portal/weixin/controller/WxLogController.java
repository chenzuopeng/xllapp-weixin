package org.xllapp.portal.weixin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ffcs.icity.mvc.controller.SimpleController;
import com.ffcs.icity.mvc.dao.CRUDDao;

import org.xllapp.portal.weixin.dao.WxLogDao;
import org.xllapp.portal.weixin.entity.WxLog;


@RequestMapping("wxLog")
@Controller
public class WxLogController extends SimpleController<WxLog>{

	private WxLogDao wxLogDao;

	@Override
	protected CRUDDao<WxLog> getDao() {
		return this.wxLogDao;
	}

	@Autowired
	public void setWxLogDao(WxLogDao wxLogDao) {
		this.wxLogDao = wxLogDao;
	}
	
}
