/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.wanliang.site.domain;

import org.hibernate.validator.constraints.Length;

import com.wedian.site.common.persistence.DataEntity;

/**
 * 分组管理Entity
 * @author wanliang
 * @version 2015-07-27
 */
public class WxGroup extends DataEntity<WxGroup> {
	
	private static final long serialVersionUID = 1L;
	private String groupId;
	private String name;		// name
	private String count;		// count
	
	public WxGroup() {
		super();
	}

	public WxGroup(String id){
		super(id);
	}

	@Length(min=1, max=50, message="name长度必须介于 1 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=6, message="count长度必须介于 1 和 6 之间")
	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
}