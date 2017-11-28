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
				    <!-- code to display the personal detail to the user-->
					<div class="text-center">
						
						<h4>${registerModel.user.firstName} ${registerModel.user.lastName}</h4> <!-- pentru a afisa numele utilizatorului inregistrat dinamic -->
						<h5>Email: ${registerModel.user.email}</h5>
						<h5>Contact Number: ${registerModel.user.contactNumber}</h5>
						<h5>Role: ${registerModel.user.role}</h5>
						<%-- <p>
							<a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-primary">Edit</a>
						</p> --%>
					</div>
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
				     
					<div class="text-center">
						
						<h4>${registerModel.billing.addressLineOne}</h4> 
						<h4>${registerModel.billing.city}</h4> 
					</div>
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
				 
				 <a href="${flowExecutionUrl}&_eventId_submit" class="btn  btn-primary">Confirm</a> 
			</div>
			
		</div>
		
	</div>
		

			

<%@ include file="../shared/flows-footer.jsp" %>