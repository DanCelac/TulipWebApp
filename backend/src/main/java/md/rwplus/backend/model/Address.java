package md.rwplus.backend.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

//import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Address implements Serializable {

	/**
	 * 
	 */
//	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	/**************/
	@ManyToOne
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	/*************/
	
	//@NotBlank(message = "Please enter address line one!")
	@Column(name = "address_line_one")
	private String addressLineOne;
	
	//@NotBlank(message = "Please enter City!")	
	private String city;
	
	@Column(name="is_shipping")
	private boolean shipping;
	
	@Column(name="is_billing")
	private boolean billing;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddressLineOne() {
		return addressLineOne;
	}

	public void setAddressLineOne(String addressLineOne) {
		this.addressLineOne = addressLineOne;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public boolean isShipping() {
		return shipping;
	}

	public void setShipping(boolean shipping) {
		this.shipping = shipping;
	}

	public boolean isBilling() {
		return billing;
	}

	public void setBilling(boolean billing) {
		this.billing = billing;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", addressLineOne=" + addressLineOne + ", city=" + city
				+ ", shipping=" + shipping + ", billing=" + billing + "]";
	}
	

	
	
	
}
