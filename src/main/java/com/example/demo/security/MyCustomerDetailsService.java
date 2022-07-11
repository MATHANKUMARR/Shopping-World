package com.example.demo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Admin;
import com.example.demo.entity.Customer;
import com.example.demo.repository.AdminRepo;
import com.example.demo.repository.CustomerRepo;

@Service
public class MyCustomerDetailsService implements UserDetailsService {
	
	@Autowired
	private CustomerRepo repo1;

	
	@Override
	public UserDetails loadUserByUsername(String customername) throws UsernameNotFoundException {
		Customer customer = repo1.findByCustomername(customername);
		
		if(customer == null) {
			throw new UsernameNotFoundException("Customer not Found!");
		}
		
		return new CustomerPrincipal(customer);
	}

}
