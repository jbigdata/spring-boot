/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.wanliang.site.domain;

import com.wanliang.site.common.persistence.BaseEntity;
import com.wanliang.site.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;


/**
 * 微信用户Entity
 * @author wanliang
 * @version 2015-07-27
 */
public class WxUser extends DataEntity<WxUser> {
	
	private static final long serialVersionUID = 1L;
	private String subscribe;		// subscribe
	private String openid;		// openid
	private String nickname;		// nickname
	private String sex;		// sex
	private String language;		// language
	private String city;		// city
	private String province;		// province
	private String country;		// country
	private String headimgurl;		// headimgurl
	private String subscribeTime;		// subscribe_time
	private String unionid;		// unionid
	private String remark;		// remark
	private String groupid;		// groupid
	
	public WxUser() {
		super();
	}


	@Length(min=1, max=50, message="subscribe长度必须介于 1 和 50 之间")
	public String getSubscribe() {
		return subscribe;
	}

	public void setSubscribe(String subscribe) {
		this.subscribe = subscribe;
	}
	
	@Length(min=1, max=50, message="openid长度必须介于 1 和 50 之间")
	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}
	
	@Length(min=0, max=50, message="nickname长度必须介于 0 和 50 之间")
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Length(min=0, max=1, message="sex长度必须介于 0 和 1 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=0, max=10, message="language长度必须介于 0 和 10 之间")
	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}
	
	@Length(min=0, max=20, message="city长度必须介于 0 和 20 之间")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	@Length(min=0, max=20, message="province长度必须介于 0 和 20 之间")
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	
	@Length(min=0, max=20, message="country长度必须介于 0 和 20 之间")
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	@Length(min=0, max=100, message="headimgurl长度必须介于 0 和 100 之间")
	public String getHeadimgurl() {
		return headimgurl;
	}

	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}
	
	@Length(min=0, max=20, message="subscribe_time长度必须介于 0 和 20 之间")
	public String getSubscribeTime() {
		return subscribeTime;
	}

	public void setSubscribeTime(String subscribeTime) {
		this.subscribeTime = subscribeTime;
	}
	
	@Length(min=0, max=50, message="unionid长度必须介于 0 和 50 之间")
	public String getUnionid() {
		return unionid;
	}

	public void setUnionid(String unionid) {
		this.unionid = unionid;
	}
	
	@Length(min=0, max=200, message="remark长度必须介于 0 和 200 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Length(min=0, max=20, message="groupid长度必须介于 0 和 20 之间")
	public String getGroupid() {
		return groupid;
	}

	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}
	
}