package com.wanliang.site.common.security;

import com.wanliang.site.common.util.Encodes;
import com.wanliang.site.domain.sys.Permission;
import com.wanliang.site.domain.sys.Role;
import com.wanliang.site.domain.sys.User;
import com.wanliang.site.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class SecurityRealm extends AuthorizingRealm {
    private static final Logger log = LoggerFactory.getLogger(SecurityRealm.class);

    @Autowired
    UserService userService;


    /**
     * 为当前登录的Subject授予角色和权限
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {


        // 获取当前登录的用户名,等价于(String)principals.fromRealm(this.getName()).iterator().next()
        String currentUsername = (String) super.getAvailablePrincipal(principals);
        List<String> roleList = new ArrayList<String>();
        List<String> permissionList = new ArrayList<String>();
        // 从数据库中获取当前登录用户的详细信息
        User user = userService.findUserByUserName(currentUsername);

        if (null != user) {
            // 实体类User中包含有用户角色的实体类信息
//            if (null != user.getRoles() && user.getRoles().size() > 0) {
//                // 获取当前登录用户的角色
//                for (Role role : user.getRoles()) {
//                    if (!StringUtils.isBlank(role.getName())) {
//                        log.debug("授予角色>>>" + role.getName());
//                        roleList.add(role.getName());
//                    }
//                }
//            }
//            // 实体类User中包含有角色权限的实体类信息
//            if (null != user.getPermissions() && user.getPermissions().size() > 0) {
//                for (Permission pmss : user.getPermissions()) {
//                    if (!StringUtils.isBlank(pmss.getPermission())) {
//                        log.debug("授予权限>>>>" + pmss.getPermission());
//                        permissionList.add(pmss.getPermission());
//                    }
//                }
//            }
        } else {
            throw new AuthorizationException();
        }
        // 为当前用户设置角色和权限
        SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
        simpleAuthorInfo.addRoles(roleList);
        simpleAuthorInfo.addStringPermissions(permissionList);


        return simpleAuthorInfo;
    }


    /**
     * 验证当前登录的Subject
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
            throws AuthenticationException {
        // 获取基于用户名和密码的令牌
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        User user = userService.findUserByUserName(token.getUsername());
        AuthenticationInfo authcInfo = null;
        if (user == null) {
            throw new UnknownAccountException();// 未知账户
        } else if (user.getIsNewRecord()) {
            throw new LockedAccountException();// 账户已锁定，与管理员联系
        } else {
            authcInfo = new SimpleAuthenticationInfo(user.getUsername(),
                    user.getPassword(),
                    getName());
            this.setSession("currentUser", user);
        }

        return authcInfo;
    }


    /**
     * 更新授权信息缓存
     * */
    public void clearCachedAuthorizationInfo(String principal) {
        SimplePrincipalCollection principals = new SimplePrincipalCollection(principal, getName());
        clearCachedAuthorizationInfo(principals);
    }

    /**
     * ShiroSession设置
     *
     * @see 使用时直接用HttpSession.getAttribute(key)就可以取到
     */
    private void setSession(Object key, Object value) {
        Subject currentUser = SecurityUtils.getSubject();
        if (null != currentUser) {
            Session session = currentUser.getSession();
            if (null != session) {
                session.setAttribute(key, value);
            }
        }
    }
}
