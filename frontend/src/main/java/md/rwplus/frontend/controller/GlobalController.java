package md.rwplus.frontend.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import md.rwplus.backend.model.User;
import md.rwplus.backend.service.UserDAO;
import md.rwplus.frontend.model.UserModel;

@ControllerAdvice
public class GlobalController  {
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private HttpSession session; //daca user este logat sesion este libera adaugat un user inside the sesion 
	
	private UserModel userModel = null;
	private User user = null;	
	
	
	@ModelAttribute("userModel")
	public UserModel getUserModel() {	
		
		if(session.getAttribute("userModel")==null) { //verificam daca userModel is avalable daca da il returnam, daca nu se autentifica
			// get the authentication object
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			
			
			if(!authentication.getPrincipal().equals("anonymousUser")){
				// get the user from the database
				user = userDAO.getByEmail(authentication.getName());
				
				if(user!=null) {
					// create a new Usermodel object to pass the detail
					userModel = new UserModel();
					// set the name and the id
					userModel.setId(user.getId());
					userModel.setEmail(user.getEmail());
					userModel.setRole(user.getRole());
					userModel.setFullName(user.getFirstName() + " " + user.getLastName());
				
					
					if(user.getRole().equals("USER")) {
						//set the cart only if the user is buyer
						userModel.setCart(user.getCart());					
					}				
	              //set the user Model in the session
					session.setAttribute("userModel", userModel);
					return userModel;
				}			
			}
		}
		
		return (UserModel) session.getAttribute("userModel");		
	}
		
}

