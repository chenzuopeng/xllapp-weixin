package org.xllapp.portal.weixin.api;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.chanjar.weixin.mp.api.WxMpMessageRouter;
import me.chanjar.weixin.mp.bean.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.WxMpXmlOutMessage;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.xllapp.portal.weixin.service.WxService;
import org.xllapp.portal.weixin.utils.ResponseUtils;

/**
 *
 *
 * @Copyright: Copyright (c) 2014 FFCS All Rights Reserved
 * @Company: 北京福富软件有限公司
 * @author 陈作朋 Dec 5, 2014
 * @version 1.00.00
 * @history:
 * 
 */
@Controller
public class WeixinController implements InitializingBean {

	private final static Logger LOGGER = LoggerFactory.getLogger(WeixinController.class);

	private WxMpMessageRouter wxMpMessageRouter;

	private WxService wxService;

	private WxMessageHandler wxMessageHandler;

	@RequestMapping("/weixin")
	public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String responseContent = handleMessage(request, response);
			ResponseUtils.out(response, responseContent);
		} catch (Exception e) {
			LOGGER.error("消息处理失败", e);
			ResponseUtils.out(response, "消息处理失败");
		}

	}

	public String handleMessage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String signature = request.getParameter("signature");
		String nonce = request.getParameter("nonce");
		String timestamp = request.getParameter("timestamp");
		if (!this.wxService.checkSignature(timestamp, nonce, signature)) {
			return "非法消息";
		}

		String echostr = request.getParameter("echostr");
		if (StringUtils.isNotBlank(echostr) && "GET".equalsIgnoreCase(request.getMethod())) {// 验证的请求
			return echostr;
		}

		String encryptType = StringUtils.isBlank(request.getParameter("encrypt_type")) ? "raw" : request.getParameter("encrypt_type");

		byte[] reqData = IOUtils.toByteArray(request.getReader(), getReuqestCharacterEncoding(request));

		String rawRequestBody = new String(reqData, getReuqestCharacterEncoding(request));

		InputStream in = new ByteArrayInputStream(reqData);

		if ("raw".equals(encryptType)) {// 明文传输的消息
			WxMpXmlMessage inMessage = WxMpXmlMessage.fromXml(in);

			WxMpXmlMessageWrapper wrapper = new WxMpXmlMessageWrapper(inMessage, rawRequestBody);

			WxMpXmlOutMessage outMessage = this.wxMpMessageRouter.route(wrapper);
			return null == outMessage ? "" : outMessage.toXml();
		}

		if ("aes".equals(encryptType)) {// 是aes加密的消息
			String msgSignature = request.getParameter("msg_signature");
			WxMpXmlMessage inMessage = WxMpXmlMessage.fromEncryptedXml(in, this.wxService.getWxMpConfigStorage(), timestamp, nonce, msgSignature);

			WxMpXmlMessageWrapper wrapper = new WxMpXmlMessageWrapper(inMessage, rawRequestBody);

			WxMpXmlOutMessage outMessage = this.wxMpMessageRouter.route(wrapper);
			return null == outMessage ? "" : outMessage.toEncryptedXml(this.wxService.getWxMpConfigStorage());
		}

		return "不可识别的加密类型";
	}

	public String getReuqestCharacterEncoding(HttpServletRequest request) {
		return request.getCharacterEncoding() != null ? request.getCharacterEncoding() : "UTF-8";
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		this.wxMpMessageRouter = new WxMpMessageRouter(this.wxService);
		this.wxMessageHandler.loadRules(this.wxMpMessageRouter);
	}

	@Autowired
	public void setWxMessageHandler(WxMessageHandler wxMessageHandler) {
		this.wxMessageHandler = wxMessageHandler;
	}

	@Autowired
	public void setWxService(WxService wxService) {
		this.wxService = wxService;
	}

}
