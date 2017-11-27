<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<%@ include file="../shared/flows-header.jsp" %>

			
			
<div class="row">
	    <!-- column to display the personal detail -->
		<div class="col-sm-6">
	
			<div class="card text-center text-white bg-secondary mb-3">
				
				<div class="card-header">
					<h4>Personal Details</h4>
				</div>
			
				<div class="card-body">
				    <!-- code to display the personal detail -->
					<%-- <div class="text-center">
						<h3>Name : <strong>${registerModel.user.firstName} ${registerModel.user.lastName}</strong></h3>
						<h4>Email : <strong>${registerModel.user.email}</strong></h4>
						<h4>Contact : <strong>${registerModel.user.contactNumber}</strong></h4>
						<h4>Role : <strong>${registerModel.user.role}</strong></h4>
						<p>
							<a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-primary">Edit</a>
						</p>
					</div> --%>
				</div>
				
				<div class="card-footer">
				     <!-- anchor to move to the edit of personal details -->
				     <a href="${flowExecutionUrl}&_eventId_personal" class="btn  btn-primary">Edit</a> 
				
				
				</div>
			
			</div>		
		</div><!-- end col-sm-6 -->
		
		<div class="col-sm-6">
		
			<div class="card text-center text-white bg-secondary mb-3">
				
				<div class="card-header">
					<h4>Billing Address</h4>
				</div>
			
				<div class="card-body">
				     <!-- code to display the communication address -->
				     
					<%-- <div class="text-center">
						<p>${registerModel.billing.addressLineOne}, </p>
						<p>${registerModel.billing.city} -  ${registerModel.billing.postalCode}, </p>

						<p>
							<a href="${flowExecutionUrl}&_eventId_billing" class="btn btn-primary">Edit</a>
						</p>
					</div> --%>
				</div>
				<div class="card-footer">
				     <!-- anchor to move to the edit of address -->
				     <a href="${flowExecutionUrl}&_eventId_billing" class="btn  btn-primary">Edit</a> 
				
				
				</div>
			
			</div>
		
		</div>
	
</div>
	
	<div class="row">
		
		<div class="col-sm-4 mx-auto">
			
			<div class="text-center">
				<!-- anchor to move to the success page -->
				 
				 <a href="${flowExecutionUrl}&_eventId_success" class="btn  btn-primary">Confirm</a> 
			</div>
			
		</div>
		
	</div>
		

			

<%@ include file="../shared/flows-footer.jsp" %>