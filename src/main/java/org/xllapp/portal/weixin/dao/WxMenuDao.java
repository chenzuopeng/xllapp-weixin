package org.xllapp.portal.weixin.dao;

import java.util.List;

import com.ffcs.icity.mvc.dao.CRUDDao;
import com.ffcs.icity.mybatis.MyBatisRepository;

import org.xllapp.portal.weixin.entity.WxMenu;

@MyBatisRepository
public interface WxMenuDao extends CRUDDao<WxMenu> {
	
	public List<WxMenu> getBranchMenus();
	
	public List<WxMenu> getOneMenus();
	
	public List<WxMenu> getTwoMenus(long pid);
	
	public int countByMenuLevel(int menuLevel);
	
}