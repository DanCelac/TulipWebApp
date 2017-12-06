<%@include file="../../shared/flows-header.jsp" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<div class="container">
	<div class="row">
         
			<!--  To display all the goods -->
			<div class="col-md-6">
				
				<div class="row">
					<c:forEach items="${checkoutModel.cartLines}" var="cartLine">
					<div class="col-xs-12">
						
						<div>
							<h3 style="color:blue;">${cartLine.product.name}</h3>
							<hr/>
							<h4>Quantity -${cartLine.productCount}</h4>
							<h5>Buying Price -  ${cartLine.buyingPrice}/- Lei</h5>							
						</div>						
						<hr/>
						<div class="text-right">
							<h3>Grand Total - ${cartLine.total} - Lei</h3>
						</div>						
					</div>
					</c:forEach>
				</div>
				
				
			</div>
			
			<div class="col-md-6">
	            <div class="card card-default">
	                <div class="card-header">
	                    <h3 class="card-title">
	                        Payment Details
	                    </h3>
	                </div>
	                <div class="card-body">
	                    <form role="form">
	                    
	                    <div class="form-group">
	                        <label for="cardNumber">CARD NUMBER</label>
	                        <div class="input-group">
	                            <input type="text" class="form-control" id="cardNumber" placeholder="Valid Card Number"
	                                required autofocus />
	                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-xs-7 col-md-7">
	                            <div class="form-group">
	                                <label for="expityMonth">EXPIRY DATE</label>
	                                <br/>
	                                <div class="col-xs-6 col-lg-6 pl-ziro">
	                                    <input type="text" class="form-control" id="expityMonth" placeholder="MM" required />
	                                </div>
	                                <div class="col-xs-6 col-lg-6 pl-ziro">
	                                    <input type="text" class="form-control" id="expityYear" placeholder="YY" required /></div>
	                            </div>
	                        </div>
	                        <div class="col-xs-5 col-md-5 pull-right">
	                            <div class="form-group">
	                                <label for="cvCode">
	                                    CV CODE</label>
	                                <input type="password" class="form-control" id="cvCode" placeholder="CV" required />
	                            </div>
	                        </div>
	                    </div>
	                    </form>
	                </div>
	            </div>
	            <ul class="nav nav-pills nav-stacked">
	                <li class="active ">
	                     <a href="#"  class="btn btn-primary btn-lg btn-block">Final Payment <span class="pull-right "> ${checkoutModel.checkoutTotal} - Lei</span> </a>
	                 </li>
	            </ul>
	            <br/>
	            <a href="${flowExecutionUrl}&_eventId_pay" class="btn btn-success btn-lg btn-block" role="button">Pay</a>
			
			</div>


      </div>
   
</div>
   <%@ include file="../../shared/flows-footer.jsp"%>



	