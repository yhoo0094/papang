package co.company.papang.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailAuthConfiguration {
	@Bean(name="mailSender")
	public JavaMailSender getJavaMailSender() {
		Properties properties = new Properties(); 
		properties.put("mail.smtp.auth", true);
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.starttls.required", true);
		properties.put("mail.debug", true);
		
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587); // 지메일. 465 네이버 
		mailSender.setUsername("dleotjs2018@gmail.com"); // 보내는사람(관리자) 이메일
		mailSender.setPassword("dPekagkrdnjs"); // 관리자 비번
		mailSender.setDefaultEncoding("utf-8");
		mailSender.setJavaMailProperties(properties);
		
		return mailSender;
		
	}
}
