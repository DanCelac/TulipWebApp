package md.rwplus.frontend.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import md.rwplus.backend.model.Category;
import md.rwplus.backend.model.Product;
import md.rwplus.backend.service.CategoryDAO;
import md.rwplus.backend.service.ProductDAO;
import md.rwplus.frontend.util.FileUploadUtility;
import md.rwplus.frontend.validator.ProductValidator;

@Controller
@RequestMapping("/manage")
public class ManagementController {

	

	@Autowired
	private ProductDAO productDAO;
		
	
	@Autowired
	private CategoryDAO categoryDAO;	
	
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class); //just for developer purpose

	@RequestMapping(value="/products", method = RequestMethod.GET)
	public ModelAndView showManageProducts(@RequestParam(name="operation",required=false)String operation) {	
		/*@RequestParam(name="success",required=false)String success*/
		ModelAndView mv = new ModelAndView("page");			
		mv.addObject("userClickManageProducts",true);
		mv.addObject("title","Manage Products");
		
		Product nProduct = new Product();
		
		// assuming that the user is ADMIN
		// later we will fixed it based on user is SUPPLIER or ADMIN
		nProduct.setSupplierId(1);
		nProduct.setActive(true);

 		mv.addObject("product", nProduct);

		
		if(operation != null) {
			if(operation.equals("product")){
				mv.addObject("message", "Product submitted successfully!");
			}	
			/*else if (operation.equals("category")) {
				mv.addObject("message", "Category submitted successfully!");
			}*/
		}
			
		return mv;
		
	}

	
	//handling product submision
	@RequestMapping(value="/products", method = RequestMethod.POST)
	public String handleProductSubmission(@Valid @ModelAttribute("product") Product mProduct, 
			BindingResult results, Model model, HttpServletRequest request){ 
		//first bindingResult then Model, this is important
		//BindingResult is used for validation.., and to pass any date use Model
		//HttpServletRequest request pentru a afla calea cea reala
		
	
				
		new ProductValidator().validate(mProduct, results);

		//check if there are any error
		if(results.hasErrors()){
			
			model.addAttribute("userClickManageProducts", true);
			model.addAttribute("title", "Manage Products");
			model.addAttribute("message", "Validation failed for Product Submission !");
			
			return "page";
		}
		
		
		
		logger.info(mProduct.toString());
		
		//create a new product record
		productDAO.add(mProduct);
		
	/*	if(mProduct.getId() == 0 ) {
			productDAO.add(mProduct);
		}
		else {
			productDAO.update(mProduct);
		}*/
	
		 //upload the file
		 if(!mProduct.getFile().getOriginalFilename().equals("") ){
			FileUploadUtility.uploadFile(request, mProduct.getFile(), mProduct.getCode()); 
		 } 
		
		
		return "redirect:/manage/products?operation=product";
	}
	
	
	
/*	@RequestMapping("/{id}/product")
	public ModelAndView manageProductEdit(@PathVariable int id) {		

		ModelAndView mv = new ModelAndView("page");	
		mv.addObject("title","Product Management");		
		mv.addObject("userClickManageProduct",true);
		
		// Product nProduct = new Product();		
		mv.addObject("product", productDAO.get(id));

			
		return mv;
		
	}*/
	
	
	/*@RequestMapping(value = "/products", method=RequestMethod.POST)
	public String managePostProduct(@Valid @ModelAttribute("product") Product mProduct, 
			BindingResult results, Model model, HttpServletRequest request) {
		
		// mandatory file upload check
		if(mProduct.getId() == 0) {
			new ProductValidator().validate(mProduct, results);
		}
		else {
			// edit check only when the file has been selected
			if(!mProduct.getFile().getOriginalFilename().equals("")) {
				new ProductValidator().validate(mProduct, results);
			}			
		}
		
		if(results.hasErrors()) {
			model.addAttribute("message", "Validation fails for adding the product!");
			model.addAttribute("userClickManageProduct",true);
			return "page";
		}			

		
		if(mProduct.getId() == 0 ) {
			productDAO.add(mProduct);
		}
		else {
			productDAO.update(mProduct);
		}
	
		 //upload the file
		 if(!mProduct.getFile().getOriginalFilename().equals("") ){
			FileUtil.uploadFile(request, mProduct.getFile(), mProduct.getCode()); 
		 }
		
		return "redirect:/manage/product?success=product";
	}
 */
	
	@RequestMapping(value = "/product/{id}/activation", method=RequestMethod.POST)
	@ResponseBody
	public String handleProductActivation(@PathVariable int id) {		
		//is going to fetch the product from the database
		Product product = productDAO.get(id);
		boolean isActive = product.isActive();
		// activating and deactivating based on the value of active field
		product.setActive(!isActive); 
		//updating the product
		productDAO.update(product);		
		return (isActive)? "Product is disabled ! with Id = " + product.getId() : 
			               "Product is Activated Successfully with Id = " + product.getId();
	}
			
/*
	@RequestMapping(value = "/category", method=RequestMethod.POST)
	public String managePostCategory(@ModelAttribute("category") Category mCategory, HttpServletRequest request) {					
		categoryDAO.add(mCategory);		
		return "redirect:" + request.getHeader("Referer") + "?success=category";
	}*/
			
	
	//returning categories for all the request mapping
	@ModelAttribute("categories") 
	public List<Category> getCategories() {
		return categoryDAO.list();
	}
	
	/*@ModelAttribute("category")
	public Category modelCategory() {
		return new Category();
	}
	*/
	
}

	
