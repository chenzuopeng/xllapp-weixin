package org.xllapp.portal.weixin.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 此类提供一些响应操作的工具方法.
 *
 * @Copyright: Copyright (c) 2014 FFCS All Rights Reserved
 * @Company: 北京福富软件有限公司
 * @author 陈作朋 Dec 19, 2014
 * @version 1.00.00
 * @history:
 * 
 */
public abstract class ResponseUtils {

	private final static Logger LOGGER = LoggerFactory.getLogger(ResponseUtils.class);
	
	public static void outJson(HttpServletResponse response,boolean success,String message){
		String content="{\"success\":"+success+",\"message\":\""+message+"\"}";
		out(response, content);
	}
	
	public static void out(HttpServletResponse response, String content){
		out(HttpServletResponse.SC_OK,response, content);
	}
	
	public static void out(int status,HttpServletResponse response, String content){
		LOGGER.debug("response:{}", content);
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		response.setStatus(status);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.write(content);
		} catch (Exception e) {
			LOGGER.error("failure to send response data.caused by:" + e.getLocalizedMessage(), e);
		} finally {
			IOUtils.closeQuietly(out);
		}
	}
	
	public static void outError(HttpServletResponse response, String content){
		out(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, response, content);
	}

}
