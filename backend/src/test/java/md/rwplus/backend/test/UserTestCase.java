package md.rwplus.backend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import md.rwplus.backend.model.Address;
import md.rwplus.backend.model.Cart;
import md.rwplus.backend.model.User;
import md.rwplus.backend.service.UserDAO;

public class UserTestCase {

	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user = null;
	private Cart cart = null;
	private Address address = null;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("md.rwplus.backend");
		context.refresh();
		
		userDAO = (UserDAO) context.getBean("userDAO");
	}
	

	@Test
	public void testAdd() {
		
		user = new User() ;
		user.setFirstName("Hristiniuc");
		user.setLastName("Ion");
		user.setEmail("hristiniuc@gmail.com");
		user.setContactNumber("078234541");
		user.setRole("USER");
		user.setPassword("12345");
		
		
		//add the user
		assertEquals("Failed to add the user!", true, userDAO.addUser(user));	
		
		address = new Address();
		address.setAddressLineOne("str.Mihai Eminescu");
		address.setCity("Orhei");
		address.setBilling(true);
		
		//link the user with the address using userId
		address.setUserId(user.getId());
		
		// add the address
	    assertEquals("Failed to add the address!", true, userDAO.addAddress(address));
		
	    if(user.getRole().equals("USER")){
	    	
	    	//create a cart for this user
	    	cart = new Cart();
	    	
	    	cart.setUser(user);
	    	// add the cart
		    assertEquals("Failed to add the cart!", true, userDAO.addCart(cart));
	    	
	    	//add a shipping address for this user, o adresa de livrare
		    address = new Address();
			address.setAddressLineOne("str.Negruti 101");
			address.setCity("Orhei");
			//set the shipping to true
			address.setShipping(true);
			
			//link with the user
			address.setUserId(user.getId());
			// add the shipping address
		    assertEquals("Failed to add shipping address!", true, userDAO.addAddress(address));
	    }
	    
	    
	    
	    
		
		
	}//end test method
	
	

	// working for uni-directional
/*
	@Test
	public void testAddAddress() {
		user = userDAO.get(1);
		
		address = new Address();
		address.setAddressLineOne("301/B Jadoo Society, King Uncle Nagar");
		address.setAddressLineTwo("Near Store");
		address.setCity("Mumbai");
		address.setState("Maharashtra");
		address.setCountry("India");
		address.setPostalCode("400001");
				
		address.setUser(user);
		// add the address
		assertEquals("Failed to add the address!", true, userDAO.addAddress(address));	
	}
	
	@Test
	public void testUpdateCart() {
		user = userDAO.get(1);
		cart = user.getCart();
		cart.setGrandTotal(10000);
		cart.setCartLines(1);
		assertEquals("Failed to update the cart!", true, userDAO.updateCart(cart));			
	} 

*/
	

	
}
