///**
// * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
// */
//package com.wanliang.site.service.weixin;
//
//import java.util.List;
//
//import com.wedian.site.common.persistence.Page;
//import com.wedian.site.common.service.CrudService;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.wedian.site.modules.weixin.entity.WxPub;
//import com.wedian.site.modules.weixin.dao.WxPubDao;
//
///**
// * 公众号Service
// * @author wanliang
// * @version 2015-07-27
// */
//@Service
//@Transactional(readOnly = true)
//public class WxPubService extends CrudService<WxPubDao, WxPub> {
//
//	public WxPub get(String id) {
//		return super.get(id);
//	}
//
//	public List<WxPub> findList(WxPub wxPub) {
//		return super.findList(wxPub);
//	}
//
//	public Page<WxPub> findPage(Page<WxPub> page, WxPub wxPub) {
//		return super.findPage(page, wxPub);
//	}
//
//	@Transactional(readOnly = false)
//	public void save(WxPub wxPub) {
//		super.save(wxPub);
//	}
//
//	@Transactional(readOnly = false)
//	public void delete(WxPub wxPub) {
//		super.delete(wxPub);
//	}
//
//}