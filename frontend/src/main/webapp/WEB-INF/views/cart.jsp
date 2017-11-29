<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">

<c:choose>
  <c:when test="${not empty cartLines }">
  
            <table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:50%">Product</th>
							<th style="width:10%">Price</th>
							<th style="width:8%">Quantity</th>
							<th style="width:22%" class="text-center">Subtotal</th>
							<th style="width:10%"></th>
						</tr>
					</thead>
					<tbody>
					
					
					
                        <c:forEach items="${cartLines}"  var="cartLine">
                        
                             <tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-3 hidden-xs"><img src="${pageContext.request.contextPath}/assets/image/${cartLine.product.code}.jpg" alt="${cartLine.product.name }" class="img-responsive cartImg"/></div>
									<div class="col-sm-9">
										<h4 class="nomargin">${cartLine.product.name}
										    <!-- daca cart line is not available -->
										      <c:if test="${cartLine.available == false}">
										            <strong class="unavailable">(Not Available)</strong>
										      
										      </c:if>
										
										
										</h4>
										<p>Description- ${cartLine.product.description }</p>
									</div>
								</div>
							</td>
							<td data-th="Price">${cartLine.buyingPrice} Lei</td>
							<td data-th="Quantity">
								<input type="number" class="form-control text-center" value="${cartLine.productCount}">
							</td>
							<td data-th="Subtotal" class="text-center">${cartLine.total}</td>
							<td class="actions" data-th="">
								<button class="btn btn-info btn-sm"><span class="glyphicon glyphicon-refresh"></span></button>
								<button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button>								
							</td>
						</tr>
                        
                        
                      </c:forEach>					
						
					</tbody>
					<tfoot>
					        <!-- for extra small like mobile -->
						<%-- <tr class="visible-xs">
							<td class="text-center"><strong>Total ${userModel.cart.grandTotal} Lei</strong></td>
						</tr> --%>
						<tr>
							<td><a href="#" class="btn btn-warning"><span class="glyphicon glyphicon-chevron-left"></span> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong>Total ${userModel.cart.grandTotal} Lei</strong></td>
							<td><a href="#" class="btn btn-success btn-block">Checkout <span class="glyphicon glyphicon-chevron-right"></span></a></td>
						</tr>
					</tfoot>
				</table>
  
  
  </c:when>
  
  <c:otherwise>
      
      <div class="jumbotron">
          <div class="text-center">
          
              <h1>Your cart is empty !</h1>
          
          </div>
      
      </div>
  
  
  </c:otherwise>
  
  
  


</c:choose>
		
		
	
</div>