/**
* Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
*/
package com.wanliang.site.controller.weixin;

import com.wanliang.site.common.web.BaseController;
import com.wanliang.site.domain.WxPub;
import com.wanliang.site.domain.sys.User;
import com.wanliang.site.service.weixin.WxPubService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* 机构Controller
* @author ThinkGem
* @version 2013-5-15
*/
@Controller
@RequestMapping("/weixin")
public class WxPubController extends BaseController {

	@Autowired
	private WxPubService wxPubService;

	@ModelAttribute("pub")
	public WxPub get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return wxPubService.get(id);
		}else{
			return new WxPub();
		}
	}

	@RequestMapping(value = {"/pub/index"})
	public String index(WxPub wxPub, ModelMap model) {
        model.addAttribute("list", wxPubService.findList(wxPub));
		return "weixin/pub/index.ftl";
	}

	@RequestMapping(value = {"list"})
	public String list(WxPub wxPub, Model model) {
        model.addAttribute("list", wxPubService.findList(wxPub));
		return "modules/sys/officeList.ftl";
	}
	@RequestMapping(value = "form")
	public String form(HttpServletRequest request, WxPub wxPub, Model model) {
		User user =this.getCurrentUser(request);

		model.addAttribute("office",  wxPubService.get(wxPub.getId()));
		return "modules/sys/officeForm.jsp";
	}

    @RequestMapping(value = "/pub/change/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Object changePub(@PathVariable("id")String id, ModelMap model) {
		User user=UserUtils.getUser();
		WxPub wxPub= wxPubService.get(id);
		logger.debug(user.getId()+":"+wxPub.getAppid());
		Map<String,String> appMap=new HashMap<String, String>();
		appMap.put("appid",wxPub.getAppid());
		appMap.put("secret",wxPub.getSecret());
		appMap.put("grant_type",wxPub.getGrantType());
		JedisUtils.setMap("pub_" + user.getId(), appMap,0);
         return "ok";
    }

	@RequestMapping(value = "save")
	public String save(WxPub wxPub, Model model, RedirectAttributes redirectAttributes) {

//		if (!beanValidator(model, wxPub)){
//			return form(wxPub, model);
//		}
		wxPubService.save(wxPub);

		addMessage(redirectAttributes, "保存机构'" + wxPub.getName() + "'成功");
		return "redirect:" + adminPath + "/sys/office/list";
	}

	@RequestMapping(value = "delete")
	public String delete(WxPub wxPub, RedirectAttributes redirectAttributes) {

//		if (Office.isRoot(id)){
//			addMessage(redirectAttributes, "删除机构失败, 不允许删除顶级机构或编号空");
//		}else{
			wxPubService.delete(wxPub);
			addMessage(redirectAttributes, "删除机构成功");
//		}
		return "redirect:" + adminPath + "/sys/office/list";
	}

}
