package com.example.demo.Controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.Customer;
import com.example.demo.entity.Sales;
import com.example.demo.service.AllService;

@RestController
public class AppController {

	@Autowired
	public AllService service;

	// Add new Customer
	@PostMapping("/user/addCustomer")
	public ResponseEntity<Customer> addCustomer(@RequestBody Customer customer) {

		try {

			Customer cust = service.newCustomer(customer);
			return new ResponseEntity<>(cust,HttpStatus.CREATED);

		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Get all Admin Products
	@GetMapping("/admin/getProducts")
	public ResponseEntity<List<Sales>> getAdminProducts() {
		try {
			List<Sales> allProducts = service.getAllProducts();

			if (allProducts.isEmpty()) {

				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			} else {

				return new ResponseEntity<>(allProducts, HttpStatus.OK);
			}
		} catch (Exception e) {

			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Get all User Products
	@GetMapping("/user/getProducts")
	public ResponseEntity<List<Sales>> getUserProducts() {
		try {
			List<Sales> allProducts = service.getAllProducts();

			if (allProducts.isEmpty()) {

				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			} else {

				return new ResponseEntity<>(allProducts, HttpStatus.OK);
			}
		} catch (Exception e) {

			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Delete Product from products
	@DeleteMapping("/admin/deleteProduct/{id}")
	public ResponseEntity<HttpStatus> deleteOneProduct(@PathVariable int id) {
		try {

			Optional<Sales> product = service.getOneProduct(id);

			if (product.isPresent()) {
				service.deleteOneProduct(id);
				return new ResponseEntity<>(HttpStatus.OK);

			} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}

		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Add product to cart
	@GetMapping("/user/addToCart/{id}")
	public ResponseEntity<HttpStatus> addToCart(@PathVariable int id) {
		try {

			Optional<Sales> product = service.getOneProduct(id);

			if (product.isPresent()) {

				// Added to list
				service.addToCart(id);

				return new ResponseEntity<>(HttpStatus.OK);

			} else {

				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {

			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// Get all products from cart
	@GetMapping("/user/getCart")
	public ResponseEntity<List<Sales>> getCart() {
		try {

			List<Sales> products = service.getCart();

			if (products.isEmpty()) {

				return new ResponseEntity<>(HttpStatus.NO_CONTENT);

			} else {

				return new ResponseEntity<>(products, HttpStatus.OK);
			}

		} catch (Exception e) {

			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping("/user/addCart/{cart}")
	public void addCart(@PathVariable List<String> cart) {

		service.addCart(cart);

	}

	// Delete one product from cart
	@DeleteMapping("/user/removeFromCart/{id}")
	public ResponseEntity<HttpStatus> removeFromCart(@PathVariable int id) {
		try {

			service.removeFromCart(id);

			return new ResponseEntity<>(HttpStatus.OK);

		} catch (Exception e) {

			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
