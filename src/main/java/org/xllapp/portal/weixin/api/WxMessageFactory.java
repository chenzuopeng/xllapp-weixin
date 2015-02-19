package org.xllapp.portal.weixin.api;

import java.io.File;
import java.util.List;

import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.bean.result.WxMediaUploadResult;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.WxMpCustomMessage;
import me.chanjar.weixin.mp.bean.WxMpCustomMessage.WxArticle;
import me.chanjar.weixin.mp.bean.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.WxMpXmlOutNewsMessage;
import me.chanjar.weixin.mp.bean.outxmlbuilder.NewsBuilder;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.xllapp.portal.weixin.dao.WxMessageHandlerDao;
import org.xllapp.portal.weixin.entity.WxMessage;
import org.xllapp.portal.weixin.entity.WxMessageArticle;

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
public class WxMessageFactory {

	private final static Logger LOGGER = LoggerFactory.getLogger(WxMessageFactory.class);

	private String baseMediaUrl;

	private String baseMediaDir;

	private WxMessageHandlerDao wxMessageHandlerDao;

	public WxMpCustomMessage getCustomMessage(String toUser, WxMessage messageEntity, WxMpService wxMpService) {

		// TODO 实现媒体文件的复用

		WxMpCustomMessage result = null;

		try {

			if (WxMessage.MESSAGE_TYPE_TEXT.equals(messageEntity.getMessageType())) {

				result = WxMpCustomMessage.TEXT().toUser(toUser).content(messageEntity.getMessageContent()).build();

			} else if (WxMessage.MESSAGE_TYPE_NEWS.equals(messageEntity.getMessageType())) {

				me.chanjar.weixin.mp.bean.custombuilder.NewsBuilder newsBuilder = WxMpCustomMessage.NEWS();
				newsBuilder.toUser(toUser);

				List<WxMessageArticle> wxMessageArticles = this.wxMessageHandlerDao.getMessageArticles(messageEntity.getId());
				for (WxMessageArticle wxMessageArticle : wxMessageArticles) {
					WxArticle item = new WxArticle();
					item.setTitle(wxMessageArticle.getArticleTitle());
					item.setDescription(wxMessageArticle.getArticleDescription());
					item.setPicUrl(getMediaUrl(wxMessageArticle.getArticlePic()));
					item.setUrl(wxMessageArticle.getArticleUrl());
					newsBuilder.addArticle(item);
				}

				result = newsBuilder.build();
			} else if (WxMessage.MESSAGE_TYPE_IMAGE.equals(messageEntity.getMessageType())) {

				WxMediaUploadResult wxMediaUploadResult = wxMpService.mediaUpload(WxConsts.MEDIA_IMAGE, getMediaFile(messageEntity.getMessageMedia()));
				result = WxMpCustomMessage.IMAGE().toUser(toUser).mediaId(wxMediaUploadResult.getMediaId()).build();

			} else if (WxMessage.MESSAGE_TYPE_VOICE.equals(messageEntity.getMessageType())) {

				WxMediaUploadResult wxMediaUploadResult = wxMpService.mediaUpload(WxConsts.MEDIA_VOICE, getMediaFile(messageEntity.getMessageMedia()));
				result = WxMpCustomMessage.VOICE().toUser(toUser).mediaId(wxMediaUploadResult.getMediaId()).build();

			} else if (WxMessage.MESSAGE_TYPE_VIDEO.equals(messageEntity.getMessageType())) {

				WxMediaUploadResult wxMediaUploadResult = wxMpService.mediaUpload(WxConsts.MEDIA_VIDEO, getMediaFile(messageEntity.getMessageMedia()));
				result = WxMpCustomMessage.VIDEO().toUser(toUser).title(messageEntity.getMessageTitle()).description(messageEntity.getMessageDescription()).mediaId(wxMediaUploadResult.getMediaId()).build();

			} else if (WxMessage.MESSAGE_TYPE_MUSIC.equals(messageEntity.getMessageType())) {

				String messageThumb = messageEntity.getMessageThumb();
				String thumbMediaId = "";
				if (StringUtils.isNotBlank(messageThumb)) {
					WxMediaUploadResult wxMediaUploadResult = wxMpService.mediaUpload(WxConsts.MEDIA_THUMB, getMediaFile(messageEntity.getMessageThumb()));
					thumbMediaId = wxMediaUploadResult.getThumbMediaId();
				}
				result = WxMpCustomMessage.MUSIC().toUser(toUser).title(messageEntity.getMessageTitle()).description(messageEntity.getMessageDescription()).musicUrl(getMediaUrl(messageEntity.getMessageMedia())).hqMusicUrl(getMediaUrl(messageEntity.getMessageHqMedia())).thumbMediaId(thumbMediaId).build();

			}

		} catch (Exception e) {
			LOGGER.error(e.getLocalizedMessage(), e);
		}

		return result;
	}

