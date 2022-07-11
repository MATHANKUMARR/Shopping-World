package com.example.demo.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

@Configuration
public class SalesConfiguration {
	@Autowired
	private Environment en;

	public String getProperty(String Key) {
		return en.getProperty(Key);
	}
}