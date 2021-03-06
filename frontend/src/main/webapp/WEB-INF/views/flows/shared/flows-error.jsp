<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/shop-homepage.css" rel="stylesheet">


<title>Tulip Cafe - FlowException</title>

</head>

<body>

	<div class="wrapper">
       <div class="navbar">
	    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" role="navigation">
	        <div class="container">
	            <!-- Brand and toggle get grouped for better mobile display -->
	            <div class="navbar-header">
	                <a class="navbar-brand" href="${contextRoot}/home">Home</a>
	            </div>
			</div>
		</nav>
		</div>
			
		
		<div class="content">
		
			<div class="container">
			
				<div class="row">
				
					<div class="col-xs-12">
					
						
						<div class="jumbotron">
						
							<h1>Please contact your administrator!</h1>
							<hr/>
						
							<blockquote style="word-wrap:break-word">
								
								${flowExecutionException}
							
							</blockquote>						

							<blockquote style="word-wrap:break-word">
								
								${rootCauseException}
							
							</blockquote>						
						
						</div>
						
											
					</div>					
				
				</div>
			
			</div>
							
		</div>

		
		<%@include file="../../shared/footer.jsp" %>

	</div>
		
	
</body>


</html>