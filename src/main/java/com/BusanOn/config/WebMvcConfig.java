package com.BusanOn.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Value("${app.upload-path}")
    private String uploadPath;

    @Value("${app.review-upload-path}")
    private String reviewUploadPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/resources/**")
//                .addResourceLocations("/resources/");
//
//        String up = uploadPath.replace("\\", "/");
//        if (!up.endsWith("/")) up = up + "/";
//        registry.addResourceHandler("/upload/**")
//                .addResourceLocations("file:" + up);
//
//        String rup = reviewUploadPath.replace("\\", "/");
//        if (!rup.endsWith("/")) rup = rup + "/";
//        registry.addResourceHandler("/review_upload/**")
//                .addResourceLocations("file:" + rup);

        registry.addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");

        registry.addResourceHandler("/upload/**")
                .addResourceLocations("file:/root/tomcat9/upload/");

        registry.addResourceHandler("/review_upload/**")
                .addResourceLocations("file:/root/tomcat9/review_upload/");
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("index");
    }


}
