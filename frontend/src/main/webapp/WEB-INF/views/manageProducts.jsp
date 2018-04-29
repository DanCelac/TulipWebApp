
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  

<div class="container">
	<div class="row">

		<!--  Show message if product was added successfully -->
		<c:if test="${not empty message}">

			<div class="col-lg-12">

				<div class="alert alert-success alert-dismisible">
					<!-- alert-dismisable for display message in top of page, alert-success that is color -->

					<button type="button" class="close" data-dismiss="alert">&times;</button>

					${message}

				</div>

			</div>

		</c:if>


		<div class="mx-auto col-md-8">
			<!-- boot 3  col-md-offset-2  boot 4 = mx-auto, for display in the middle of page -->

			<div class="card text-center text-white bg-secondary mb-3">
				<!--  bootstrap 3= panel, boot 4 = card -->

				<div class="card-header ">
					<h4>Product Management</h4>
				</div>

				<div class="card-body">
					<!--Form Elements  -->
					<!-- modelAtribute pentru a face legatura cu Controlerul , convertim sa fie ca un spring element -->
					<sf:form class="form-horizontal" modelAttribute="product"
						action="${contextRoot}/manage/products" method="POST"
						enctype="multipart/form-data">

						<div class="form-group">
							<label class="control-label col-md-4" for="name">Enter
								Product Name: </label>
							<div class="mx-auto col-md-8">
								<!-- path=name cimpul declarat in clasa product care este name -->
								<sf:input type="text" path="name" id="name"
									placeholder="Product Name" class="form-control" />
								<sf:errors path="name" cssClass="help-block" element="em" />
								<!--   <em class="help-block" style="color: #ff0000;">Please enter Product Name !</em> -->
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="description">Product
								description: </label>
							<div class="mx-auto col-md-8">
								<sf:textarea type="text" path="description" id="description"
									rows="4" placeholder="Enter your description here!"
									class="form-control" />
								<sf:errors path="description" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="unitPrice">Enter
								Unit Price : </label>
							<div class="mx-auto col-md-8">
								<sf:input type="number" path="unitPrice" id="unitPrice"
									placeholder="Unit Price in Lei" class="form-control" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em" />
							</div>
						</div>

						<!-- File element for image upload -->
						<div class="form-group">
							<label class="control-label mx-auto col-md-4" for="file">Select
								an Image: </label>
							<div class="mx-auto col-md-8">
								<sf:input type="file" path="file" id="file" class="form-control" />
								<sf:errors path="file" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="categoryId">Select
								Category: </label>
							<div class=" mx-auto col-md-8">
								<sf:select class="form-control" id="categoryId"
									path="categoryId" 
									items="${categories}" 
									itemLabel="name"
									itemValue="id" 
									/>
									<c:if test="${product.id == 0 }">
									  <div class="text-right">
									   <br/>
									   <button type="button" data-toggle="modal" data-target="#myCategoryModal" class="btn btn-warning btn-sm">Add Category</button>
								    	</div>
									</c:if>
									
								<sf:errors path="categoryId" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<div class="mx-auto col-md-2 ">
								<input type="submit" name="submit" id="submit"
									class="form-control" value="Submit"  class="btn btn-primary" />

								<!--Hidden fields for products  -->
								<sf:hidden path="id" />
								<!--vom folosi acesta forma si pentru editare pentru a nu incurca cu datele introduse si sa pastram originalul datele vor fi puse hidden  -->
								<sf:hidden path="code" />
								<sf:hidden path="supplierId" />
								<sf:hidden path="active" />
								<sf:hidden path="purchases" />
								<sf:hidden path="views" />
							</div>
						</div>
					</sf:form>
				</div>
				<!--End CardBody  -->

			</div>
			<!-- End Card -->

		</div>

	</div>
	<!--End row  -->
