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

<!-- pentru token de la CSRF ca sa putem dezactiva produsul, adica ii dam un token si pentru a dezactiva produsul  -->
<meta name="_csrf" content="${_csrf.token}">  
<meta name="_csrf_header" content="${_csrf.headerName}">


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
		
		<!-- Header Menu -->
		<div class="navbar">
			<%@include file="./shared/navbar.jsp"%>
			<!-- End div navbar -->
		</div>

		<!-- Page Content -->
		<div class="content">
			<!-- Loadind the home content -->
			<c:if test="${userClickHome == true }">
				<%@ include file="home.jsp"%>
			</c:if>
			<!-- Load only when user click about -->
			<c:if test="${userClickAbout == true }">
				<%@ include file="about.jsp"%>
			</c:if>
			<!-- Load only when user click contact -->
			<c:if test="${userClickContact == true }">
				<%@ include file="contact.jsp"%>
			</c:if>
			<c:if test="${(userClickAllProducts == true) or (userClickCategoryProducts == true)}">
				<%@ include file="listProducts.jsp"%>
			</c:if>
			<!-- Load only when user clicks show product -->
			<c:if test="${userClickShowProduct == true}">
				<%@include file="singleProduct.jsp"%>
			</c:if>		
			<!-- Load only when user clicks manage products -->
			<c:if test="${userClickManageProducts == true}">
				<%@include file="manageProducts.jsp"%>
			</c:if>	
			
			<!-- Load only when user clicks show cart -->
			<c:if test="${userClickShowCart == true}">
				<%@include file="cart.jsp"%>
			</c:if>	
			
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

		<!-- New plugin js -->
		 <script src="${js}/jquery.dataTables.16.js"></script> 
		 <script src="${js}/dataTables.bootstrap4.js"></script> 
	
	    <!-- Toogle switch js -->
		<%--  <script src="${js}/bootstrap-toggle.min.js"></script>  --%>
		 
		 <!-- BootBox for display js -->
		 <script src="${js}/bootbox.min.js"></script> 
		
		 
		<!-- Self code javaScript -->
		<script src="${js}/myapp.js"></script>

		<!-- End div wrapper -->
	</div>

</body>

</html>
