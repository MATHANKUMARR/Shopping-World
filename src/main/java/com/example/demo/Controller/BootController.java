package com.example.demo.Controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.Cart;
import com.example.demo.entity.Sales;
import com.example.demo.report.GeneratePDF;
import com.example.demo.service.AllService;

@Controller
public class BootController {
	
	@Autowired
	public AllService service;
	
	@RequestMapping("/")
	public String getIndex() {
		return "index.jsp";
	}
	
	@RequestMapping("/register")
	public String getRegister() {
		return "register.jsp";
	}
	
	@RequestMapping("/adminLogout")
	public String getPage() {
			return "register.jsp";
	}
	
	@RequestMapping("/checkAdmin")
	public String getCheckAdmin(@RequestParam("username") String username,@RequestParam("password") String password) {
		if(username.equals("admin") && password.equals("1234")) {
			return "admin_home.jsp";
		}else {
			return "register.jsp";
		}
	}
	
	@RequestMapping("/customerLogin")
	public String customerLogin() {
		return "customerLogin.jsp";
	}
	
	@RequestMapping("/admin_home")
	public String getAdminHome() {
		return "admin_home.jsp";
	}
	
	@RequestMapping("/addNewProduct")
	public String addNewProduct(Model model,Sales sales) {
		
		
		
		model.addAttribute("sales",sales);
		return "addProduct.jsp";
	}
	
	@RequestMapping("/saveProduct")
	public String saveProduct(@RequestParam("image") MultipartFile multipartFile,Sales sales,HttpServletRequest request) throws IOException {
		
		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        String ext = request.getSession().getServletContext().getRealPath("/Pics/");
        
        String filePath = ext + fileName;
        
        System.out.println(filePath);
        
        File dest = new File(filePath);
        //check destination exists, if not create it
       
        try { 
        	multipartFile.transferTo(dest); 
        	
        }
        catch (IllegalStateException e) 
        { 
            e.printStackTrace();
        }
        
        sales.setImagePath(filePath);
        
		service.newProduct(sales);
		
		return "redirect:/admin_home";
	}
	
	@RequestMapping("/deleteProduct")
	public String deleteProduct() {
		return "getProducts.jsp";
	}
	
	@RequestMapping("/updateProduct")
	public String updateProduct() {
		return "updateProduct.jsp";
	}
	
	@RequestMapping("/saveUpdateProduct")
	public String saveUpdateProduct(@RequestParam("image") MultipartFile multipartFile,@RequestParam("productId") int pid ,@RequestParam("path") String pathOfImg ,@RequestParam("productName") String pName,@RequestParam("productPrice") String pPrice,Sales sales,HttpServletRequest request) throws IOException {
		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        String ext = request.getSession().getServletContext().getRealPath("/Pics/");
        
        String filePath = ext + fileName;
        
        //delete the old file
        File del = new File(pathOfImg);
        del.delete();
        
        File dest = new File(filePath);
        //check destination exists, if not create it
       
        try { 
        	multipartFile.transferTo(dest); 
        	
        }
        catch (IllegalStateException e) 
        { 
            e.printStackTrace();
        }
        
       service.updateProduct(pid,pName,pPrice,filePath);
        
		return "admin_home.jsp";
	}
	
	@RequestMapping("/deletePicture/{id}")
	public String path(@PathVariable("id") int id) {
		System.out.println(id);
		service.deleteOnePicture(id);
		return "/updateProduct";
		
	}
	
	@RequestMapping("/customer_home")
	public String customer_home(Principal principal,Model model) {
		model.addAttribute("username",principal.getName());
		return "customer_home.jsp";
	}
	
	@RequestMapping("/myCart")
	public String myCart(Principal principal,Model model) {
		model.addAttribute("username",principal.getName());
		return "myCart.jsp";
	}
	
	@RequestMapping("/payment")
	public String payment(Principal principal,Model model) {
		model.addAttribute("username",principal.getName());
		return "payment.jsp";
	}
	
	@RequestMapping("/payment_process")
	public String payment_process() {
		return "payment_process.jsp";
	}
	
	@RequestMapping("/payment_success")
	public String payment_success(Principal principal,Model model) throws MessagingException {
		model.addAttribute("username",principal.getName());
		service.sendEmail();
		return "payment_success.jsp";
	}
	
	@RequestMapping("/customerLogout")
	public String customerLogout() {
		service.cleanCart();
		return "customerLogin.jsp";
	}
	
	@RequestMapping("/goToHome")
	public String goToHome(Principal principal,Model model) {
		model.addAttribute("username",principal.getName());
		service.cleanCart();
		return "customer_home.jsp";
	}
	
	@RequestMapping(value = "/pdfGenerate", produces = MediaType.APPLICATION_PDF_VALUE)
	public ResponseEntity<InputStreamResource> studentReport() throws IOException {
		
		List<Cart> details = service.getCartDetails();
		
		int total = service.getTotal();
		
		int quantity = service.getQuantity();
		
		ByteArrayInputStream bis = GeneratePDF.studentReport(quantity,total,details);
		
		HttpHeaders headers = new HttpHeaders();

		headers.add("Content-Disposition", "attachment;filename=Receipt.pdf");
		
		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_PDF)
				.body(new InputStreamResource(bis));
	}
}
