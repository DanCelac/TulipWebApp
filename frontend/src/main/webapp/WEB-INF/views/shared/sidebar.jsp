<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
	<h1 class="my-4">Category</h1>
	
	
	<div class="list-group">
	
	<c:forEach items = "${categories}" var = "category">
		<a href="${contextRoot}/show/category/${category.id}/products" class="list-group-item"  id="a_${category.name}">${category.name}</a> 
	
	
	</c:forEach>
	
		<!-- <a href="#" class="list-group-item">Category2</a> 
		<a href="#" class="list-group-item">Category3</a> -->
	</div>






















<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="my-4">Products</h1>

<div class="list-group">


	<c:forEach items="${categories}" var="category">
		<a href="${contextRoot}/show/category/${category.id}/products" class="list-group-item" id="a_${category.name}">${category.name}</a>
	</c:forEach>

</div> --%>
<!-- 
<div class="col-lg-3">

	<h1 class="my-4">Category</h1>
	<div class="list-group">
		<a href="#" class="list-group-item">Category1</a> 
		<a href="#" class="list-group-item">Category2</a> 
		<a href="#" class="list-group-item">Category3</a>
	</div>

</div> -->
<!-- /.col-lg-3 -->