package com.wanliang.site.controller.weixin;

import com.wedian.site.common.config.Global;
import com.wedian.site.common.web.BaseController;
import com.wedian.site.common.web.HttpClientUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wanliang_mvp on 2015/7/25.
 */
@Controller
@RequestMapping("/weixin")
public class WxIndexContorller extends BaseController {

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap model) {
       // String groupStr = HttpClientUtils.get(Global.getWeixinUrl() + "groups/get?access_token={0}", new Object[]{this.getWxToken()});
      //  logger.debug("groupStr:"+groupStr);

        return "weixin/index.ftl";
    }
}
