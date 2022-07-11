package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Customer;

@Repository
public interface CustomerRepo extends JpaRepository<Customer,Integer> {
	Customer findByCustomername(String customername);
	
	@Query("SELECT u FROM Customer u WHERE u.customername = ?1")
	List<Customer> nameCustomers(String customername);
}
