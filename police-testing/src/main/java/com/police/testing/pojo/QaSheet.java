package com.police.testing.pojo;

import java.util.Date;

import com.police.testing.tools.SystemTools;

public class QaSheet {
    private String qaId;

    private String enable;

    private Date createDate;

    private String creatorId;

    private String creatorName;

    private Date updateDate;

    private String qaStatus;

    public String getQaId() {
        return qaId;
    }

    public void setQaId(String qaId) {
        this.qaId = qaId == null ? null : qaId.trim();
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable == null ? null : enable.trim();
    }

    public String getCreateDate() {
    	String str = SystemTools.Time2String(createDate, "yyyy-MM-dd HH:mm:ss");
        return str;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(String creatorId) {
        this.creatorId = creatorId == null ? null : creatorId.trim();
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName == null ? null : creatorName.trim();
    }

    public String getUpdateDate() {
    	String str = SystemTools.Time2String(updateDate, "yyyy-MM-dd HH:mm:ss");
        return str;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getQaStatus() {
        return qaStatus;
    }

    public void setQaStatus(String qaStatus) {
        this.qaStatus = qaStatus == null ? null : qaStatus.trim();
    }
}