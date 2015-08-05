package com.wanliang.site.controller;

import com.wanliang.site.command.GetUserCommand;
import com.wanliang.site.domain.User;
import com.wanliang.site.service.UserService;
import de.codecentric.boot.admin.model.Application;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2015/8/5.
 */
@Controller
public class UserController {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/user/getUser", method = RequestMethod.POST)
    @ResponseBody
    public User getUser(@RequestBody GetUserCommand command) {
        LOGGER.info("get User with username '{}' and URL '{}'", command.getId());
        return userService.getUser(command.getId());
    }
}
