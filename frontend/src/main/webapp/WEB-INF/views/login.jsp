<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Site for selling products">
<meta name="author" content="Celac Dan">

<title>Café Tulip - ${title}</title>

<script type="text/javascript">
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}';
</script>

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/shop-homepage.css" rel="stylesheet">

<!-- Old table css -->
<%--  <link href="${css}/dataTables.bootstrap.css" rel="stylesheet">  --%>

<!-- New Table CSS -->
 <link href="${css}/dataTables.bootstrap4.css" rel="stylesheet">  
 
 <!-- Glyphicons CSS -->
 <link href="${css}/glyphicons.css" rel="stylesheet"> 
 
  <!-- Toogle Switch -->
 <link href="${css}/bootstrap-toggle.min.css" rel="stylesheet"> 
 







</head>

<body>

	<div class="wrapper">
		
		<!-- Navigation -->
		
			<div class="navbar">
			  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			     <div class="container">
			        <div class="navbar-header">
			             <a class="navbar-brand" href="${contextRoot}/home" style="color:red;">Tulip Cafe</a> 
			        </div>
			     </div>
			  </nav>
			
		</div>  <!-- End div navbar -->

		<!-- Page Content -->
		<div class="content">
			
			<div class="container">
			       
			        <!-- this will be displayed only the user has logged out  -->
			      <c:if test="${not empty message }">
			         <div class="row">
			              <div class="mx-auto col-md-6">
			                   <div class="alert alert-danger"> ${message }</div>
			              </div>  
			         </div> 
			     </c:if>
			        <!-- this will be displayed if the password and email are wrong  -->
			      <c:if test="${not empty logout }">
			         <div class="row">
			              <div class="mx-auto col-md-6">
			                   <div class="alert alert-success"> ${logout }</div>
			              </div>  
			         </div> 
			     </c:if>
			      
			    <div class="row">
			      <div class="mx-auto col-md-6">
			           <div class="card text-center text-white bg-secondary mb-3">
				           <div class="card-header ">
					          <h4>Login</h4>
				           </div>
				            <div class="card-body">
				            
								<form action="${contextRoot}/login" method="POST"
									class="form-horizontal" id="loginForm">
									
									<div class="form-group">
										<label for="username" class="col-md-4 control-label">Email: </label>
										<div class="col-md-8">
											<input type="text" name="username" id="username"
												       class="form-control" />
										</div>
									</div>
									
									<div class="form-group">
										<label for="password" class="col-md-4 control-label">Password: </label>
										<div class="col-md-8">
											<input type="password" name="password" id="password"
												class="form-control" />
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-md-offset-4 col-md-8">
											
											<input type="submit" value="Login" class="btn btn-primary" />
											
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
											<!-- un token va fi generat pentru accest utilizator logat -->
										</div>
									</div>
								</form>
								
							</div> <!-- body -->
							<div class="card-footer">
								<div class="text-right">
									New User - <a href="${contextRoot}/register">Register Here</a>
								</div>
							</div>
						</div>
				  </div>
			    
			    
			    
			    
			    
			    </div> 
			</div><!-- end container -->
			
			
			
			
		</div> <!-- end div content -->

		
			<!-- Footer -->
			
			<%@ include file="./shared/footer.jsp"%>
			
			<!-- End div footer -->
		

		<!-- JQuery -->
		<script src="${js}/jquery.min.3.2.1.js"></script>
		 
		<!-- Bootstrap core JavaScript -->
		<script src="${js}/bootstrap.bundle.min.js"></script>
		
		<!-- Validator js -->
		 <script src="${js}/jquery.validate.js"></script> 
		 	 
		<!-- Self code javaScript -->
		<script src="${js}/myapp.js"></script>

		<!-- End div wrapper -->
	</div>

</body>

</html>
