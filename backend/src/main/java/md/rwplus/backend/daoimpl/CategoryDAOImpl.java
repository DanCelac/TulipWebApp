package md.rwplus.backend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import md.rwplus.backend.dao.CategoryDAO;
import md.rwplus.backend.dto.Category;

@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {
	
	private static List<Category> categories = new ArrayList<>();
	
	static{
		Category category = new Category();
	
		//adding first category
		category.setId(1);
		category.setName("Pizza");
		category.setDescription("This is some description for Pizza");
		category.setImageURL("CAT_1.png");
		
		categories.add(category);
		
		//adding second category
         category = new Category();
		
		category.setId(2);
		category.setName("Salads");
		category.setDescription("This is some description for Salads");
		category.setImageURL("CAT_1.png");
		
		categories.add(category);
		
		//adding third category
        category = new Category();
		
		category.setId(3);
		category.setName("Meat");
		category.setDescription("This is some description for Meat");
		category.setImageURL("CAT_1.png");
		
		categories.add(category);
	}

	@Override
	public List<Category> list() {
		// TODO Auto-generated method stub
		return null;
	}
  
}