<!-- Command products -->
   <div class="row">
		<div class='col-lg-12'>
			<h3>Command</h3>
			<hr />
		</div>
 
		<div class='col-lg-12'>
			<div style="overflow: auto">

				<!-- Products table for Admin -->
		
				<table id="adminCommnandTable"
					class="table table-striped table-bordered">

					<thead>
						<tr>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Contact</th>
							<th>Address</th>
							<th>Name Product</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Total Price</th>
							<th>Data</th>
							
						</tr>
					</thead>
    	            <tbody>
				        <%--   <c:forEach var="command" items="${listCommandManagement.rows}">
				                <tr>
				                    <td><c:out value="${command.first_name}" /></td>
				                    <td><c:out value="${command.last_name}" /></td>
				                    <td><c:out value="${command.contact_number}" /></td>
				                    <td><c:out value="${command.address_line_one}" /></td>
				                    <td><c:out value="${command.name}" /></td>
				                    <td><c:out value="${command.unit_price}" /></td>
				                    <td><c:out value="${command.product_count}" /></td>
				                    <td><c:out value="${command.total}" /></td>
				                    <td><c:out value="${command.order_date}" /></td>
				                </tr>
				            </c:forEach> --%>
				            
				      
						    <tr>
				           <td>Gheorghe</td>
							<td>Popa</td>
							<td>131313</td>
							<td>str. Vasile Lupu 2/4</td>
							<td>Meat</td>
							<td>50.0 Lei</td>
							<td>1</td>
							<td>50.0 Lei</td>
							<td>2018-04-29 20:49:49</td>
						  </tr>
						   <tr>
				           <td>Gheorghe</td>
							<td>Popa</td>
							<td>131313</td>
							<td>str. Vasile Lupu 2/4</td>
							<td>Salad Gurman</td>
							<td>35.0 Lei</td>
							<td>1</td>
							<td>35.0 Lei</td>
							<td>2018-04-29 20:49:49</td>
						  </tr>
						  						
						   <tr>
				           <td>Gheorghe</td>
							<td>Popa</td>
							<td>131313</td>
							<td>str. Vasile Lupu 2/4</td>
							<td>Garniture</td>
							<td>20.0 Lei</td>
							<td>1</td>
							<td>20.0 Lei</td>
							<td>2018-04-29 20:49:49</td>
						  </tr>
						     <tr>
				           <td>Hristiniuc</td>
							<td>Iom</td>
							<td>079187766</td>
							<td>str.Lupu 19/1</td>
							<td>Pizza Forte</td>
							<td>60.0 Lei</td>
							<td>6</td>
							<td>360.0 lei</td>
							<td>2018-04-24 18:20:44 </td>
						  </tr>

				            
                       </tbody>
		 
		 
		 
		 
		 
		 			<tfoot>
						<tr>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Contact</th>
							<th>Address</th>
							<th>Name Product</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Total Price</th>
							<th>Data</th>
						</tr>
					</tfoot>
				</table>
				
			</div>
		</div>
	</div>

	

 <!-- For available product management -->
	<div class="row">
		<div class='col-lg-12'>
			<h3>Available Products</h3>
			<hr />
		</div>
 
		<div class='col-lg-12'>
			<div style="overflow: auto">

				<!-- Products table for Admin -->
				<table id="adminProductsTable"
					class="table table-striped table-bordered">

					<thead>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<!-- Image -->
							<th>Name</th>
							<th>Unit Price</th>
							<th>Activate</th>
							<th>Edit</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Id</th>
							<th>&#160;</th>
							<!-- Image -->
							<th>Name</th>
							<th>Unit Price</th>
							<th>Activate</th>
							<th>Edit</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<!-- end Row for available products-->
	
	
	<hr/>
	 <!-- For categoty name  management -->
	 	<div class="row">
		<div class='col-lg-12'>
			<h3>Management Category</h3>
			<hr />
		</div>
 
		<div class='col-lg-12'>
			<div style="overflow: auto">

				<!-- Products table for Admin -->
				<table id="adminCategoryTable"
					class="table table-striped table-bordered">

					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Description</th>
							<th>Activate</th>
							<!-- <th>Edit</th> -->
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Description</th>
							<th>Activate</th>
							<!-- <th>Edit</th> -->
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	 <!-- end row for category -->
	
	


    <div class="modal fade" id="myCategoryModal" role="dialog" tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                   
                   <button  type="button" class="close" data-dismiss="modal">
                      <span>&times;</span>
                   </button>
                   <h4 class="modal-title">Add New Category</h4>
  
                </div> 
                
                <div class="modal-body">
                   <!-- Category Form -->
                   <sf:form id="categoryForm" modelAttribute="category" action="${contextRoot}/manage/category" 
                   method="POST" class="form-horizontal">
                      
                      <div class="form-group">
                          <label for="category_name" class="control-label col-md-4">Category Name</label>
                            <div class="col-md-8">
                                <sf:input type="text" path="name" id="category_name" class="form-control"/>
                            </div>
                      </div>
                      <div class="form-group">
                          <label for="category_description" class="control-label col-md-4">Category Description</label>
                            <div class="col-md-8">
                                <sf:textarea cols="" rows="5" path="description" id="category_description" class="form-control"/>
                            </div>
                      </div>
                      <div class="form-group">
                         
                            <div class="col-md-offset-4 col-md-8">
                                <input type="submit" value="Add Category" class="btn btn-primary"/>
                            </div>
                      </div>
                   
                   
                   </sf:form>
                
                </div>
                
            </div>
        </div>
    </div>

</div>
<!-- end Container -->