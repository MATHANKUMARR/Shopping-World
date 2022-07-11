package com.example.demo.service;

import java.io.File;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Cart;
import com.example.demo.entity.Customer;
import com.example.demo.entity.Sales;
import com.example.demo.exception.EmailIdNotValidException;
import com.example.demo.report.Check_Mail;
import com.example.demo.report.SendEmailToCustomer;
import com.example.demo.repository.CartRepo;
import com.example.demo.repository.CustomerRepo;
import com.example.demo.repository.SalesRepo;

@Service
public class AllService {

	@Autowired
	private SendEmailToCustomer mail;

	@Autowired
	public Check_Mail validMail;

	@Autowired
	private SalesRepo salesRepo;

	@Autowired
	private CustomerRepo customerRepo;

	@Autowired
	private CartRepo cartRepo;

	// Password Encoder
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	// Cart List
	List<Sales> myCart = new ArrayList<Sales>();

	int total = 0;
	int quantity = 0;

	LocalDate myDate = LocalDate.now();
	LocalTime myTime = LocalTime.now();
	DateTimeFormatter myFormatDate = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	DateTimeFormatter myFormatTime = DateTimeFormatter.ofPattern("HH:mm:ss");

	String formattedDate = myDate.format(myFormatDate);
	String formattedTime = myTime.format(myFormatTime);

	int user;
	
	String mailContent = "<html><head><style>tfoot,th{background-color: #A9A9A9;text-align: center;padding: 10px;}td{padding: 10px;text-align: center;font-family: 'Courier New', monospace;}</style></head><center><h1>Online Shopping World</h1><br><h2>Bill Receipt</h2><table cellspacing='0'><tr><th>S.No.</th><th>P.ID.</th><th>P.Name</th><th>Rate</th><th>Qty</th><th>Amount</th></tr>";

	String purchaseDate;

	String purchaseTime;

	// add Cart products to the table
	public void addCart(List<String> carts) {
		
		// Get users using usernames
		List<Customer> customers = customerRepo.nameCustomers(carts.get(carts.size() - 2));

		for (int i = 0; i < customers.size(); i++) {
			// Password matching
			if (encoder.matches(carts.get(carts.size() - 1), customers.get(i).getPassword())) {

				user = customers.get(i).getCustomerid();
				int count = 1;
				for (int j = 1; j < carts.size() - 2; j += 5) {

					purchaseDate = formattedDate;
					purchaseTime = formattedTime;

					Cart cart = cartRepo.save(
							new Cart(carts.get(j), String.valueOf(customers.get(i).getCustomerid()), carts.get(j + 1),
									carts.get(j + 2), carts.get(j + 3), carts.get(j + 4), purchaseDate, purchaseTime));
					
					mailContent += "<tr><td>"+count+"</td><td>"+carts.get(j)+"</td><td>"+carts.get(j + 1)+"</td><td>"+carts.get(j + 2)+"</td><td>"+carts.get(j + 3)+"</td><td>"+carts.get(j + 4)+"</td></tr>\n";
					
					count += 1;
					
					// Calculating total amount
					total += Integer.parseInt(carts.get(j + 4));

					// Calculating total quantity
					quantity += Integer.parseInt(carts.get(j + 3));
				}
			}
		}
	}
	
	// get the cart details
	public List<Cart> getCartDetails() {
		List<Cart> details = cartRepo.getCartDetails(String.valueOf(user), purchaseDate, purchaseTime,
				Sort.by(Sort.Direction.ASC, "productId"));
		return details;
	}

	// get total amount
	public int getTotal() {
		return total;
	}

	// get total qty
	public int getQuantity() {
		return quantity;
	}

	// Add new Product
	public Sales newProduct(Sales sales) {
		
		Sales sale = salesRepo.save(new Sales(sales.getProductId(), sales.getProductName(), sales.getProductPrice(),sales.getImagePath()));
		return sale;
	}

	// Add new Customer
	public Customer newCustomer(Customer customer) throws EmailIdNotValidException {
		if (validMail.checkMail(customer.getEmail())) {
			Customer cust = customerRepo.save(customer);
			return cust;

		} else {
			throw new EmailIdNotValidException();
		}
	}

	// Find all products
	public List<Sales> getAllProducts() {
		List<Sales> allProducts = salesRepo.findAll();
		return allProducts;
	}

	// Sending Email
	public void sendEmail() throws MessagingException {

		Customer customer = customerRepo.getById(user);
		
		mailContent += "<tfoot><tr><td></td><td><b>Total</b></td><td></td><td></td><td><b>"+quantity+"</b></td><td><b>Rs."+total+" /-</b></td><tr><tfoot></table></center></html>";
			
		mail.sendEmail(customer.getEmail(), mailContent);
	}

	// Find one product using Id value // Check if id is present or not
	public Optional<Sales> getOneProduct(int id) {
		Optional<Sales> sales = salesRepo.findById(id);
		return sales;
	}

	// Update Product
	public Sales updateProduct(int pid,String pName,String pPrice,String filePath) {
		Optional<Sales> product = salesRepo.findById(pid);
		Sales sales = product.get();
		sales.setProductName(pName);
		sales.setProductPrice(pPrice);
		sales.setImagePath(filePath);
		// Save new class
		salesRepo.save(sales);

		return sales;
	}

	// Delete One Product
	public void deleteOneProduct(int id) {
		
		String path = salesRepo.findByImagePath(id);
		
		File f = new File(path);
		f.delete();
		
		salesRepo.deleteById(id);
		
		System.out.println("Deleted Successfully!!!");
		
	}
	
	// Delete picture
		public void deleteOnePicture(int id) {
			
			String path = salesRepo.findByImagePath(id);
			
			File f = new File(path);
			f.delete();
		}

	// Add produt to the cart
	public void addToCart(int id) {
		Optional<Sales> product = salesRepo.findById(id);	
		myCart.add(product.get());
	}

	// Get cart
	public List<Sales> getCart() {
		return myCart;
	}

	// Remove product from cart
	public void removeFromCart(int id) {

		for (int i = 0; i < myCart.size(); i++) {
			if (myCart.get(i).getProductId() == id) {
				myCart.remove(i);
				break;
			}
		}
	}

	// Delete all cart products
	public void cleanCart() {
		myCart.clear();
	}

}
