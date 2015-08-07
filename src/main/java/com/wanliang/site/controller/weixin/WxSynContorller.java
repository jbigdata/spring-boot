package com.wanliang.site.controller.weixin;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.wedian.site.common.config.Global;
import com.wedian.site.common.utils.CacheUtils;
import com.wedian.site.common.web.BaseController;
import com.wedian.site.common.web.HttpClientUtils;
import com.wedian.site.common.web.Result;
import com.wedian.site.modules.sys.utils.UserUtils;
import com.wedian.site.modules.weixin.entity.Token;
import com.wedian.site.modules.weixin.entity.WxGroup;
import com.wedian.site.modules.weixin.entity.WxUser;
import com.wedian.site.modules.weixin.service.WxGroupService;
import com.wedian.site.modules.weixin.service.WxUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * Created by wanliang_mvp on 2015/7/25.
 */
@Controller
@RequestMapping("/weixin")
public class WxSynContorller extends BaseController {

    @Autowired
    private WxUserService wxUserService;

    @Autowired
    private WxGroupService wxGroupService;


    @RequestMapping(value = "/syn", method = RequestMethod.GET)
    public String index(ModelMap model) {

        return "weixin/syn.ftl";
    }

    @RequestMapping(value = "/syn", method = RequestMethod.POST)
    @ResponseBody
    public Object syn(ModelMap model) {
        String groupStr = HttpClientUtils.get(Global.getWeixinUrl() + "groups/get?access_token={0}", new Object[]{this.getWxToken()});
        logger.debug("groupStr:"+groupStr);
        List<WxGroup>  groupList=JSON.parseArray(JSON.parseObject(groupStr).getString("groups"),WxGroup.class);
        logger.debug("groupList:" + JSON.parseObject(groupStr).getString("groups"));
        List<WxGroup> wxGroups=new ArrayList<WxGroup>();
        for(WxGroup wxGroup:groupList){
            wxGroup.setCreateDate(new Date());
            wxGroup.setCreateBy(UserUtils.getUser());
            wxGroup.setGroupId(wxGroup.getId());
            wxGroup.setId(UUID.randomUUID().toString().replace("-",""));
            wxGroups.add(wxGroup);
        }
        wxGroupService.batchSave(wxGroups);
        String usersStr = HttpClientUtils.get(Global.getWeixinUrl() + "user/get?access_token={0}", new Object[]{this.getWxToken()});
        logger.debug("userStr:"+usersStr);
        JSONObject userJson=JSON.parseObject(usersStr);
        HashMap<String,Object> resultMap=new HashMap<String, Object>();
        resultMap.put("total",userJson.get("total"));
        resultMap.put("count",userJson.get("count"));
        resultMap.put("next_openid",userJson.get("next_openid"));
        JSONArray openidArr=userJson.getJSONObject("data").getJSONArray("openid");
        List<WxUser> userList=new ArrayList<WxUser>();
        for(int i=0;i<openidArr.size();i++) {
            String userStr = HttpClientUtils.get(Global.getWeixinUrl() + "user/info?access_token={0}&openid={1}&lang=zh_CN", new Object[]{this.getWxToken(),openidArr.get(i)});
            WxUser user=JSON.parseObject(userStr, WxUser.class);
            user.setCreateDate(new Date());
            user.setCreateBy(UserUtils.getUser());
            user.setId(UUID.randomUUID().toString().replace("-",""));
            //user.setId(user.getOpenid());
            userList.add(user);
        }
        wxUserService.batchSave(userList);
        logger.debug("syn user................");
        result=new Result("00000");
        return result;
    }
}
