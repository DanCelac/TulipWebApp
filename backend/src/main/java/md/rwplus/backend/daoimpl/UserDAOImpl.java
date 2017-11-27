package md.rwplus.backend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import md.rwplus.backend.model.Address;
import md.rwplus.backend.model.Cart;
import md.rwplus.backend.model.User;
import md.rwplus.backend.service.UserDAO;

@Repository("userDAO")
@Transactional
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean addUser(User user) {
		try {			
			sessionFactory.getCurrentSession().persist(user);			
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	

	@Override
	public boolean addAddress(Address address) {
		try {			
			// will look for this code later and why we need to change it
			sessionFactory.getCurrentSession().persist(address);			
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}



	@Override
	public boolean updateCart(Cart cart) {
		try {			
			// will look for this code later and why we need to change it
			sessionFactory.getCurrentSession().update(cart);			
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	
	@Override
	public User getByEmail(String email) {
		String selectQuery = "FROM User WHERE email = :email"; //daca la clasa user la entity nu specificam ceva denumire
		try {                                                  //cind facem select vom pune numele clasei
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectQuery,User.class)
						.setParameter("email",email)
							.getSingleResult(); //pentru ca vrem sa returnam doar un single user
		}
		catch(Exception ex) {
			ex.printStackTrace();  
			return null;
		}
							
	}
	
	/*@Override
	public boolean updateAddress(Address address) {
		try {			
			sessionFactory.getCurrentSession().update(address);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}	*/
	

	@Override
	public List<Address> listShippingAddresses(User user) {
		String selectQuery = "FROM Address WHERE user = :user AND shipping = :shipping ";
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectQuery,Address.class)
						.setParameter("user", user)
				 		.setParameter("shipping", true)
							.getResultList(); //pentru ca pot fi mai multe adrese
		
	}

	@Override
	public Address getBillingAddress(User user) {
		String selectQuery = "FROM Address WHERE user = :user AND billing = :billing";
		try{
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectQuery,Address.class)
						.setParameter("user", user)
						.setParameter("billing", true)
						.getSingleResult();
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}

/*	@Override
	public User get(int id) {
		try {			
			return sessionFactory.getCurrentSession().get(User.class, id);			
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}
	}
*/
/*	@Override
	public Address getAddress(int addressId) {
		try {			
			return sessionFactory.getCurrentSession().get(Address.class, addressId);			
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}
	}*/

}