package md.rwplus.frontend.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import md.rwplus.backend.model.Category;
import md.rwplus.backend.model.Product;
import md.rwplus.backend.service.CategoryDAO;
import md.rwplus.backend.service.ProductDAO;
import md.rwplus.frontend.exception.CategoryNotFoundException;
import md.rwplus.frontend.exception.ProductNotFoundException;

@Controller

public class PageController {

	private static final Logger logger = LoggerFactory.getLogger(PageController.class);

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private ProductDAO productDAO;

	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Home");
		
		logger.info("Inside PageController index method - INFO");
		logger.debug("Inside PageController index method - DEBUG");

		// passing the list of category
		mv.addObject("categories", categoryDAO.list()); // da eroare null
														// pointer exception
														// daca pun Qualifier

		mv.addObject("userClickHome", true);
		return mv;
	}

	@RequestMapping(value = "/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "About Us");
		mv.addObject("userClickAbout", true);
		return mv;
	}

	@RequestMapping(value = "/contact")
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Contact Us");
		mv.addObject("userClickContact", true);
		return mv;
	}

	
	// * Method to load all the products and based on category

	@RequestMapping(value = { "/show/all/products" })
	public ModelAndView showAllProducts() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "All Products");

		// passing the list of category
		mv.addObject("categories", categoryDAO.list());

		mv.addObject("userClickAllProducts", true);
		return mv;
	}

	
	//manage the products 
	@RequestMapping(value = "/show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("page");

		// categoryDAO to fecth a single category
		Category category = null;
		category = categoryDAO.get(id);
		mv.addObject("title", category.getName());

		// passing the list of category
		mv.addObject("categories", categoryDAO.list());

		// passing the single category object
		mv.addObject("category", category);

		mv.addObject("userClickCategoryProducts", true);
		return mv;
	}
	


	/*
	 * Viewing a single product, and handle exception
	 */
   
	@RequestMapping(value = "/show/{id}/product")
	public ModelAndView showSingleProduct(@PathVariable int id)   throws ProductNotFoundException	{			

		ModelAndView mv = new ModelAndView("page");

		Product product = productDAO.get(id);

		if(product == null) throw new ProductNotFoundException();

		// update the view count
		product.setViews(product.getViews() + 1);
		productDAO.update(product);
		// ---------------------------

		mv.addObject("title", product.getName());
		mv.addObject("product", product);

		mv.addObject("userClickShowProduct", true);

		return mv;
	}
	
	/*
	 * Viewing category, and handle exception
	 */
   
/*	@RequestMapping(value = "/show/{id}/category")
	public ModelAndView showCategory (@PathVariable int id) throws CategoryNotFoundException	{			

		ModelAndView mv = new ModelAndView("page");
		Category category = categoryDAO.get(id);
		if(category == null) throw new CategoryNotFoundException();
		// ------------------------------------------------------
		mv.addObject("title", category.getName());
		mv.addObject("category", category);
		mv.addObject("userClickShowProduct", true);

		return mv;
	}*/
	
	
	@RequestMapping(value = "/register")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "About Us");
		return mv;
	}
	

	/*
	 * Login
	 */
	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam(name="error", required = false) String error,
			@RequestParam(name="logout", required = false) String logout) {
		ModelAndView mv = new ModelAndView("login"); //vom face o pagina aparte login
		
		if(error!=null){ //error String!= null
			mv.addObject("message", "Invalid Email and Password !");
		}
		
		if(logout!=null){ //error String!= null
			mv.addObject("logout", "User has successfully logged out !");
		}
		
		mv.addObject("title", "Login");
		return mv;
	}
	
	/*
	 * access denied page
	 */
	@RequestMapping(value = "/access-denied")
	public ModelAndView accessDenied() {
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("title", "403 - Access Denied");
		mv.addObject("errorTitle", "Aha! Caught you! This error was handler by Dan Celac");
		mv.addObject("errorDescription", "You are not authorized to view this page !");
		return mv;
	}
	
	/*
	 * Logout
	 */
	@RequestMapping(value = "/perform-logout")
	public String logout(HttpServletRequest request, HttpServletResponse response){
	     //first we are going to fetch the authenfication object 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){  //if user is authenficated  
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
		
		return "redirect:/login?logout"; 
	}
}
