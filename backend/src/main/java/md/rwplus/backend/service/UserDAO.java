package md.rwplus.backend.service;

import java.util.List;

import md.rwplus.backend.model.Address;
import md.rwplus.backend.model.Cart;
import md.rwplus.backend.model.User;

public interface UserDAO {
	
	    //get the user by email or id
	    User getByEmail(String email);
		User get(int id);
		
        //add an user
		boolean addUser(User user);
					
		// add an address
		boolean addAddress(Address address);
		
		//get the address by Id
		Address getAddress(int addressId);
	
		//update the address
		boolean updateAddress(Address address);
		
		//get Billing address from User
	    Address getBillingAddress(User user);
	    
	    //List of address from user
		List<Address> listShippingAddresses(User user);
		
		
	      //by userId
		Address getBillingAddress(int userId);
		List<Address> listShippingAddresses(int userId);
       
}
