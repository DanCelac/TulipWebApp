package md.rwplus.frontend.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import md.rwplus.backend.model.Address;
import md.rwplus.backend.model.Cart;
import md.rwplus.backend.model.User;
import md.rwplus.backend.service.UserDAO;
import md.rwplus.frontend.model.RegisterModel;

@Component //ca sal facem ca bin introducem @Component
public class RegisterHandler {
	
	@Autowired
	private UserDAO userDAO;
	
	public RegisterModel init(){
		
		return new RegisterModel();
	}
	
	public void addUser(RegisterModel registerModel, User user){
		registerModel.setUser(user);
	}
	
	public void addBilling(RegisterModel registerModel, Address billing){
		registerModel.setBilling(billing);
	}
	
	public String saveAll(RegisterModel model){
		String transitionValue= "success";
		
		//fetch the user
		  User user = model.getUser();
		  if(user.getRole().equals("USER")) {
		   // create a new cart
		   Cart cart = new Cart();
		   cart.setUser(user);
		   user.setCart(cart);
		  }
		   
		  // encode the password
		// user.setPassword(passwordEncoder.encode(user.getPassword()));
		  
		  // save the user
		  userDAO.addUser(user);
		  
		  // get the address
		  Address billing = model.getBilling();
		  billing.setUserId(user.getId());
		  billing.setBilling(true);  
		  
		  //save the address
		  userDAO.addAddress(billing);
	
		
		return transitionValue; 
		
	}

} 
