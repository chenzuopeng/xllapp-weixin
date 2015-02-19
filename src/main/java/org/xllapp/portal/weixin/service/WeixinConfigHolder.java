package org.xllapp.portal.weixin.service;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

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
@Lazy(false)
@Component
public class WeixinConfigHolder implements ApplicationContextAware{
	
	private final static Logger logger = LoggerFactory.getLogger(WeixinConfigHolder.class);
	
	private static WeixinConfig weixinConfig;
	
	public static WeixinConfig getWeixinConfig(){
		return weixinConfig;
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		weixinConfig = applicationContext.getBean(WeixinConfig.class);
		logger.info("loaded initial weixin config:{}", weixinConfig);
	}
	
	@Component
	public static class WeixinConfig{
		
		private String appId;

		private String appSecret;

		private String aesKey;

		private String token;

		public String getAppId() {
			return appId;
		}

		@Value("${weixin.appId:}")
		public void setAppId(String appId) {
			this.appId = appId;
		}

		public String getAppSecret() {
			return appSecret;
		}

		@Value("${weixin.appSecret:}")
		public void setAppSecret(String appSecret) {
			this.appSecret = appSecret;
		}

		public String getAesKey() {
			return aesKey;
		}

		@Value("${weixin.aesKey:}")
		public void setAesKey(String aesKey) {
			this.aesKey = aesKey;
		}

		public String getToken() {
			return token;
		}

		@Value("${weixin.token:}")
		public void setToken(String token) {
			this.token = token;
		}
		
		@Override
		public String toString() {
			return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
		}
		
	}

	
}
