package org.xllapp.portal.weixin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ffcs.icity.mvc.controller.SimpleController;
import com.ffcs.icity.mvc.dao.CRUDDao;

import org.xllapp.portal.weixin.dao.WxKeywordDao;
import org.xllapp.portal.weixin.dao.WxMessageDao;
import org.xllapp.portal.weixin.entity.WxKeyword;


@RequestMapping("wxKeyword")
@Controller
public class WxKeywordController extends SimpleController<WxKeyword>{

	private WxKeywordDao wxKeywordDao;
	
	private WxMessageDao  wxMessageDao;

	@Override
	protected Object showForm(HttpServletRequest req, HttpServletResponse resp, ModelAndView model) {
		model.addObject("messageNames", this.wxMessageDao.getMessageNames());
		return super.showForm(req, resp, model);
	}

	@Override
	protected CRUDDao<WxKeyword> getDao() {
		return this.wxKeywordDao;
	}

	@Autowired
	public void setWxKeywordDao(WxKeywordDao wxKeywordDao) {
		this.wxKeywordDao = wxKeywordDao;
	}
	
	@Autowired
	public void setWxMessageDao(WxMessageDao wxMessageDao) {
		this.wxMessageDao = wxMessageDao;
	}
	
}
