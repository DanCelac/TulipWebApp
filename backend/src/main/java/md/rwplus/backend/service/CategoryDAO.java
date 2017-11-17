package md.rwplus.backend.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import md.rwplus.backend.model.Category;


public interface CategoryDAO {
	
	Category get(int id);
	List<Category> list ();
	boolean add(Category category);
	boolean update(Category category);
	boolean delete(Category category);
	
   
}
 