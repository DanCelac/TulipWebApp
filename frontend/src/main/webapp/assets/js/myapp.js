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
	$('#toggle-two').bootstrapToggle({
	on : 'Enabled',
		off : 'Disabled'
	});
 
   //-------------
   $('.switch input[type="checkbox"]').on('change' , function() {							
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
									   bootbox.alert({
										   size: 'medium',
										   title: 'Information',
										   message: 'You are going to performe operation on product ' + value
									   });
									   
							        }
							        else {							        	
							        	checkbox.prop('checked', !checked);
							        }
						    	}
								
							});			
                       }); 							
									
}); //end function



