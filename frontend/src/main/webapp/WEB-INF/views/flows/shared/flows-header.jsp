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

<title>Caf� Tulip - ${title}</title>

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
		
	  <%@ include file="flows-navbar.jsp" %>
	  
		<!-- Page Content -->
		<div class="content">
			