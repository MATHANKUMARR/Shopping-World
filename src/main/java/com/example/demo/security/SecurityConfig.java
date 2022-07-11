package com.example.demo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


@Configuration
@Order(1)
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	private UserDetailsService userDetailsService;
	
	@Bean
	public AuthenticationProvider authProvider() {
		
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(userDetailsService);
		provider.setPasswordEncoder(new BCryptPasswordEncoder());
		//new BCryptPasswordEncoder()
		return provider;
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf().disable()
			.authorizeRequests()
			.antMatchers("/user/addCustomer","/admin/getProducts","/user/getProducts","/admin/deleteProduct","/user/addToCart","/user/getCart","/user/addCart","/user/removeFromCart","/adminLogout","/checkAdmin","/admin_home","/addNewProduct","/saveProduct","/deleteProduct","/updateProduct","/saveUpdateProduct","/deletePicture").permitAll()
			.antMatchers("/register").permitAll()
			.antMatchers("/").permitAll()
			.anyRequest().authenticated()
			.and()
			.formLogin()
			.loginPage("/customerLogin").permitAll()
			.defaultSuccessUrl("/customer_home", true)
			.and()
			.logout().invalidateHttpSession(true)
			.clearAuthentication(true)
			.logoutRequestMatcher(new AntPathRequestMatcher("/customerLogout"))
			.logoutSuccessUrl("/customerLogin").permitAll();
	}

}