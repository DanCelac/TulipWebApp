package md.rwplus.frontend.model;

import java.io.Serializable;

import md.rwplus.backend.model.Address;
import md.rwplus.backend.model.User;

public class RegisterModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L; //fara acesta implementare va da eroare 

	
	private User user;
	private Address billing;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Address getBilling() {
		return billing;
	}
	public void setBilling(Address billing) {
		this.billing = billing;
	}
		
}
 