/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.wanliang.site.domain;

import com.wanliang.site.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;


/**
 * 公众号Entity
 * @author wanliang
 * @version 2015-07-27
 */
public class WxPub extends DataEntity<WxPub> {

	private static final long serialVersionUID = 1L;
	private String email;		// email
	private String password;		// password
	private String appid;		// appid
	private String secret;		// secret
	private String grantType;		// grant_type
	private String name;		// name
	private String phone;		// phone
	private boolean isCheck;
	public WxPub() {
		super();
	}
//
//	public WxPub(String id){
//		super(id);
//	}

	@Length(min=1, max=50, message="email长度必须介于 1 和 50 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Length(min=1, max=50, message="password长度必须介于 1 和 50 之间")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Length(min=1, max=100, message="appid长度必须介于 1 和 100 之间")
	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}
	
	@Length(min=1, max=100, message="secret长度必须介于 1 和 100 之间")
	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}
	
	@Length(min=0, max=20, message="grant_type长度必须介于 0 和 20 之间")
	public String getGrantType() {
		return grantType;
	}

	public void setGrantType(String grantType) {
		this.grantType = grantType;
	}
	
	@Length(min=0, max=100, message="name长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=20, message="phone长度必须介于 0 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


}