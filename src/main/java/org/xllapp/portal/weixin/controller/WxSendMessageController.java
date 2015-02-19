package org.xllapp.portal.weixin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.chanjar.weixin.mp.bean.WxMpCustomMessage;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.xllapp.portal.weixin.api.WxMessageFactory;
import org.xllapp.portal.weixin.dao.WxChatLogDao;
import org.xllapp.portal.weixin.dao.WxMessageDao;
import org.xllapp.portal.weixin.entity.WxChatLog;
import org.xllapp.portal.weixin.entity.WxMessage;
import org.xllapp.portal.weixin.service.WeixinConfigHolder;
import org.xllapp.portal.weixin.service.WxService;
import org.xllapp.portal.weixin.utils.ResponseUtils;

/**
 *
 *
 * @Copyright: Copyright (c) 2014 FFCS All Rights Reserved
 * @Company: 北京福富软件有限公司
 * @author 陈作朋 Dec 19, 2014
 * @version 1.00.00
 * @history:
 * 
 */
@RequestMapping("/wxchat")
@Controller
public class WxSendMessageController {

	private final static Logger LOGGER = LoggerFactory.getLogger(WxSendMessageController.class);

	private WxMessageFactory wxMessageFactory;

	private WxService wxService;

	private WxMessageDao wxMessageDao;

	private WxChatLogDao wxChatLogDao;

	@RequestMapping(method = RequestMethod.GET)
	public String showPage(HttpServletRequest request, Model model) throws Exception {
		model.addAttribute("messageNames", this.wxMessageDao.getMessageNames());
		return "wxchat/send-message";
	}

	@RequestMapping(method = RequestMethod.POST)
	public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		try {

			String messageId = request.getParameter("messageId");

			String openId = request.getParameter("openId");

			String content = request.getParameter("content");

			boolean isPresetMessage = StringUtils.isNotBlank(messageId);

			WxMpCustomMessage wxMpCustomMessage = null;

			WxMessage messageEntity = null;

			if (isPresetMessage) {

				messageEntity = this.wxMessageDao.get(Long.valueOf(messageId));
				wxMpCustomMessage = this.wxMessageFactory.getCustomMessage(openId, messageEntity, this.wxService);

			} else {

				messageEntity = new WxMessage();
				messageEntity.setMessageType(WxMessage.MESSAGE_TYPE_TEXT);
				messageEntity.setMessageContent(content);

				wxMpCustomMessage = this.wxMessageFactory.getCustomMessage(openId, messageEntity, this.wxService);

			}

			this.wxService.customMessageSend(wxMpCustomMessage);

			ResponseUtils.out(response, "发送成功");

			WxChatLog wxChatLog = new WxChatLog();
			wxChatLog.setAppId(WeixinConfigHolder.getWeixinConfig().getAppId());
			wxChatLog.setSender(WxChatLog.SENDER_PLATFORM);
			wxChatLog.setOpenId(openId);
			wxChatLog.setMessageType(messageEntity.getMessageType());
			if (isPresetMessage) {
				wxChatLog.setMessageId(messageId);
				if (WxMessage.MESSAGE_TYPE_TEXT.equals(messageEntity.getMessageType())) {
					wxChatLog.setContent(messageEntity.getMessageContent());
				}
			} else {
				wxChatLog.setContent(content);
			}
			this.wxChatLogDao.insert(wxChatLog);

		} catch (Exception e) {

			LOGGER.error(e.getLocalizedMessage(), e);

			ResponseUtils.out(response, e.getLocalizedMessage());

		}

	}

	@Autowired
	public void setWxService(WxService wxService) {
		this.wxService = wxService;
	}

	@Autowired
	public void setWxMessageFactory(WxMessageFactory wxMessageFactory) {
		this.wxMessageFactory = wxMessageFactory;
	}

	@Autowired
	public void setWxMessageDao(WxMessageDao wxMessageDao) {
		this.wxMessageDao = wxMessageDao;
	}

	@Autowired
	public void setWxChatLogDao(WxChatLogDao wxChatLogDao) {
		this.wxChatLogDao = wxChatLogDao;
	}

}
