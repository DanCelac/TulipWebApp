<!-- Angular Script -->
<script src="${js}/angular.js"></script>

<!-- Product Controller Script -->
<script src="${js}/productsController.js"></script>

<div class="container" ng-app="TulipApp" ng-controller="ProductController as pCtrl">

	<div class="row" ng-init="pCtrl.fetchProducts()">  <!-- ng-init="pCtrl.fetchProducts()" -->

		<div class="col-lg-3">
			<!-- Sidebar -->
			<%@ include file="./shared/sidebar.jsp"%>

			<!-- /.col-lg-3 -->
		</div>


		<div class="col-lg-9">

			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="${pageContext.request.contextPath}/assets/image/imag1Slide.png" alt="First slide">

					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="${pageContext.request.contextPath}/assets/image/image2slide.jpg" alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="${pageContext.request.contextPath}/assets/image/image3slide.jpg" alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
               
               <div class="row">
                	<div class="col-md-12">
                		<h3> Our Most Viewed Products</h3>
                		<hr/>
                	</div>
                </div>




			<div class="row is-table-row">

				<%-- <div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="${pageContext.request.contextPath}/assets/image/PRDPQR123WGTX.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="${contextRoot}/show/3/product">Salad Gurman</a>
							</h4>
							<h5>35 Lei</h5>
							<p class="card-text">(ham, cheese, corn, bell pepper, olives, green onion, sauce)</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div> --%>
				<%-- <div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="${pageContext.request.contextPath}/assets/image/PRDABC123DEFX.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="${contextRoot}/show/2/product">Pizza Atomic</a>
							</h4>
							<h5>58 Lei</h5>
							<p class="card-text">(double cheese, salami, bacon, ham, mushroom, sauce)</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="${pageContext.request.contextPath}/assets/image/PRDDEF123DEFX.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="${contextRoot}/show/4/product">Meat</a>
							</h4>
							<h5>50 Lei</h5>
							<p class="card-text">Grilled pork steak with vegetables</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div> --%>
				
				<div class="col-lg-4 col-md-6 mb-4" ng-repeat="product in pCtrl.mvProducts">
					<div class="card h-100">
						<a href="#"> <img class="card-img-top" style=" height: 150px; "
							ng-src="${pageContext.request.contextPath}/assets/image/{{product.code}}.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a ng-href="${contextRoot}/show/{{product.id}}/product">{{product.name}}</a>
							</h4>
							<h5>{{product.unitPrice}} Lei</h5>
							<p class="card-text">{{product.description}}</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>
				


				
              </div>
                   <div class="row">
                	<div class="col-md-12">
                		<h3>Our Most Purchased Products</h3>
                		<hr/>
                	</div>
                 </div>
                 
                <div class="row is-table-row">
                
                <div class="col-lg-4 col-md-6 mb-4" ng-repeat="product in pCtrl.mpProducts">
					<div class="card h-100">
						<a href="#"> <img class="card-img-top" style=" height: 150px; "
							ng-src="${pageContext.request.contextPath}/assets/image/{{product.code}}.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a ng-href="${contextRoot}/show/{{product.id}}/product">{{product.name}}</a>
							</h4>
							<h5>{{product.unitPrice}} Lei</h5>
							<p class="card-text">{{product.description}}</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>
                
                
                
                
                
				<%-- <div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="${pageContext.request.contextPath}/assets/image/PRDABCXYZDEFX.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="${contextRoot}/show/5/product">Garniture</a>
							</h4>
							<h5>20 Lei</h5>
							<p class="card-text">Risotto with vegetables</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="${pageContext.request.contextPath}/assets/image/PRDABCXYZDHFD.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="${contextRoot}/show/6/product">Pastes</a>
							</h4>
							<h5>35 Lei</h5>
							<p class="card-text">Spaghetti bolognese</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="${pageContext.request.contextPath}/assets/image/PRDMNO123PQRX.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="${contextRoot}/show/7/product">Fish</a>
							</h4>
							<h5>50 Lei</h5>
							<p class="card-text">Salmon steak</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
								&#9734;</small>
						</div>
					</div>
				</div> --%>

			</div>
			<!-- /.row -->

		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->

</div>
<!-- /.container -->