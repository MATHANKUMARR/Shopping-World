package com.example.demo.report;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

@Configuration
public class SendEmailToCustomer{
	
	@Autowired
    private JavaMailSender javaMailSender;

    public void sendEmail(String toMail,String content) throws MessagingException {

    	MimeMessage msg = javaMailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(msg, true);
        
        helper.setTo(toMail);

        helper.setSubject("Thank You!...Come Again!");

        helper.setText(content, true);

        javaMailSender.send(msg);

    }
}
