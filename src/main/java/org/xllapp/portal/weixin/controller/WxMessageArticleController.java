package org.xllapp.portal.weixin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.xllapp.portal.weixin.dao.WxMessageArticleDao;
import org.xllapp.portal.weixin.entity.WxMessageArticle;

import com.ffcs.icity.mvc.controller.SimpleController;
import com.ffcs.icity.mvc.dao.CRUDDao;
import com.ffcs.icity.mvc.support.RequestContextHolder;

@RequestMapping("wxMessageArticle")
@Controller
public class WxMessageArticleController extends SimpleController<WxMessageArticle> {

	private WxMessageArticleDao wxMessageArticleDao;

	@Override
	protected Object getSaveView(boolean success, Throwable throwable, WxMessageArticle entity, ModelAndView model) {
		model.addObject("mid", entity.getMessageId());
		return super.getSaveView(success, throwable, entity, model);
	}

	@Override
	protected Object getDeleteView(boolean success, Throwable throwable, Long[] ids, ModelAndView model) {
		model.addObject("mid", RequestContextHolder.getRequest().getParameter("mid"));
		return super.getDeleteView(success, throwable, ids, model);
	}

	@Override
	protected CRUDDao<WxMessageArticle> getDao() {
		return this.wxMessageArticleDao;
	}

	@Autowired
	public void setWxMessageArticleDao(WxMessageArticleDao wxMessageArticleDao) {
		this.wxMessageArticleDao = wxMessageArticleDao;
	}

}
