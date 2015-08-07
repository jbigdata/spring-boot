/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.wanliang.site.controller.weixin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wedian.site.common.config.Global;
import com.wedian.site.common.persistence.Page;
import com.wedian.site.common.utils.StringUtils;
import com.wedian.site.common.web.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wedian.site.modules.weixin.entity.WxGroup;
import com.wedian.site.modules.weixin.service.WxGroupService;

/**
 * 分组管理Controller
 * @author wanliang
 * @version 2015-07-27
 */
@Controller
@RequestMapping(value = "${adminPath}/weixin/wxGroup")
public class WxGroupController extends BaseController {

	@Autowired
	private WxGroupService wxGroupService;
	
	@ModelAttribute
	public WxGroup get(@RequestParam(required=false) String id) {
		WxGroup entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = wxGroupService.get(id);
		}
		if (entity == null){
			entity = new WxGroup();
		}
		return entity;
	}
	
	@RequiresPermissions("weixin:wxGroup:view")
	@RequestMapping(value = {"list", ""})
	public String list(WxGroup wxGroup, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<WxGroup> page = wxGroupService.findPage(new Page<WxGroup>(request, response), wxGroup);
		model.addAttribute("page", page);
		return "modules/weixin/wxGroupList";
	}

	@RequiresPermissions("weixin:wxGroup:view")
	@RequestMapping(value = "form")
	public String form(WxGroup wxGroup, Model model) {
		model.addAttribute("wxGroup", wxGroup);
		return "modules/weixin/wxGroupForm";
	}

	@RequiresPermissions("weixin:wxGroup:edit")
	@RequestMapping(value = "save")
	public String save(WxGroup wxGroup, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, wxGroup)){
			return form(wxGroup, model);
		}
		wxGroupService.save(wxGroup);
		addMessage(redirectAttributes, "保存分组管理成功");
		return "redirect:"+ Global.getAdminPath()+"/weixin/wxGroup/?repage";
	}
	
	@RequiresPermissions("weixin:wxGroup:edit")
	@RequestMapping(value = "delete")
	public String delete(WxGroup wxGroup, RedirectAttributes redirectAttributes) {
		wxGroupService.delete(wxGroup);
		addMessage(redirectAttributes, "删除分组管理成功");
		return "redirect:"+Global.getAdminPath()+"/weixin/wxGroup/?repage";
	}

}