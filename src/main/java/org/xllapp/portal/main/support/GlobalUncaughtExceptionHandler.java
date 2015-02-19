package org.xllapp.portal.main.support;

import java.lang.Thread.UncaughtExceptionHandler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

/**
 * 统一处理未捕获的异常.
 *
 * @Copyright: Copyright (c) 2014 FFCS All Rights Reserved 
 * @Company: 北京福富软件有限公司 
 * @author 陈作朋 Dec 17, 2014
 * @version 1.00.00
 * @history:
 * 
 */
@Lazy(false)
@Component
public class GlobalUncaughtExceptionHandler implements UncaughtExceptionHandler,InitializingBean{
	
	private final static Logger LOGGER=LoggerFactory.getLogger(GlobalUncaughtExceptionHandler.class);
	
	private UncaughtExceptionHandler  defaultUncaughtExceptionHandler;

	@Override
	public void uncaughtException(Thread t, Throwable e) {
		
		LOGGER.error(e.getLocalizedMessage(),e);
		
		if(null!=this.defaultUncaughtExceptionHandler){
			this.defaultUncaughtExceptionHandler.uncaughtException(t, e);
		}
		
	}

	@Override
	public void afterPropertiesSet() throws Exception {
        this.defaultUncaughtExceptionHandler=Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler(this);
	}

}
