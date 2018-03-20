package com.police.testing.pojo;

public class Role {
    private Integer roleId;

    private String roleName;

    private String roleStatus;
    
    private String roleDescp;
    
    public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getRoleStatus() {
        return roleStatus;
    }

    public void setRoleStatus(String roleStatus) {
        this.roleStatus = roleStatus == null ? null : roleStatus.trim();
    }

	public String getRoleDescp() {
		return roleDescp;
	}

	public void setRoleDescp(String roleDescp) {
		this.roleDescp = roleDescp;
	}
    
}