package md.rwplus.backend.service;

import java.util.List;

import md.rwplus.backend.model.Cart;
import md.rwplus.backend.model.CartLine;

public interface CartLineDAO {

	
	public CartLine get(int id);	
	public boolean add(CartLine cartLine);
	public boolean update(CartLine cartLine);
	public boolean delete(CartLine cartLine);
	public List<CartLine> list(int cartId);
	
	//other bissnes method related to the cart lines
	// fetch the CartLine based on cartId and productId
	public CartLine getByCartAndProduct(int cartId, int productId);		
		
	// updating the cart
	boolean updateCart(Cart cart);
	
	// list of available cartLine
	public List<CartLine> listAvailable(int cartId);
	
	// adding order details
	//boolean addOrderDetail(OrderDetail orderDetail);
}
