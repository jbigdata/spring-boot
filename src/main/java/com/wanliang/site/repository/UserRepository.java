package com.wanliang.site.repository;

import com.wanliang.site.domain.User;

/**
 * Created by Administrator on 2015/8/5.
 */
public interface UserRepository {

    User selectUser(String username);
}
