/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.wanliang.site.service.weixin;

import java.util.List;

import com.wedian.site.common.persistence.Page;
import com.wedian.site.common.service.CrudService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wedian.site.modules.weixin.entity.WxGroup;
import com.wedian.site.modules.weixin.dao.WxGroupDao;

/**
 * 分组管理Service
 * @author wanliang
 * @version 2015-07-27
 */
@Service
@Transactional(readOnly = true)
public class WxGroupService extends CrudService<WxGroupDao, WxGroup> {

	public WxGroup get(String id) {
		return super.get(id);
	}
	
	public List<WxGroup> findList(WxGroup wxGroup) {
		return super.findList(wxGroup);
	}
	
	public Page<WxGroup> findPage(Page<WxGroup> page, WxGroup wxGroup) {
		return super.findPage(page, wxGroup);
	}
	
	@Transactional(readOnly = false)
	public void save(WxGroup wxGroup) {
		super.save(wxGroup);
	}
	
	@Transactional(readOnly = false)
	public void delete(WxGroup wxGroup) {
		super.delete(wxGroup);
	}
	
}