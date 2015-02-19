package org.xllapp.portal.weixin.utils;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 
 *
 * @Copyright: Copyright (c) 2013 FFCS All Rights Reserved 
 * @Company: 北京福富软件有限公司 
 * @author 陈作朋 Dec 31, 2013
 * @version 1.00.00
 * @history:
 * 
 */
public abstract class ThreadPool {

	private static ExecutorService threadPool = Executors.newCachedThreadPool();
	
	public static void execute(Runnable runnable){
		threadPool.execute(runnable);
	}

}
