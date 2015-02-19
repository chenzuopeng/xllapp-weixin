package org.xllapp.portal.weixin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.chanjar.weixin.common.bean.WxMenu.WxMenuButton;
import me.chanjar.weixin.mp.api.WxMpService;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.xllapp.portal.weixin.dao.WxMenuDao;
import org.xllapp.portal.weixin.dao.WxMessageDao;
import org.xllapp.portal.weixin.entity.WxMenu;

import com.ffcs.icity.mvc.controller.SimpleController;
import com.ffcs.icity.mvc.dao.CRUDDao;

@RequestMapping("wxMenu")
@Controller
public class WxMenuController extends SimpleController<WxMenu> {

	private static final Logger LOGGER = LoggerFactory.getLogger(WxMenuController.class);

	private WxMpService wxMpService;

	private WxMenuDao wxMenuDao;
	
	private WxMessageDao  wxMessageDao;

	@RequestMapping("/syncToWeixin")
	public String syncToWeixin(HttpServletRequest request, HttpServletResponse response, Model model) {
		List<WxMenu> invalidMenus = new ArrayList<WxMenu>();
		try {
			me.chanjar.weixin.common.bean.WxMenu wxMenu = new me.chanjar.weixin.common.bean.WxMenu();
			List<WxMenu> ones = this.wxMenuDao.getOneMenus();

			if (CollectionUtils.isNotEmpty(ones)) {
				int onesSize = Math.min(3, ones.size());
				for (int i = 0; i < onesSize; i++) {
					WxMenu one = ones.get(i);

					if (!one.isValid()) {
						invalidMenus.add(one);
						continue;
					}

					WxMenuButton button = new WxMenuButton();
					if (one.isGroup()) {
						button.setName(one.getMenuName());
						List<WxMenu> twos = this.wxMenuDao.getTwoMenus(one.getId());
						if (CollectionUtils.isNotEmpty(twos)) {
							int twosSize = Math.min(5, twos.size());
							for (int j = 0; j < twosSize; j++) {
								WxMenu two = twos.get(j);

								if (!two.isValid()) {
									invalidMenus.add(two);
									continue;
								}

								WxMenuButton subButton = new WxMenuButton();
								subButton.setName(two.getMenuName());
								subButton.setType(two.getMenuType());
								subButton.setKey(two.getMenuKey());
								subButton.setUrl(two.getMenuUrl());
								button.getSubButtons().add(subButton);
							}
						}
					} else {
						button.setName(one.getMenuName());
						button.setType(one.getMenuType());
						button.setKey(one.getMenuKey());
						button.setUrl(one.getMenuUrl());
					}
					wxMenu.getButtons().add(button);
				}
				this.wxMpService.menuCreate(wxMenu);
			}
		} catch (Exception e) {
			LOGGER.error("同步菜单到微信失败", e);
			model.addAttribute("message", "同步菜单到微信失败:" + e.getLocalizedMessage());
		}
		model.addAttribute("message", "同步菜单到微信成功");
		model.addAttribute("invalidMenus", invalidMenus);
		return getSyncToWeixinResultView();
	}
	
	private String getSyncToWeixinResultView(){
		return getEntityName()+"/synctoweixin-result";
	}

	@Override
	protected Object doQuery(HttpServletRequest req, HttpServletResponse resp, ModelAndView model) {
		model.addObject("branchMenus", this.wxMenuDao.getBranchMenus());
		return super.doQuery(req, resp, model);
	}

	@Override
	protected Object showForm(HttpServletRequest req, HttpServletResponse resp, ModelAndView model) {
		model.addObject("branchMenus", this.wxMenuDao.getBranchMenus());
		model.addObject("messageNames", this.wxMessageDao.getMessageNames());
		return super.showForm(req, resp, model);
	}

	@Override
	protected Object getSaveView(boolean success, Throwable throwable, WxMenu entity, ModelAndView model) {

		return super.getSaveView(success, throwable, entity, model);
	}

	@Override
	protected CRUDDao<WxMenu> getDao() {
		return this.wxMenuDao;
	}

	@Autowired
	public void setWxMenuDao(WxMenuDao wxMenuDao) {
		this.wxMenuDao = wxMenuDao;
	}

	@Autowired
	public void setWxMpService(WxMpService wxMpService) {
		this.wxMpService = wxMpService;
	}

	@Autowired
	public void setWxMessageDao(WxMessageDao wxMessageDao) {
		this.wxMessageDao = wxMessageDao;
	}
	
}
