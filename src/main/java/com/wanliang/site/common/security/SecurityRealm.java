package com.wanliang.site.common.security;

import com.wanliang.site.common.util.Encodes;
import com.wanliang.site.domain.User;
import com.wanliang.site.domain.sys.Permission;
import com.wanliang.site.domain.sys.Role;
import com.wanliang.site.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.stream.Collectors;

public class SecurityRealm extends AuthorizingRealm {
    private static final Logger logger = LoggerFactory.getLogger(SecurityRealm.class);

    @Autowired
    UserService userService;

    /**
     * 授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        logger.debug("doGetAuthorizationInfo......");

        SimpleAuthorizationInfo info = null;

        SecurityUser securityUser = (SecurityUser) principals.getPrimaryPrincipal();
        User user = userService.getUser(securityUser.username);

        if (user != null) {
            info = new SimpleAuthorizationInfo();

//            for (Role role : user.getRoles()) {
//                // 用户拥有角色
//                info.addRole(role.getCode());
//
//                // 角色的授权信息
//               // info.addStringPermissions(role.getPermissions().stream().map(Permission::getCode).collect(Collectors.toSet()));
//            }
            // 用户的授权信息
            //info.addStringPermissions(user.getPermissions().stream().map(Permission::getCode).collect(Collectors.toSet()));
        }
        return info;
    }

    /**
     * 认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        logger.debug("doGetAuthenticationInfo......");
        CaptchaUsernamePasswordToken token = (CaptchaUsernamePasswordToken) authcToken;

        User user = userService.getUser(token.getUsername());
        if (user != null) {
            // 检查用户是否禁用
            if (user.getIsEnabled()) {
                throw new DisabledAccountException();
            }

            byte[] salt = Encodes.decodeHex(user.getPassword());

            return new SimpleAuthenticationInfo(new SecurityUser(user.getUsername(), user.getName()),
                    user.getPassword(), ByteSource.Util.bytes(salt), getName());
        }
        return null;
    }
}