	public WxMpXmlOutMessage getMessage(String fromUser, String toUser, WxMessage messageEntity, WxMpService wxMpService) {
		WxMpXmlOutMessage result = null;

		try {
			if (WxMessage.MESSAGE_TYPE_TEXT.equals(messageEntity.getMessageType())) {

				result = WxMpXmlOutMessage.TEXT().fromUser(fromUser).toUser(toUser).content(messageEntity.getMessageContent()).build();

			} else if (WxMessage.MESSAGE_TYPE_NEWS.equals(messageEntity.getMessageType())) {

				NewsBuilder newsBuilder = WxMpXmlOutMessage.NEWS();
				newsBuilder.fromUser(fromUser).toUser(toUser);

				List<WxMessageArticle> wxMessageArticles = this.wxMessageHandlerDao.getMessageArticles(messageEntity.getId());
				for (WxMessageArticle wxMessageArticle : wxMessageArticles) {
					WxMpXmlOutNewsMessage.Item item = new WxMpXmlOutNewsMessage.Item();
					item.setTitle(wxMessageArticle.getArticleTitle());
					item.setDescription(wxMessageArticle.getArticleDescription());
					item.setPicUrl(getMediaUrl(wxMessageArticle.getArticlePic()));
					item.setUrl(wxMessageArticle.getArticleUrl());
					newsBuilder.addArticle(item);
				}

				result = newsBuilder.build();
			} else if (WxMessage.MESSAGE_TYPE_IMAGE.equals(messageEntity.getMessageType())) {

				WxMediaUploadResult wxMediaUploadResult = wxMpService.mediaUpload(WxConsts.MEDIA_IMAGE, getMediaFile(messageEntity.getMessageMedia()));
				result = WxMpXmlOutMessage.IMAGE().fromUser(fromUser).toUser(toUser).mediaId(wxMediaUploadResult.getMediaId()).build();

			} else if (WxMessage.MESSAGE_TYPE_VOICE.equals(messageEntity.getMessageType())) {

				WxMediaUploadResult wxMediaUploadResult = wxMpService.mediaUpload(WxConsts.MEDIA_VOICE, getMediaFile(messageEntity.getMessageMedia()));
				result = WxMpXmlOutMessage.VOICE().fromUser(fromUser).toUser(toUser).mediaId(wxMediaUploadResult.getMediaId()).build();

			} else if (WxMessage.MESSAGE_TYPE_VIDEO.equals(messageEntity.getMessageType())) {

				WxMediaUploadResult wxMediaUploadResult = wxMpService.mediaUpload(WxConsts.MEDIA_VIDEO, getMediaFile(messageEntity.getMessageMedia()));
				result = WxMpXmlOutMessage.VIDEO().fromUser(fromUser).toUser(toUser).title(messageEntity.getMessageTitle()).description(messageEntity.getMessageDescription()).mediaId(wxMediaUploadResult.getMediaId()).build();

			} else if (WxMessage.MESSAGE_TYPE_MUSIC.equals(messageEntity.getMessageType())) {

				String messageThumb = messageEntity.getMessageThumb();
				String thumbMediaId = "";
				if (StringUtils.isNotBlank(messageThumb)) {
					WxMediaUploadResult wxMediaUploadResult = wxMpService.mediaUpload(WxConsts.MEDIA_THUMB, getMediaFile(messageEntity.getMessageThumb()));
					thumbMediaId = wxMediaUploadResult.getThumbMediaId();
				}
				result = WxMpXmlOutMessage.MUSIC().fromUser(fromUser).toUser(toUser).title(messageEntity.getMessageTitle()).description(messageEntity.getMessageDescription()).musicUrl(getMediaUrl(messageEntity.getMessageMedia())).hqMusicUrl(getMediaUrl(messageEntity.getMessageHqMedia())).thumbMediaId(thumbMediaId).build();

			}
		} catch (Exception e) {
			LOGGER.error(e.getLocalizedMessage(), e);
		}

		return result;
	}

	private File getMediaFile(String mediaUri) {
		return new File(this.baseMediaDir, mediaUri);
	}

	private String getMediaUrl(String mediaUri) {
		return this.baseMediaUrl + "/" + mediaUri;
	}

	@Value("${baseMediaUrl:}")
	public void setBaseMediaUrl(String baseMediaUrl) {
		this.baseMediaUrl = baseMediaUrl;
	}

	@Value("${baseMediaDir:}")
	public void setBaseMediaDir(String baseMediaDir) {
		this.baseMediaDir = baseMediaDir;
	}

	@Autowired
	public void setWxMessageHandlerDao(WxMessageHandlerDao wxMessageHandlerDao) {
		this.wxMessageHandlerDao = wxMessageHandlerDao;
	}

}
