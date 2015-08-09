package com.wanliang.site.domain.sys;

import com.wanliang.site.common.persistence.DataEntity;

public class Resource extends DataEntity<Resource> {
    private Long id;
    private String url;
    private String permissions;
    private String roles;
    private String description;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPermissions() {
        return permissions;
    }

    public void setPermissions(String permissions) {
        this.permissions = permissions;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
