/*
 * Copyright 2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.wanliang.site.config;

import java.util.List;

import com.wanliang.site.common.security.UserSecurityInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@Configuration
public class WebappConfig extends WebMvcConfigurerAdapter {

	/**
	 * Add JSON MessageConverter to send JSON objects to web clients.
	 */
	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		converters.add(new MappingJackson2HttpMessageConverter());
	}

    /**
     7.     * 配置拦截器
     8.     * @author lance
     9.     * @param registry
     10.     */
       public void addInterceptors(InterceptorRegistry registry) {
                registry.addInterceptor(new UserSecurityInterceptor()).addPathPatterns("/user/**");

           }


}


//
//import com.alibaba.fastjson.serializer.SerializerFeature;
//		import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
//		import org.springframework.context.annotation.Bean;
//		import org.springframework.context.annotation.Configuration;
//		import org.springframework.http.converter.HttpMessageConverter;
//		import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
//
//		import java.nio.charset.Charset;
//		import java.util.List;
//
//
//@Configuration
//public class WebappConfig extends WebMvcConfigurationSupport {
//
//
//	@Bean
//	public FastJsonHttpMessageConverter customFastJsonHttpMessageConverter() {
//		FastJsonHttpMessageConverter jsonConverter = new FastJsonHttpMessageConverter();
//		jsonConverter.setCharset(Charset.forName("UTF-8"));
//		jsonConverter.setFeatures(SerializerFeature.WriteDateUseDateFormat);
//		return jsonConverter;
//	}
//
//	@Override
//	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
//		converters.add(customFastJsonHttpMessageConverter());
//		super.addDefaultHttpMessageConverters(converters);
//	}
//
//
//}