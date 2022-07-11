package com.example.demo.security;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.demo.entity.Customer;

public class CustomerPrincipal implements UserDetails {
	
	private static final long serialVersionUID = 1L;
	
	
	private Customer customer;
	
	
	
	public CustomerPrincipal(Customer customer) {
		super();
		this.customer = customer;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities(){
		
		return Collections.singleton(new SimpleGrantedAuthority("USER"));
		
	}
	
	@Override
	public String getPassword(){
		return customer.getPassword();
	}
	
	@Override
	public String getUsername(){
		return customer.getCustomername();
	}
	
	@Override
	public boolean isAccountNonExpired(){
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked(){
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired(){
		return true;
	}
	
	@Override
	public boolean isEnabled(){
		return true;
	}
	
}
