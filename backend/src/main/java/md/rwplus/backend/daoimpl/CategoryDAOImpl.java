package md.rwplus.backend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import md.rwplus.backend.model.Category;
import md.rwplus.backend.service.CategoryDAO;

@Repository("categoryDAO")  // chemam metodele din interfata folosind aceasta notatie
@Transactional // trebuie sa fie aici deoarece sunt si alte metode de prelucare cum ar fi delete update
@Service("categoryDAO") // hold business logic and call method in repository layer(CategoryDAO interfata)
//@Component
public class CategoryDAOImpl implements CategoryDAO {
 
	// add static resources in meniu sidebar  //work
/*	private static List<Category> categories = new ArrayList<>();
	
	static{
		Category category = new Category();
		category.setId(1);
		category.setName("Pizza");
		category.setDescription("description for pizza");
		category.setImageURL("cat1.png");
		categories.add(category);
		
	    category = new Category();
		category.setId(2);
		category.setName("Salate");
		category.setDescription("description for salates");
		category.setImageURL("cat2.png");
		categories.add(category);
		
	    category = new Category();
		category.setId(3);
		category.setName("Meat");
		category.setDescription("description for meat");
		category.setImageURL("cat3.png");
		categories.add(category);
	}
	@Override
	public Category get(int id) {
		//enchange for
		for(Category category : categories){
			if(category.getId() == id) return category;
		}
		
		return null;
	}
	@Override
	public List<Category> list() {
		
		return categories;
	}

	@Override
	public boolean add(Category category) {
// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Category category) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Category category) {
		// TODO Auto-generated method stub
		return false;
	}
   
	
}
	*/
	
	
	// @Qualifier("sessionFactory") // The @Qualifier annotation along with @Autowired can be used to remove the confusion by specifiying which exact bean will be wired.
	@Autowired
	private SessionFactory  sessionFactory;

	@Override
	public List<Category> list() {
	     //Deja e Hibernate unde Category este marcata ca entity in Category.java 
		//
		String selectActiveCategory = "FROM Category WHERE active = :active";
		 
		//Query de la hibernate care am implementato
		//facem acest query sa vedem care este :activ
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);
		
		query.setParameter("active", true);
		
		return query.getResultList();
	}

	
	 // getting a single category based on ID
	 
	@Override
	public Category get(int id) {

		return sessionFactory.getCurrentSession().get(Category.class, Integer.valueOf(id));
	}

	@Override

	public boolean add(Category category) {
		try {
			// add the category to the database table
			sessionFactory.getCurrentSession().persist(category);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	
	 // updating a single category
	 
	@Override
	public boolean update(Category category) {
		try {
			// update the category to the database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	
	 // delete a single category
	 
	@Override
	public boolean delete(Category category) {
		category.setActive(false);
		try {
			// delete the category to the database table
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
//resolved