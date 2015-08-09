package com.wanliang.site.service;

import com.wanliang.site.common.security.CaptchaFormAuthenticationFilter;
import com.wanliang.site.domain.sys.UserSession;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SimpleSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.Date;

@Service

@Transactional
public class UserSessionService {


    private UserSession coverSessionToUserSession(Session session) {
        UserSession userSession = new UserSession();
        userSession.setSessionId(String.valueOf(session.getId()));
        userSession.setLastAccessTime(session.getLastAccessTime());
        userSession.setHost(session.getHost());
        userSession.setStartTime(session.getStartTimestamp());
        return userSession;
    }

    private Session coverUserSessionToSession(UserSession userSession) {
        SimpleSession session = new SimpleSession();
        session.setId(userSession.getId());
        session.setLastAccessTime(userSession.getLastAccessTime());
        session.setHost(userSession.getHost());
        session.setStartTimestamp(userSession.getStartTime());
        return session;
    }
}
