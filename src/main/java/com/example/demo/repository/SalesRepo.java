package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Sales;

@Repository
public interface SalesRepo extends JpaRepository<Sales,Integer> {
	Iterable<Sales> findByProductNameContaining(String productName);
	
	@Query("SELECT imagePath FROM Sales u WHERE u.productId = ?1")
	String findByImagePath(int id);
}
