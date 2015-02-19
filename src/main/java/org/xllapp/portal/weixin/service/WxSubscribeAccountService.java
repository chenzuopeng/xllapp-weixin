package org.xllapp.portal.weixin.service;

import java.util.Date;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xllapp.portal.weixin.dao.WxSubscribeAccountDao;
import org.xllapp.portal.weixin.entity.WxSubscribeAccount;

/**
 *
 *
 * @Copyright: Copyright (c) 2014 FFCS All Rights Reserved 
 * @Company: 北京福富软件有限公司 
 * @author 陈作朋 Dec 17, 2014
 * @version 1.00.00
 * @history:
 * 
 */
@Service
public class WxSubscribeAccountService {
	
	private WxService wxService;

	private WxSubscribeAccountDao wxSubscribeAccountDao;
	
	public void handleSubscribe(String openId){
		try {
			WxSubscribeAccount account=this.wxSubscribeAccountDao.findByOpenId(openId);
			
			if(null == account){
				account=new WxSubscribeAccount();
				account.setOpenId(openId);
				updateAccountInfo(account);
				this.wxSubscribeAccountDao.insert(account);
			}else{
				updateAccountInfo(account);
				this.wxSubscribeAccountDao.update(account);
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getLocalizedMessage(),e);
		}
	}
	
	public void updateAccountInfo(WxSubscribeAccount account) throws WxErrorException{
		WxMpUser wxMpUser = this.wxService.userInfo(account.getOpenId(), null);
		account.setNickname(wxMpUser.getNickname());
		account.setCity(wxMpUser.getCity());
		account.setProvince(wxMpUser.getProvince());
		account.setCountry(wxMpUser.getCountry());
		account.setLanguage(wxMpUser.getLanguage());
		account.setHeadImgUrl(wxMpUser.getHeadImgUrl());
		account.setSex(wxMpUser.getSex());
		account.setUnionId(wxMpUser.getUnionId());
		account.setSubscribeTime(new Date(wxMpUser.getSubscribeTime()));
		account.setSubscribe(WxSubscribeAccount.STATUS_SUBSCRIBE);
	}
	
	public void handleUnsubscribe(String openId,long unsubscribeTime){
		WxSubscribeAccount account=this.wxSubscribeAccountDao.findByOpenId(openId);
		if(null != account){
			account.setSubscribe(WxSubscribeAccount.STATUS_UNSUBSCRIBE);
			account.setUnsubscribeTime(new Date(unsubscribeTime));
			this.wxSubscribeAccountDao.update(account);
		}
	}
	
	@Autowired
	public void setWxSubscribeAccountDao(WxSubscribeAccountDao wxSubscribeAccountDao) {
		this.wxSubscribeAccountDao = wxSubscribeAccountDao;
	}
	
	@Autowired
	public void setWxService(WxService wxService) {
		this.wxService = wxService;
	}
	
}
