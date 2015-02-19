package org.xllapp.portal.weixin.api;

import java.util.List;
import java.util.Map;

import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.mp.api.WxMpMessageHandler;
import me.chanjar.weixin.mp.api.WxMpMessageRouter;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.WxMpCustomMessage;
import me.chanjar.weixin.mp.bean.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.WxMpXmlOutMessage;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xllapp.portal.weixin.dao.WxChatLogDao;
import org.xllapp.portal.weixin.dao.WxLogDao;
import org.xllapp.portal.weixin.dao.WxMessageHandlerDao;
import org.xllapp.portal.weixin.entity.WxChatLog;
import org.xllapp.portal.weixin.entity.WxKeyword;
import org.xllapp.portal.weixin.entity.WxLog;
import org.xllapp.portal.weixin.entity.WxMessage;
import org.xllapp.portal.weixin.service.WeixinConfigHolder;
import org.xllapp.portal.weixin.service.WxSubscribeAccountService;

/**
 *
 *
 * @Copyright: Copyright (c) 2014 FFCS All Rights Reserved
 * @Company: 北京福富软件有限公司
 * @author 陈作朋 Dec 9, 2014
 * @version 1.00.00
 * @history:
 * 
 */
@Service
public class WxMessageHandler {
	
	private final static Logger LOGGER=LoggerFactory.getLogger(WxMessageHandler.class);

	private WxLogDao wxLogDao;
	
	private WxChatLogDao wxChatLogDao;

	private WxMessageHandlerDao wxMessageHandlerDao;

	private WxSubscribeAccountService wxSubscribeAccountService;

	private WxMessageFactory wxMessageFactory;

	public void loadRules(WxMpMessageRouter wxMpMessageRouter) {

		// 关注
		wxMpMessageRouter.rule().async(true).msgType("event").event("subscribe").handler(new WxMpMessageHandler() {
			@Override
			public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage, Map<String, Object> context, WxMpService wxMpService) {
				return handleSubscribeEvent(wxMessage, context, wxMpService);
			}
		}).end();

