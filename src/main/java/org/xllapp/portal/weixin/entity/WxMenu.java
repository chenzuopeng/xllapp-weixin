package org.xllapp.portal.weixin.entity;

import com.ffcs.icity.mvc.entity.IdEntity;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;

public class WxMenu extends IdEntity {

	private static final long serialVersionUID = -3085158399660645824L;

	public final static int MENU_LEVEL_ONE = 1;

	public final static int MENU_LEVEL_TWO = 2;

	public final static String MENU_TYPE_CLICK = "click";

	public final static String MENU_TYPE_VIEW = "view";

	private Integer pid;

	private Integer menuLevel;

	private Integer isBranch;

	private String menuType;

	private String menuName;

	private String menuKey;
	
	private Integer messageId;

	private String menuUrl;

	private Integer orderNo;

	private Date createTime;

	public boolean isGroup() {
		return this.isBranch == 0;
	}

	public boolean isValid() {

		if (StringUtils.isBlank(this.menuName)) {
			return false;
		}

		if (!this.isGroup()) {
			
			if (StringUtils.isBlank(this.menuType)) {
				return false;
			}

			if (WxMenu.MENU_TYPE_CLICK.equals(this.menuType) && StringUtils.isBlank(this.menuKey)) {
				return false;
			}
			
            if (WxMenu.MENU_TYPE_VIEW.equals(this.menuType) && StringUtils.isBlank(this.menuUrl)) {
				return false;
			}
			
		}

		return true;

	}

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getMenuLevel() {
		return this.menuLevel;
	}

	public void setMenuLevel(Integer menuLevel) {
		this.menuLevel = menuLevel;
	}

	public Integer getIsBranch() {
		return this.isBranch;
	}

	public void setIsBranch(Integer isBranch) {
		this.isBranch = isBranch;
	}

	public String getMenuType() {
		return this.menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public String getMenuName() {
		return this.menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuKey() {
		return this.menuKey;
	}
	
    public Integer getMessageId() {
        return this.messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

	public void setMenuKey(String menuKey) {
		this.menuKey = menuKey;
	}

	public String getMenuUrl() {
		return this.menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public Integer getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}