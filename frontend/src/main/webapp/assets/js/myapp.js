$(function(){
	//solving the active menu problem
	switch(menu){
		case 'About Us':
		    $('#about').addClass('active'); 
			break;
		case 'Contact Us':
		    $('#contact').addClass('active');
			break;
		case 'All Products':
		    $('#listProducts').addClass('active');
			break;
		case 'Manage Products':
		    $('#manageProducts').addClass('active');
			break;	
		default:
		     if(menu == "Home") break;
		    $('#listProducts').addClass('active');
			$('#a_'+menu).addClass('active');
			break;
	}
 //*******************
   //to tackle the csrf token
 var token = $('meta[name="_csrf"]').attr('content');  //content denumire care am puso in meta in page.jsp
	var header = $('meta[name="_csrf_header"]').attr('content');
	// token!=undefined && header !=undefined)&&
	if(     (token.length > 0 && header.length > 0)) {		
		// set the token header for the ajax request
		$(document).ajaxSend(function(e, xhr, options) {			
			xhr.setRequestHeader(header,token);			
		});				
	}
   //*****************
 //code for jquery dataTable

 


var $table = $('#productListTable');

//execute the below code only where we have this table
if ($table.length) {
		 //console.log('Inside the table!');
		
		var jsonUrl = '';
		if (window.categoryId == '') {
			jsonUrl = window.contextRoot +'/json/data/all/products';
		} else {
			jsonUrl = window.contextRoot +'/json/data/category/'+window.categoryId+'/products';
		}
 
		$table.DataTable({
			lengthMenu: [ [ 3, 5, 10, -1 ],
							[ '3 Records', '5 Records', '10 Records', 'ALL' ] ],
					pageLength: 5,
					ajax: {
						url: jsonUrl,	
						dataSrc: ''		//pentru a manipula datele din Json return		
						  },
					columns: [ 
					        {
								
								data: 'code',
								bSortable: false,
								
								mRender: function(data, type, row) 
								{
									if(data == '')
                                    
								return "Doesn't exist data";
									 else 
									return '<img src="'+window.contextRoot+'/assets/image/'+data+'.jpg" style="width:100px; height:100px;"/>';
												
								}
							},
							 {
								data: 'name'
								       
							 },
							 {
								data: 'description'
							 },
							 {
								data: 'unitPrice',
                                    mRender: function(data, type, row) 
									{
									return data + ' Lei'
								    }								
							 },
							 {
								data: 'id',
								bSortable: false,
								mRender: function(data, type, row) 
								{

									var str = '';
									str += '<a href="'+window.contextRoot+'/show/'+data+'/product" class="btn btn-primary"> <span class="glyphicon glyphicon-eye-open"></span> </a> &#160;';
									str += '<a href="'+window.contextRoot+'/cart/add/'+data+'/product" class="btn btn-success"> <span class="glyphicon glyphicon-shopping-cart"></span> </a>';
                                     return str;

								}

							}
							
					
					
					          ]//end columns
			
			
			
			
		 }); //end DataTable

      }//end if
	  
	  
	  //dismissing the alert after 3 second
	 var $alert = $('.alert');
	if($alert.length) {
		setTimeout(function()
		{
	    	$alert.fadeOut('slow');
	    }, 3000
		          )	
	}
	  
	//Toogle switch								
	//$('#toggle-two').bootstrapToggle({
	//on : 'Enabled',
	//	off : 'Disabled'
//	});	
   //end toogle switch  
	
 


    
	
	
	//data table for admin

var $adminProductsTable = $('#adminProductsTable');

//execute the below code only where we have this table
if ($adminProductsTable.length) {
		 //console.log('Inside the table!');
		
		var jsonUrl = window.contextRoot + '/json/data/admin/all/products';
		
 
		$adminProductsTable.DataTable({
			lengthMenu: [ [ 10, 30, 50, -1 ],
							[ '10 Records', '30 Records', '50 Records', 'ALL' ] ],
					pageLength: 30,
					ajax: {
						url: jsonUrl,	
						dataSrc: ''		//pentru a manipula datele din Json return		
						  },
					columns: [ 
					       {
					          data: 'id'
					       },
					       {
								data: 'code',
								bSortable: false,
								mRender: function(data, type, row) 
								{
									return '<img src="'+window.contextRoot+'/assets/image/'+data+'.jpg" class="adminDataTableImg"/>'; //class is for style	
								}
							},
							{
								data: 'name'
							},
							{
								data: 'unitPrice',
                                    mRender: function(data, type, row) 
									{
									return data + ' Lei' 
								    }								
							},
						    {
								data: 'active',
								bSortable: false,
								mRender: function(data, type, row) 
									{
										
                                        var str = '';
										if(data){
											str +='<label class="switch"> <input type="checkbox"  checked="checked" value="'+row.id+'"/> <div class="slider round"> </div>  </label>';
										}
										else{
											str +='<label class="switch"> <input type="checkbox"  value="'+row.id+'" /> <div class="slider round"> </div> </label>';
										}
										return str;
								    }	
                                
								
							},
							{
								data: 'id',
								bSortable: false,
								mRender: function(data, type, row) {
									
									var str = '';
									str += '<a href="'+window.contextRoot+'/manage/'+data+'/product"class="btn btn-warning">';
									str += '<span class="glyphicon glyphicon-pencil"></span> </a> &#160;';
									
									return str;
									
								}
								
							}
							
					
					
					          ],//end columns
							  ////////
							  initComplete: function () {
						    var api = this.api();
						   api.$('.switch input[type="checkbox"]').on('change' , function() {							
							var checkbox = $(this);
							var checked = checkbox.prop('checked');
							var dMsg = (checked)? 'You want to activate the Product? ': 
							                      ' You want to de-activate the Product?';
							var value = checkbox.prop('value');
						    bootbox.confirm({
								size: 'medium',
						    	title: 'Product Activation/Deactivation',
						    	message: dMsg,
								callback: function (confirmed) {
							        
									if (confirmed) {
										
							           console.log(value);
									   
									   var activationUrl = window.contextRoot + '/manage/product/'+value+'/activation';
									   
									   $.post(activationUrl, function(data){
										   bootbox.alert({
										   size: 'medium',
										   title: 'Information',
										   message: data 
									   });
									   });

							        }
							        else {							        	
							        	checkbox.prop('checked', !checked);
							        }
						    	}
								
							});			
                       }); 								
					}
							  
			///// ////////
			
			
			
			
		 }); //end DataTable

      }//end if
	

	//************
	//validation code for category
	var $categoryForm = $('#categoryForm');
  
      if($categoryForm.length) {
		
		$categoryForm.validate({			
				rules: {
					name: {
						required: true,
						minlength: 2
					},
					description: {
						required: true,
						minlength: 3					
					}				
				},
				messages: {					
					name: {
						required: 'Please add the category name!',
						minlength: 'Please enter at least two characters'
					},
					description: {
						required: 'Please add a description for this category !',
						minlength: 'Please enter at least three characters'
					}					
				},
				errorElement: 'em',
				errorPlacement: function(error, element) {
					//add the class of the help_block
				      error.addClass('help-block');
					  // add the error element after the input element 
					  error.insertAfter(element)
					//errorPlacement(error, element);
				}				
			});
		
	}//end if
	//------------------------ 
	
	
		//************
	//validation code for login form 
	var $loginForm = $('#loginForm');
  
      if($loginForm.length) {
		
		$loginForm.validate({			
				rules: {
					username: {
						required: true,
						email: true
					},
					password: {
						required: true
											
					}				
				},
				messages: {					
					username: {
						required: 'Please enter the email!',
						email: 'Please enter valid email address'
					},
					password: {
						required: 'Please enter the password !'
					
					}					
				},
				errorElement: 'em',
				errorPlacement: function(error, element) {
					//add the class of the help_block
				      error.addClass('help-block');
					  // add the error element after the input element 
					  error.insertAfter(element)
					//errorPlacement(error, element);
				}				
			});
		
	}//end if
	//------------------------
	

	
}); //end function



