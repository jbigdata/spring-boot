package com.wanliang.site.controller.weixin;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.wanliang.site.domain.WxGroup;
import com.wanliang.site.domain.WxUser;
import com.wanliang.site.service.weixin.WxGroupService;
import com.wanliang.site.service.weixin.WxUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Created by Administrator on 2015/7/23.
*/
@Controller
@RequestMapping("/weixin")
public class WxUserController  {

    @Autowired
    private WxUserService wxUserService;

    @Autowired
    private WxGroupService wxGroupService;

    @RequestMapping(value = "/user/index", method = RequestMethod.GET)
    public String group(ModelMap model) {
         WxGroup wxGroup=new WxGroup();
         //wxGroup.set("1");
        model.addAttribute("groups", wxGroupService.findList(wxGroup));
        return "/weixin/user/index";
    }

    @RequestMapping(value = "/user/{groupId}", method = RequestMethod.GET)
    @ResponseBody
    public Object getUsers(@PathVariable("groupId")String groupId, ModelMap model) {
       Map<String,Object> resultMap=new HashMap<String,Object>();
        WxUser wxUser=new WxUser();
        wxUser.setGroupid(groupId);
        //wxUser.setCreateBy("1");
        resultMap.put("data",wxUserService.findList(wxUser));
        return resultMap;
    }


}
