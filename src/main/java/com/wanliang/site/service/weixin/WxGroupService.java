/**
* Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
*/
package com.wanliang.site.service.weixin;

import java.util.List;

import com.wanliang.site.common.persistence.Page;
import com.wanliang.site.domain.WxGroup;
import com.wanliang.site.repository.WxGroupRepository;
import com.wanliang.site.service.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
* 分组管理Service
* @author wanliang
* @version 2015-07-27
*/
@Service
@Transactional(readOnly = true)
public class WxGroupService extends BaseService<WxGroupRepository, WxGroup> {


}