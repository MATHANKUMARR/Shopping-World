package com.example.demo.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Cart;

@Repository
public interface CartRepo extends JpaRepository<Cart, Integer> {
	
	@Query("SELECT u FROM Cart u WHERE u.customerid = ?1 and u.purchaseDate = ?2 and u.purchaseTime = ?3")
	List<Cart> getCartDetails(String customerid,String purchaseDate, String purchaseTime,Sort sort);
}
