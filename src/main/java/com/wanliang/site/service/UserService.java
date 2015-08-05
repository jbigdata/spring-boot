package com.wanliang.site.service;

import com.wanliang.site.domain.User;
import com.wanliang.site.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2015/8/5.
 */
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;


    public User getUser(String username){

        return userRepository.selectUser(username);
    }
}
