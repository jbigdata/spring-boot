/**
* Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
*/
package com.wanliang.site.common.web;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import javax.validation.Validator;

import com.alibaba.fastjson.JSON;
import com.wanliang.site.common.util.DateUtils;
import com.wanliang.site.common.util.HttpClientUtils;
import com.wanliang.site.domain.Token;
import com.wanliang.site.domain.User;
import org.apache.commons.lang3.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
* 控制器支持类
* @author ThinkGem
* @version 2013-3-23
*/
public abstract class BaseController {

    protected static String SUCCESS_CODE="00000";

    protected  Result result;
	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 管理基础路径
	 */
	//@Value("${adminPath}")
	protected String adminPath;

	/**
	 * 前端基础路径
	 */
	//@Value("${frontPath}")
	protected String frontPath;

	/**
	 * 前端URL后缀
	 */
	//@Value("${urlSuffix}")
	protected String urlSuffix;


    @Value("${weixinUrl}")
    protected String weixinUrl;


	/**
	 * 添加Model消息
	 * @param
	 */
	protected void addMessage(Model model, String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages){
			sb.append(message).append(messages.length>1?"<br/>":"");
		}
		model.addAttribute("message", sb.toString());
	}

	/**
	 * 添加Flash消息
	 * @param
	 */
	protected void addMessage(RedirectAttributes redirectAttributes, String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages){
			sb.append(message).append(messages.length>1?"<br/>":"");
		}
		redirectAttributes.addFlashAttribute("message", sb.toString());
	}


    /**
	 * 客户端返回JSON字符串
	 * @param response
	 * @param object
	 * @return
	 */
	protected String renderString(HttpServletResponse response, Object object) {
		return renderString(response, JSON.toJSONString(object), "application/json");
	}

	/**
	 * 客户端返回字符串
	 * @param response
	 * @param string
	 * @return
	 */
	protected String renderString(HttpServletResponse response, String string, String type) {
		try {
			response.reset();
	        response.setContentType(type);
	        response.setCharacterEncoding("utf-8");
			response.getWriter().print(string);
			return null;
		} catch (IOException e) {
			return null;
		}
	}

//	/**
//	 * 参数绑定异常
//	 */
//	@ExceptionHandler({BindException.class, ConstraintViolationException.class, ValidationException.class})
//    public String bindException() {
//        return "error/400";
//    }
//
//	/**
//	 * 授权登录异常
//	 */
//	//@ExceptionHandler({AuthenticationException.class})
//    public String authenticationException() {
//        return "error/403";
//    }
//
//	/**
//	 * 初始化数据绑定
//	 * 1. 将所有传递进来的String进行HTML编码，防止XSS攻击
//	 * 2. 将字段中Date类型转换为String类型
//	 */
//	@InitBinder
//	protected void initBinder(WebDataBinder binder) {
//		// String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
//		binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
//			@Override
//			public void setAsText(String text) {
//				setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
//			}
//			@Override
//			public String getAsText() {
//				Object value = getValue();
//				return value != null ? value.toString() : "";
//			}
//		});
//		// Date 类型转换
//		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
//			@Override
//			public void setAsText(String text) {
//				setValue(DateUtils.parseDate(text));
//			}
////			@Override
////			public String getAsText() {
////				Object value = getValue();
////				return value != null ? DateUtils.formatDateTime((Date)value) : "";
////			}
//		});
//	}


	/**
	 * 获取Token
	 * @return
	 */
	protected String getWxToken(){
//		User user=null; //UserUtils.getUser();
//		if(user==null) {
//		   return null;
//		}
//		String wx_token=null;//JedisUtils.get("wx_token_" + user.getId());
//		if(wx_token!=null&&!wx_token.equals("")) {
//              return wx_token;
//		}
		//Map<String,String> pubMap=JedisUtils.getMap("pub_"+user.getId());pubMap.get("grant_type"), pubMap.get("appid"), pubMap.get("secret")
		String tokenJson = HttpClientUtils.get(this.weixinUrl+ "token?grant_type={0}&appid={1}&secret={2}", new Object[]{"client_credential","wx28498fc8e188a035","3058bfb4f7751bfeff1d2a5d810a5412"});
		logger.debug("tokenJson:"+tokenJson);
		Token token= JSON.parseObject(tokenJson, Token.class);
		//JedisUtils.set("wx_token_" + user.getId(),token.getAccess_token() , 7200);
		return token.getAccess_token();
	}

    public Result getResult(String code,Object data){
        result=new Result(code);
        result.setData(data);
        return result;
    }

    public Result getResult(String code){
        result=new Result(code);
        return result;
    }
}
