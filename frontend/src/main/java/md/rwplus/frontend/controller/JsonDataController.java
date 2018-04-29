package md.rwplus.frontend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import md.rwplus.backend.model.Category;
import md.rwplus.backend.model.Product;
import md.rwplus.backend.service.CategoryDAO;
import md.rwplus.backend.service.ProductDAO;

@Controller
@RequestMapping("/json/data")
public class JsonDataController {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	

	//get the category active
	@RequestMapping("/all/category")
	@ResponseBody //va fi returnat in format Json
	public List<Category> getActiveCategories() {
		
		return categoryDAO.listActiveCategory();		
	}
	
	//all category for admin
	@RequestMapping("/admin/all/category")
	@ResponseBody
	public List<Category> getAllCategoryForAdmin () {		
		return categoryDAO.list();
				
	}
	
	/*@RequestMapping("/admin/all/command")
	@ResponseBody
	public List<Object> getAllCommandForAdmin () {		
		return productDAO.listCommand();
				
	}
	*/
	
	@RequestMapping("/all/products")
	@ResponseBody //va fi returnat in format Json
	public List<Product> getAllProducts() {
		
		return productDAO.listActiveProducts();
				
	}
	
	@RequestMapping("/admin/all/products")
	@ResponseBody
	public List<Product> getAllProductsForAdmin () {		
		return productDAO.list();
				
	}	
	
	@RequestMapping("/category/{id}/products")
	@ResponseBody
	public List<Product> getProductsByCategory(@PathVariable int id) {
		
		return productDAO.listActiveProductsByCategory(id);
				
	}
	
	
	@RequestMapping("/mv/products")
	@ResponseBody
	public List<Product> getMostViewedProducts() {		
		return productDAO.getProductsByParam("views", 3);				
	}
		
	@RequestMapping("/mp/products")
	@ResponseBody
	public List<Product> getMostPurchasedProducts() {		
		return productDAO.getProductsByParam("purchases", 3);				
	}
	
	
	
	
}
