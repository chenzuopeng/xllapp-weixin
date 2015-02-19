package org.xllapp.portal.weixin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ffcs.icity.mvc.controller.SimpleController;
import com.ffcs.icity.mvc.dao.CRUDDao;

import org.xllapp.portal.weixin.dao.WxEventMessageDao;
import org.xllapp.portal.weixin.dao.WxMessageDao;
import org.xllapp.portal.weixin.entity.WxEventMessage;


@RequestMapping("wxEventMessage")
@Controller
public class WxEventMessageController extends SimpleController<WxEventMessage>{

	private WxEventMessageDao wxEventMessageDao;
	
	private WxMessageDao  wxMessageDao;
	
	@Override
	protected Object showForm(HttpServletRequest req, HttpServletResponse resp, ModelAndView model) {
		model.addObject("messageNames", wxMessageDao.getMessageNames());
		return super.showForm(req, resp, model);
	}

	@Override
	protected CRUDDao<WxEventMessage> getDao() {
		return this.wxEventMessageDao;
	}

	@Autowired
	public void setWxEventMessageDao(WxEventMessageDao wxEventMessageDao) {
		this.wxEventMessageDao = wxEventMessageDao;
	}
	
	@Autowired
	public void setWxMessageDao(WxMessageDao wxMessageDao) {
		this.wxMessageDao = wxMessageDao;
	}
	
}