		// 取消关注
		wxMpMessageRouter.rule().async(true).msgType("event").event("unsubscribe").handler(new WxMpMessageHandler() {
			@Override
			public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage, Map<String, Object> context, WxMpService wxMpService) {
				return handleUnsubscribeEvent(wxMessage, context, wxMpService);
			}
		}).end();

		// 菜单点击事件
		wxMpMessageRouter.rule().async(true).msgType("event").event("CLICK").handler(new WxMpMessageHandler() {
			@Override
			public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage, Map<String, Object> context, WxMpService wxMpService) {
				return handleMenuEvent(wxMessage, context, wxMpService);
			}
		}).end();

		// 关键词和其它事件或消息
		wxMpMessageRouter.rule().async(true).handler(new WxMpMessageHandler() {
			@Override
			public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage, Map<String, Object> context, WxMpService wxMpService) {
				return handleKeyword(wxMessage, context, wxMpService);
			}
		}).end();
	}

	public WxMpXmlOutMessage handleSubscribeEvent(final WxMpXmlMessage inMessage, Map<String, Object> context, WxMpService wxMpService) {

		sendCustomMessage(inMessage, context, wxMpService, new MessageEntityCallback() {
			@Override
			public WxMessage getMessageEntity() throws Exception {
				return WxMessageHandler.this.wxMessageHandlerDao.getMessageOfSubscribeEvent();
			}
		});

		WxMessageHandler.this.wxSubscribeAccountService.handleSubscribe(inMessage.getFromUserName());

		return null;

	}

	public WxMpXmlOutMessage handleUnsubscribeEvent(final WxMpXmlMessage inMessage, Map<String, Object> context, WxMpService wxMpService) {
		
		sendCustomMessage(inMessage, context, wxMpService, null); //这一行用于记录日志

		WxMessageHandler.this.wxSubscribeAccountService.handleUnsubscribe(inMessage.getFromUserName(), inMessage.getCreateTime());

		return null;
	}

	public WxMpXmlOutMessage handleMenuEvent(final WxMpXmlMessage inMessage, Map<String, Object> context, WxMpService wxMpService) {

		sendCustomMessage(inMessage, context, wxMpService, new MessageEntityCallback() {
			@Override
			public WxMessage getMessageEntity() throws Exception {
				return WxMessageHandler.this.wxMessageHandlerDao.getMessageOfMenuEvent(inMessage.getEventKey());
			}
		});

		return null;

	}

	public WxMpXmlOutMessage handleKeyword(final WxMpXmlMessage inMessage, Map<String, Object> context, WxMpService wxMpService) {

		sendCustomMessage(inMessage, context, wxMpService, new MessageEntityCallback() {
			@Override
			public WxMessage getMessageEntity() throws Exception {

				List<WxKeyword> keywords = WxMessageHandler.this.wxMessageHandlerDao.getKeywords();
				if (CollectionUtils.isNotEmpty(keywords)) {
					for (WxKeyword keyword : keywords) {
						if (keyword.getKeyword().equals(inMessage.getContent())) {
							return WxMessageHandler.this.wxMessageHandlerDao.getMessageById(keyword.getMessageId());
						}
					}
				}

				return WxMessageHandler.this.wxMessageHandlerDao.getMessageOfDefault();
			}
		});

		return null;

	}

	void sendCustomMessage(WxMpXmlMessage inMessage, Map<String, Object> context, WxMpService wxMpService, MessageEntityCallback messageEntityCallback) {
		try {
			
			WxMessage messageEntity = null;
			
			if(null != messageEntityCallback){
				messageEntity = messageEntityCallback.getMessageEntity();
			}
			
			WxMpCustomMessage outMessage = null;
			
			if (null != messageEntity) {
				outMessage = this.wxMessageFactory.getCustomMessage(inMessage.getFromUserName(), messageEntity ,wxMpService);
				wxMpService.customMessageSend(outMessage);
			}
			
			logMessage(inMessage, outMessage, null);
			
		} catch (Exception e) {
			logMessage(inMessage, null, e);
			LOGGER.error("消息发送失败",e);
		}
	}
	
	interface MessageEntityCallback {
		public WxMessage getMessageEntity() throws Exception;
	}

	void logMessage(WxMpXmlMessage inMessage, WxMpCustomMessage outMessage, Exception exception) {
		WxLog wxLog = new WxLog();
		wxLog.setMsgId(Long.toString(inMessage.getMsgId()));
		wxLog.setFromUserName(inMessage.getFromUserName());
		wxLog.setToUserName(inMessage.getToUserName());
		wxLog.setMsgType(inMessage.getMsgType());

		if (inMessage instanceof WxMpXmlMessageWrapper) {
			wxLog.setInMessage(((WxMpXmlMessageWrapper) inMessage).getRawRequestBody());
		}

		if (null == exception) {
			if (null != outMessage) {
				wxLog.setOutMessage(outMessage.toJson());
			}
			wxLog.setResult(WxLog.RESULT_SUCCESS);
		} else {
			wxLog.setError(ExceptionUtils.getStackTrace(exception));
			wxLog.setResult(WxLog.RESULT_FAILURE);
		}
		this.wxLogDao.insert(wxLog);
		
		logChatMessage(inMessage);
	}
	
	void logChatMessage(WxMpXmlMessage inMessage){
		
		if(!WxConsts.XML_MSG_TEXT.equals(inMessage.getMsgType())){
			return;
		}
		
		WxChatLog wxChatLog = new WxChatLog();
		
		wxChatLog.setAppId(WeixinConfigHolder.getWeixinConfig().getAppId());
		wxChatLog.setSender(WxChatLog.SENDER_USER);
		wxChatLog.setOpenId(inMessage.getFromUserName());
		wxChatLog.setMessageType(inMessage.getMsgType());
		if(WxConsts.XML_MSG_TEXT.equals(inMessage.getMsgType())){
			wxChatLog.setContent(inMessage.getContent());
		}else{
			wxChatLog.setContent(((WxMpXmlMessageWrapper) inMessage).getRawRequestBody());
		}
		
		this.wxChatLogDao.insert(wxChatLog);
	}

	@Autowired
	public void setWxMessageHandlerDao(WxMessageHandlerDao wxMessageHandlerDao) {
		this.wxMessageHandlerDao = wxMessageHandlerDao;
	}

	@Autowired
	public void setWxSubscribeAccountService(WxSubscribeAccountService wxSubscribeAccountService) {
		this.wxSubscribeAccountService = wxSubscribeAccountService;
	}

	@Autowired
	public void setWxMessageFactory(WxMessageFactory wxMessageFactory) {
		this.wxMessageFactory = wxMessageFactory;
	}

	@Autowired
	public void setWxLogDao(WxLogDao wxLogDao) {
		this.wxLogDao = wxLogDao;
	}
	
	@Autowired
	public void setWxChatLogDao(WxChatLogDao wxChatLogDao) {
		this.wxChatLogDao = wxChatLogDao;
	}

}
