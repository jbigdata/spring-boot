package com.wanliang.site.domain;


/**
 * User实体类，将同时用于Mybatis和JPA使用
 *
 * @author 小翼
 * @version 1.0.0
 */
public class User {

    private String username;

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }


    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }
}