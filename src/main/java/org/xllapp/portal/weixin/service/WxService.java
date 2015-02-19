package org.xllapp.portal.weixin.service;

import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpInMemoryConfigStorage;
import me.chanjar.weixin.mp.api.WxMpServiceImpl;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.xllapp.portal.weixin.service.WeixinConfigHolder.WeixinConfig;

/**
 *
 *
 * @Copyright: Copyright (c) 2014 FFCS All Rights Reserved
 * @Company: 北京福富软件有限公司
 * @author 陈作朋 Dec 8, 2014
 * @version 1.00.00
 * @history:
 * 
 */
@Service
public class WxService extends WxMpServiceImpl implements InitializingBean {
	
	private boolean httpProxySet=false;
	
	private String httpProxyHost;
	
	private int httpProxyPort;
	
	private String httpProxyUserName;
	
	private String httpProxyPassword;
	
	private WxMpConfigStorage wxMpConfigStorage;

	@Override
	public void afterPropertiesSet() throws Exception {
		
		WeixinConfig weixinConfig=WeixinConfigHolder.getWeixinConfig();

		WxMpInMemoryConfigStorage config = new WxMpInMemoryConfigStorage();
		
		config.setAppId(weixinConfig.getAppId());
		config.setSecret(weixinConfig.getAppSecret());
		config.setAesKey(weixinConfig.getAesKey());
		config.setToken(weixinConfig.getToken());
		
		if(this.httpProxySet){
			config.setHttp_proxy_host(this.httpProxyHost);
			config.setHttp_proxy_port(this.httpProxyPort);
			config.setHttp_proxy_username(this.httpProxyUserName);
			config.setHttp_proxy_password(this.httpProxyPassword);
		}
		

		this.setWxMpConfigStorage(config);
		this.wxMpConfigStorage = config;

	}
	
	public WxMpConfigStorage getWxMpConfigStorage() {
		return this.wxMpConfigStorage;
	}

	@Value("${http.proxySet:false}")
	public void setHttpProxySet(boolean httpProxySet) {
		this.httpProxySet = httpProxySet;
	}

	@Value("${http.proxyHost:}")
	public void setHttpProxyHost(String httpProxyHost) {
		this.httpProxyHost = httpProxyHost;
	}

	@Value("${http.proxyPort:0}")
	public void setHttpProxyPort(int httpProxyPort) {
		this.httpProxyPort = httpProxyPort;
	}

	@Value("${http.proxyUserName:}")
	public void setHttpProxyUserName(String httpProxyUserName) {
		this.httpProxyUserName = httpProxyUserName;
	}

	@Value("${http.proxyPassword:}")
	public void setHttpProxyPassword(String httpProxyPassword) {
		this.httpProxyPassword = httpProxyPassword;
	}


}
