package com.police.testing.pojo;

import java.util.List;

public class SysMenu {
    private Integer id;

    private String name;

    private Integer parentid;

    private Integer sequence;

    private String iconcls;

    private String url;

    private Integer enable;
    /**
	 * 子节点个数
	 */
	private Integer countChildrens;
	
	private SysMenu parentMenu;
	private List<SysMenu> subMenu;
	private boolean hasMenu = false;
	
    public Integer getCountChildrens() {
		return countChildrens;
	}

	public void setCountChildrens(Integer countChildrens) {
		this.countChildrens = countChildrens;
	}

	public SysMenu getParentMenu() {
		return parentMenu;
	}

	public void setParentMenu(SysMenu parentMenu) {
		this.parentMenu = parentMenu;
	}

	public List<SysMenu> getSubMenu() {
		return subMenu;
	}

	public void setSubMenu(List<SysMenu> subMenu) {
		this.subMenu = subMenu;
	}

	public boolean isHasMenu() {
		return hasMenu;
	}

	public void setHasMenu(boolean hasMenu) {
		this.hasMenu = hasMenu;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public String getIconcls() {
        return iconcls;
    }

    public void setIconcls(String iconcls) {
        this.iconcls = iconcls == null ? null : iconcls.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Integer getEnable() {
        return enable;
    }

    public void setEnable(Integer enable) {
        this.enable = enable;
    }
}