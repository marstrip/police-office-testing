package com.police.testing.pojo;

import java.util.Date;

import com.police.testing.tools.SystemTools;

public class InformNotice {
    private String informId;

    private String informName;

    private Date createDate;

    private String creatorId;

    private String creatorName;

    private Date updateDate;

    private String enable;

    private String informContent;

    public String getInformId() {
        return informId;
    }

    public void setInformId(String informId) {
        this.informId = informId == null ? null : informId.trim();
    }

    public String getInformName() {
        return informName;
    }

    public void setInformName(String informName) {
        this.informName = informName == null ? null : informName.trim();
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

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable == null ? null : enable.trim();
    }

    public String getInformContent() {
        return informContent;
    }

    public void setInformContent(String informContent) {
        this.informContent = informContent == null ? null : informContent.trim();
    }
}