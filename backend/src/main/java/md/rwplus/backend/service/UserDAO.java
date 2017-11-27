package md.rwplus.backend.service;

import java.util.List;

import md.rwplus.backend.model.Address;
import md.rwplus.backend.model.Cart;
import md.rwplus.backend.model.User;

public interface UserDAO {
	
	// user related operation
	    User getByEmail(String email);
	//	User get(int id);
        //add an user
		boolean addUser(User user);
		// add an address
		boolean addAddress(Address address);
		//alternative
		//Address getBillingAddress(int userId);
	//	List<Address> listShippingAddresses(int userId);
		
		//update a cart
		boolean updateCart(Cart cart);
		// adding and updating a new address
		//Address getAddress(int addressId);
		//boolean addAddress(Address address);
		
		//boolean updateAddress(Address address);
	    Address getBillingAddress(User user);
		List<Address> listShippingAddresses(User user);
       
}
