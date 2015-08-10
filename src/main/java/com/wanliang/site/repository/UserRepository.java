package com.wanliang.site.repository;


import com.wanliang.site.domain.sys.User;

/**
 * Created by Administrator on 2015/8/5.
 */
public interface UserRepository  extends BaseReository<User>{

    User findUserByUserName(String username);
}
