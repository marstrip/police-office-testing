package com.police.testing.pojo;

public class SysRole extends SysRoleKey {
    private String roleStatus;

    private String roleDescp;

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
        this.roleDescp = roleDescp == null ? null : roleDescp.trim();
    }
}