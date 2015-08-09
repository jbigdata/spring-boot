package com.wanliang.site.domain;


import com.wanliang.site.common.persistence.DataEntity;

import java.math.BigDecimal;
import java.util.Date;

/**
 * User实体类，将同时用于Mybatis和JPA使用
 *
 * @author 小翼
 * @version 1.0.0
 */
public class User extends DataEntity<User> {
    private static final long serialVersionUID = 1533130686714725835L;

    /**
     * 性别
     */
    public enum Gender {

        /** 男 */
        male,

        /** 女 */
        female
    }

    /** "身份信息"参数名称 */
    public static final String PRINCIPAL_ATTRIBUTE_NAME =".PRINCIPAL";

    /** "用户名"Cookie名称 */
    public static final String USERNAME_COOKIE_NAME = "username";

    /** 会员注册项值属性个数 */
    public static final int ATTRIBUTE_VALUE_PROPERTY_COUNT = 10;

    /** 会员注册项值属性名称前缀 */
    public static final String ATTRIBUTE_VALUE_PROPERTY_NAME_PREFIX = "attributeValue";

    /** 最大收藏商品数 */
    public static final Integer MAX_FAVORITE_COUNT = 10;

    /** 用户名 */
    private String username;

    /** 密码 */
    private String password;

    /** E-mail */
    private String email;

    /** 积分 */
    private Long point;

    /** 消费金额 */
    private BigDecimal amount;

    /** 余额 */
    private BigDecimal balance;

    /** 是否启用 */
    private Boolean isEnabled;

    /** 是否锁定 */
    private Boolean isLocked;

    /** 连续登录失败次数 */
    private Integer loginFailureCount;

    /** 锁定日期 */
    private Date lockedDate;

    /** 注册IP */
    private String registerIp;

    /** 最后登录IP */
    private String loginIp;

    /** 最后登录日期 */
    private Date loginDate;

    /** 姓名 */
    private String name;

    /** 性别 */
    private Gender gender;

    /** 出生日期 */
    private Date birth;

    /** 地址 */
    private String address;

    /** 邮编 */
    private String zipCode;

    /** 电话 */
    private String phone;

    /** 手机 */
    private String mobile;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getPoint() {
        return point;
    }

    public void setPoint(Long point) {
        this.point = point;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public Boolean getIsEnabled() {
        return isEnabled;
    }

    public void setIsEnabled(Boolean isEnabled) {
        this.isEnabled = isEnabled;
    }

    public Boolean getIsLocked() {
        return isLocked;
    }

    public void setIsLocked(Boolean isLocked) {
        this.isLocked = isLocked;
    }

    public Integer getLoginFailureCount() {
        return loginFailureCount;
    }

    public void setLoginFailureCount(Integer loginFailureCount) {
        this.loginFailureCount = loginFailureCount;
    }

    public Date getLockedDate() {
        return lockedDate;
    }

    public void setLockedDate(Date lockedDate) {
        this.lockedDate = lockedDate;
    }

    public String getRegisterIp() {
        return registerIp;
    }

    public void setRegisterIp(String registerIp) {
        this.registerIp = registerIp;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}