<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">

	<div class="row">

		<!-- First colon would be to display sidebar -->
		<div class="col-lg-3">

			<%@include file="./shared/sidebar.jsp"%>

		</div>

		<!-- Second colon would be to display the actual products -->
		<div class="col-lg-9">
			<!-- Added breadcrumb component  Home/Category/Pizza that is breadcrumb-->
			<div class="row">

				<div class="col-lg-12">
					<c:if test="${userClickAllProducts == true}">
						<script>
							window.categoryId = '';
						</script>
						<ol class="breadcrumb">

							<li><a href="${contextRoot}/home">Home</a></li>
							<li class="active" style= "color: #155724">/ All Products</li>

						</ol>
					</c:if>

					<c:if test="${userClickCategoryProducts == true}">
						<script>
							window.categoryId = '${category.id}';
						</script>
						<ol class="breadcrumb">

							<li><a href="${contextRoot}/home">Home</a></li>
							<li class="active" style= "color: #155724">/ Category / </li>
							<li class="active" style= "color: #155724">${category.name}</li>

						</ol>
					</c:if>


				</div>


			</div>

		</div>

	</div>

</div>