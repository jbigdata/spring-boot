package com.wanliang.site.controller.weixin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2015/8/6.
 */
@Controller
@RequestMapping("/weixin")
public class WxIndexController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WxIndexController.class);



    @RequestMapping(value = "/index")
    public String index() {
        return "/weixin/index";
    }
}
