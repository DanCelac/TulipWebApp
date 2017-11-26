package md.rwplus.frontend.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import md.rwplus.backend.model.Product;

public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) 
	{
		
		return Product.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) 
	{
		Product product = (Product) target;
		//wether file has been selected or not 
		if(product.getFile() == null || 
				product.getFile().getOriginalFilename().equals("")) {
			errors.rejectValue("file", null, "Please select a file to upload!");
			                 //validation for file in java class, not provide any error code null
			return;
		}
		if(! (
				product.getFile().getContentType().equals("image/jpeg") || 
				product.getFile().getContentType().equals("image/png") ||
				product.getFile().getContentType().equals("image/gif")
			 ))
			{
				errors.rejectValue("file", null, "Please use only image file for upload!");
				return;	
			}

	}
		


}


