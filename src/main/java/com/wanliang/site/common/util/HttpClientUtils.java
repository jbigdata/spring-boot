package com.wanliang.site.common.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * Rest工具类
 *
 * @author wanliang
 */
public class HttpClientUtils {

    private static final Log log = LogFactory.getLog(HttpClientUtils.class);
    /**
     * 初始化HttpClient
     */
    private static HttpClient httpClient = null;

    /**
     * 生产HttpClient实例
     * 公开，静态的工厂方法，需要使用时才去创建该单体
     *
     * @return
     */
    public static HttpClient getHttpClient() {
        if (httpClient == null) {
            httpClient = new DefaultHttpClient(new ThreadSafeClientConnManager());
        }
        return httpClient;
    }

    /**
     * POST方式调用
     *
     * @param url
     * @param params 参数为NameValuePair键值对对象
     * @return 响应字符串
     * @throws java.io.UnsupportedEncodingException
     */
    public static String post(String url, List<NameValuePair> params) {
        HttpClient httpclient = getHttpClient();

        HttpPost post = new HttpPost(url);


        ResponseHandler<String> responseHandler = new BasicResponseHandler();
        String responseJson = null;
        try {
            if (params != null) {
                post.setEntity(new UrlEncodedFormEntity(params));
            }
            responseJson = httpclient.execute(post, responseHandler);
            log.info("HttpClient POST请求结果：" + responseJson);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            log.info("HttpClient POST请求异常：" + e.getMessage());
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            httpclient.getConnectionManager().closeExpiredConnections();
            httpclient.getConnectionManager().closeIdleConnections(30, TimeUnit.SECONDS);
        }
        return responseJson;
    }

    /**
     * Get方式请求
     *
     * @param url    带参数占位符的URL，例：http://User/user/center.aspx?_action=GetSimpleUserInfo&codes={0}&email={1}
     * @param params 参数值数组，需要与url中占位符顺序对应
     * @return 响应字符串
     * @throws java.io.UnsupportedEncodingException
     */
    public static String get(String url, Object[] params) {
        HttpClient httpclient =null;

        String messages = MessageFormat.format(url, params);

        HttpGet get = new HttpGet(messages);
        log.debug("get url:"+messages);
        get.setHeader("Content-Type", "application/json; encoding=utf-8");
        get.setHeader("Accept", "application/json");
        ResponseHandler<String> responseHandler = new BasicResponseHandler();
        String responseJson = null;
        try {
            httpclient=new SSLClient();
            HttpResponse response  = httpclient.execute(get);
            HttpEntity entity = response.getEntity();
            responseJson = EntityUtils.toString(entity, "UTF-8").trim();
            get.abort();
            log.info("HttpClient GET请求结果：" + responseJson);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            log.info("HttpClient GET请求异常：" + e.getMessage());
        } catch (IOException e) {
            e.printStackTrace();
            log.info("HttpClient GET请求异常：" + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            log.info("HttpClient GET请求异常：" + e.getMessage());
        }finally {
            httpclient.getConnectionManager().closeExpiredConnections();
            httpclient.getConnectionManager().closeIdleConnections(30, TimeUnit.SECONDS);
        }
        return responseJson;
    }

    /**
     * @param url
     * @return
     */
    public static String get(String url) {
        HttpClient httpclient = null;
        HttpGet get = new HttpGet(url);
        get.setHeader("Content-Type", "application/json; encoding=utf-8");
        get.setHeader("Accept", "application/json");
        ResponseHandler<String> responseHandler = new BasicResponseHandler();
        String responseJson = null;
        try {
            httpclient=new SSLClient();
            HttpResponse response  = httpclient.execute(get);
            HttpEntity entity = response.getEntity();
            responseJson = EntityUtils.toString(entity, "UTF-8").trim();
            get.abort();
            log.info("HttpClient GET请求结果：" + responseJson);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            log.info("HttpClient GET请求异常：" + e.getMessage());
        } catch (IOException e) {
            e.printStackTrace();
            log.info("HttpClient GET请求异常：" + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            log.info("HttpClient GET请求异常：" + e.getMessage());
        } finally {
            httpclient.getConnectionManager().closeExpiredConnections();
            httpclient.getConnectionManager().closeIdleConnections(30, TimeUnit.SECONDS);
        }
        return responseJson;
    }
}