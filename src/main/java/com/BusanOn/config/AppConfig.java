package com.BusanOn.config;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.apache.ibatis.session.SqlSessionFactory;

@Configuration
public class AppConfig {

    @Bean(name = "uploadPath")
    public String uploadPath(@Value("${app.upload-path}") String uploadPath) {
        return uploadPath;
    }

    @Bean(name = "reviewUploadPath")
    public String reviewUploadPath(@Value("${app.review-upload-path}") String reviewUploadPath) {
        return reviewUploadPath;
    }

    @Bean(name = "sqlSession")
    public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

    @Bean(name = "mailSender")
    public JavaMailSenderImpl mailSender(
            @Value("${spring.mail.host:}") String host,
            @Value("${spring.mail.port:587}") int port,
            @Value("${spring.mail.username:}") String username,
            @Value("${spring.mail.password:}") String password,
            @Value("${spring.mail.properties.mail.smtp.auth:true}") boolean auth,
            @Value("${spring.mail.properties.mail.smtp.starttls.enable:true}") boolean startTls,
            @Value("${spring.mail.properties.mail.smtp.ssl.trust:}") String sslTrust,
            @Value("${spring.mail.properties.mail.smtp.ssl.protocols:TLSv1.2}") String sslProtocols
    ) {
        JavaMailSenderImpl sender = new JavaMailSenderImpl();
        sender.setHost(host);
        sender.setPort(port);
        sender.setUsername(username);
        sender.setPassword(password);
        java.util.Properties props = sender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", String.valueOf(auth));
        props.put("mail.smtp.starttls.enable", String.valueOf(startTls));
        props.put("mail.smtp.ssl.trust", sslTrust);
        props.put("mail.smtp.ssl.protocols", sslProtocols);
        return sender;
    }

    @Bean
    public MultipartResolver multipartResolver() {
        return new StandardServletMultipartResolver();
    }
}
