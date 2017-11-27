<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<%@ include file="../shared/flows-header.jsp" %>

			<div class="container"> 
			
			 	<div class="row">
		<div class="mx-auto col-md-8">
			<!-- boot 3  col-md-offset-2  boot 4 = mx-auto -->

			<div class="card text-center text-white bg-secondary mb-3">
				<!--  bootstrap 3= panel, boot 4 = card -->

				<div class="card-header ">
					<h4>Sigh Up - Address</h4>
				</div>

				<div class="card-body">
					<!--Form Elements  -->
					<!-- modelAtribute pentru a face legatura cu Controlerul , convertim sa fie ca un spring element -->
					<sf:form method="POST" 
							class="form-horizontal" 
							id="billingForm"
							modelAttribute="billing"
							>

						<div class="form-group">
								<label class="control-label col-md-4" for="addressLineOne">Address</label>
								<div class="col-md-8">
									<sf:input type="text" path="addressLineOne" class="form-control"
										placeholder="Enter Address " />
									<sf:errors path="addressLineOne" cssClass="help-block" element="em"/> 
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="city">City</label>
								<div class="col-md-8">
									<sf:input type="text" path="city" class="form-control"
										placeholder="Enter City Name" />
									<sf:errors path="city" cssClass="help-block" element="em"/> 
								</div>
							</div>
							
							
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
								  <!-- Submit bottom for moving to the personal -->
									<button type="submit" name="_eventId_personal" class="btn btn-primary">
										<span class="glyphicon glyphicon-chevron-left"></span> Back - Personal
									</button>
									 <!-- Submit bottom for moving to confirm -->								
									<button type="submit" name="_eventId_confirm" class="btn btn-primary">
										Next - Confirm<span class="glyphicon glyphicon-chevron-right"></span>
									</button>																	 
								</div>
							</div>
						
					</sf:form>
				</div>
				<!--End CardBody  -->

			</div>
			<!-- End Card -->

		</div>
	</div>
			
			</div>
			

<%@ include file="../shared/flows-footer.jsp" %>