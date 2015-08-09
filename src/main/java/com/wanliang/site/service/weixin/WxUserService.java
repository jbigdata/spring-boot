/**
* Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
*/
package com.wanliang.site.service.weixin;

import java.util.List;

import com.wanliang.site.common.persistence.Page;
import com.wanliang.site.domain.WxUser;
import com.wanliang.site.repository.WxUserRepository;
import com.wanliang.site.service.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
* 微信用户Service
* @author wanliang
* @version 2015-07-27
*/
@Service
@Transactional(readOnly = true)
public class WxUserService extends BaseService<WxUserRepository, WxUser> {

	public WxUser get(String id) {
		return super.get(id);
	}

	public List<WxUser> findList(WxUser wxUser) {
		return super.findList(wxUser);
	}

	public Page<WxUser> findPage(Page<WxUser> page, WxUser wxUser) {
		return super.findPage(page, wxUser);
	}

	@Transactional(readOnly = false)
	public void save(WxUser wxUser) {
		super.save(wxUser);
	}

	@Transactional(readOnly = false)
	public void delete(WxUser wxUser) {
		super.delete(wxUser);
	}

}