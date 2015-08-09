package com.wanliang.site.controller.weixin;

import com.wanliang.site.common.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
* Created by wanliang_mvp on 2015/7/25.
*/
@Controller
@RequestMapping("/weixin")
public class WxMessageContorller extends BaseController {

    @RequestMapping(value = "/message/index", method = RequestMethod.GET)
    public String index(ModelMap model) {

        return "weixin/message/index";
    }
}
