package md.rwplus.backend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import md.rwplus.backend.model.Category;
import md.rwplus.backend.service.CategoryDAO;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;

	private static CategoryDAO categoryDAO;

	private static Category category;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("md.rwplus.backend");
		context.refresh();
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
	}

	/*
	 * @Test public void testAddCategory(){
	 * 
	 * category = new Category();
	 * 
	 * category.setName("Salate");
	 * category.setDescription("This is some description for Salate");
	 * category.setImageURL("CAT_1.png");
	 * 
	 * assertEquals("Successfully added a category insed the table", true,
	 * categoryDAO.add(category));
	 * 
	 * }
	 */

	/*
	 * @Test //get category if fetch with Pizza public void testGetCategory(){
	 * 
	 * category = categoryDAO.get(1);
	 * assertEquals("Successfully fetch a single category from the table",
	 * "Pizza", category.getName());
	 * 
	 * }
	 */

	/*
	 * @Test public void testUpdateCategory(){
	 * 
	 * category = categoryDAO.get(2);
	 * category.setName("Salate was update in Salata");
	 * assertEquals("Successfully update a single category in the table", true,
	 * categoryDAO.update(category));
	 * 
	 * }
	 */

	/*
	 * @Test public void testUpdateCategory(){
	 * 
	 * category = categoryDAO.get(2);
	  category.setName("Salate was update in Salata");
	  assertEquals("Successfully update a single category in the table", true, categoryDAO.update(category));
	  
	  }
	 */
	/*
	 * @Test public void testDeleteCategory(){
	 * 
	 * category = categoryDAO.get(2);
	 * assertEquals("Successfully deleted a single category in the table", true, categoryDAO.delete(category));
	 * 
	 * }
	 */

	/*
	 * @Test public void testListCategory(){
	 * 
	 * //1 deoarece ne asteptam sa gaseasca in tabele doar o categorie cu true
	 * assertEquals("Successfully fetched the listof categories from the table",1, categoryDAO.list().size());
	 * 
	 * }
	 */

	// test all the method in a single method
	@Test
	public void testCRUDCategory() {
		// add operation
		category = new Category();

		category.setName("Salate");
		category.setDescription("This is some description for Salate");
		category.setImageURL("CAT_1.png");

		assertEquals("Successfully added a category insed the table", true, categoryDAO.add(category));

		category = new Category();

		category.setName("Pizza");
		category.setDescription("This is some description for Pizza");
		category.setImageURL("CAT_2.png");

		assertEquals("Successfully added a category insed the table", true, categoryDAO.add(category));
		
		//update
		  category = categoryDAO.get(2);
		  category.setName("Salate was update in Salata");
		  assertEquals("Successfully update a single category in the table", true, categoryDAO.update(category));
		  
		  
		  //delete category
		   category = categoryDAO.get(2);
		 assertEquals("Successfully deleted a single category in the table", true, categoryDAO.delete(category));
		 
		 //fetch the list
		  assertEquals("Successfully fetched the listof categories from the table",1, categoryDAO.list().size());
		 

	}

}
