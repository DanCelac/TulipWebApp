<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>  

<div class = "container">

	<!-- Breadcrumb -->
	<div class="row">
		
		<div class="col-xs-12">
		
			
			<ol class="breadcrumb">
			
				<li><a href="${contextRoot}/home"> Home /</a></li>
				<li><a href="${contextRoot}/show/all/products"> Products / </a></li>
				<li class="active"> ${product.name}</li>
			
			</ol>
		
		
		</div>
	
	
	</div>
	
	
	<div class="row">
	
		<!-- Display the product image -->
		<div class="col-xs-12 col-sm-3"> <!-- distanta dintre imagine si pardea dreapta -->
		
			<div class="thumbnail">
							
			<%-- 	<img src="${assets/image}/${product.code}.jpg" class="img img-responsive"/>  --%>
				<img src="${pageContext.request.contextPath}/assets/image/${product.code}.jpg" class="img img-fluid"  style="width:250px; height:250px;"/>
				                                                          <!--boot 3 img=responside, boot 4 img-fluid -->
				                                                          <!-- style="width:250px; height:250px; -->
						
			</div>
		
		</div>
	
		
		<!-- Display the product description -->	
		<div class="col-xs-12 col-sm-8">
		
			<h3>${product.name}</h3>
			<hr/>
			
			<p>${product.description}</p>
			<hr/>
			
			<h4>Price: <strong>  ${product.unitPrice} Lei</strong></h4>
			<hr/>

			
			  <security:authorize access="hasAuthority('USER')">

				<a href="${contextRoot}/cart/add/${product.id}/product" class="btn btn-success">
				<span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</a>
				
				<%-- <a href="${contextRoot}/show/all/products/${product.id}/product" class="btn btn-primary"> Back</a> --%>
				<a href="${contextRoot}/show/all/products" class="btn btn-primary"> Back</a>
			
			  <hr/>
			 </security:authorize>	
			  <security:authorize access="hasAuthority('ADMIN')">
			   
			     <a href="${contextRoot}/manage/${product.id}/product" class="btn btn-warning">
				<span class="glyphicon glyphicon-pencil"></span> Edit</a>
			   
			   <a href="${contextRoot}/show/all/products/${product.id}/product" class="btn btn-primary"> Back</a>
			   <hr/>
			  </security:authorize>

		</div>

	
	</div>

</div>