package com.example.demo.exception;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.configuration.SalesConfiguration;

@Controller
@ControllerAdvice
public class AllExceptions {
	
	@Autowired
	private SalesConfiguration config;
	
	//Exception for SQLException
	@ExceptionHandler(SQLException.class)
	public String handleSQLException(SQLException sqlException) {
		return "DatabaseError.jsp";
	}
	
	@ExceptionHandler(EmailIdNotValidException.class)
	public ModelAndView handleEmailIdNotValidException(EmailIdNotValidException validException) {
		ModelAndView model = new ModelAndView();
		model.setViewName("register.jsp");
		
		String error = config.getProperty("MailNotValid");
		System.out.println(error);
		model.addObject("error", error);
		return model;
	}
}
