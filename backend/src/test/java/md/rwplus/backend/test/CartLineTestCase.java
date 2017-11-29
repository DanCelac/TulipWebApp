package md.rwplus.backend.test;



import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import md.rwplus.backend.model.Cart;
import md.rwplus.backend.model.CartLine;
import md.rwplus.backend.model.Product;
import md.rwplus.backend.model.User;
import md.rwplus.backend.service.CartLineDAO;
import md.rwplus.backend.service.ProductDAO;
import md.rwplus.backend.service.UserDAO;

public class CartLineTestCase {

	

	private static AnnotationConfigApplicationContext context;
	
	
	private static CartLineDAO cartLineDAO;
	private static ProductDAO productDAO;
	private static UserDAO userDAO;
	
	
	private Product product = null;
    private User user = null;
    private Cart cart = null;
	private CartLine cartLine = null;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("md.rwplus.backend");
		context.refresh();
		productDAO = (ProductDAO)context.getBean("productDAO");
		userDAO = (UserDAO)context.getBean("userDAO");
		cartLineDAO = (CartLineDAO)context.getBean("cartLineDAO");
		
	}
	
	
	@Test
	public void testAddNewCartLine() {
		
		// fetch the user and then cart of that user
		// 1 get the user  
		User user = userDAO.getByEmail("gh@mail.ru");	
		//2. fetch the cart
	     cart = user.getCart();
		
		// 3. get the product
		 product = productDAO.get(1);
		
		// 4.Create a new CartLine
		cartLine = new CartLine();
		
		cartLine.setBuyingPrice(product.getUnitPrice());
		
		cartLine.setProductCount(cartLine.getProductCount()+1); //0+1
		
		cartLine.setTotal(cartLine.getProductCount() * product.getUnitPrice()); //cite produse inmultit cu pretul
		
		cartLine.setAvailable(true);
		 
		cartLine.setCartId(cart.getId());
		
		cartLine.setProduct(product);
	   
		assertEquals("Failed to add the CartLine!",true, cartLineDAO.add(cartLine));
		
		
		//update the cart 
		cart.setGrandTotal(cart.getGrandTotal() + (cartLine.getTotal() ) );
		cart.setCartLines(cart.getCartLines() + 1);
		assertEquals("Failed to update the cart!",true, cartLineDAO.updateCart(cart));
	}
	
	
	
/*	@Test
	public void testUpdateCartLine() {

		// fetch the user and then cart of that user
		User user = userDAO.getByEmail("absr@gmail.com");		
		Cart cart = user.getCart();
				
		cartLine = cartLineDAO.getByCartAndProduct(cart.getId(), 2);
		
		cartLine.setProductCount(cartLine.getProductCount() + 1);
				
		double oldTotal = cartLine.getTotal();
				
		cartLine.setTotal(cartLine.getProduct().getUnitPrice() * cartLine.getProductCount());
		
		cart.setGrandTotal(cart.getGrandTotal() + (cartLine.getTotal() - oldTotal));
		
		assertEquals("Failed to update the CartLine!",true, cartLineDAO.update(cartLine));	

		
	}
	*/
	
	
}
