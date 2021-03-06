<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<%@ include file="../shared/flows-header.jsp"%>

<div class="container">
	<div class="row">
		<div class="mx-auto col-md-8">
			<!-- boot 3  col-md-offset-2  boot 4 = mx-auto -->

			<div class="card text-center text-white bg-secondary mb-3">
				<!--  bootstrap 3= panel, boot 4 = card -->

				<div class="card-header ">
					<h4>Sigh Up - Personal</h4>
				</div>

				<div class="card-body">
					<!--Form Elements  -->
					<!-- modelAtribute pentru a face legatura cu Controlerul , convertim sa fie ca un spring element -->
					<sf:form method="POST" 
							class="form-horizontal" 
							id="registerForm"
							modelAttribute="user"
							>

						<div class="form-group">
							<label class="control-label col-md-4">First Name</label>
							<div class="col-md-8 mx-auto">
								<sf:input type="text" path="firstName" class="form-control"
									placeholder="First Name" />
								<sf:errors path="firstName" cssClass="help-block" element="em" />
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-4">Last Name</label>
							<div class="col-md-8 mx-auto">
								<sf:input type="text" path="lastName" class="form-control"
									placeholder="Last Name" />
								<sf:errors path="lastName" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Email</label>
							<div class="col-md-8 mx-auto">
								<sf:input type="text" path="email" class="form-control"
									placeholder="abc@zyx.com" />
								<sf:errors path="email" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Contact Number</label>
							<div class="col-md-8 mx-auto">
								<sf:input type="text" path="contactNumber" class="form-control"
									placeholder="XXXXXXXXXX" maxlength="10" />
								<sf:errors path="contactNumber" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Password</label>
							<div class="col-md-8 mx-auto">
								<sf:input type="password" path="password" class="form-control"
									placeholder="Password" />
								<sf:errors path="password" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Confirm Password</label>
							<div class="col-md-8 mx-auto">
								<sf:input type="password" path="confirmPassword"
									class="form-control" placeholder="Re-type password" />
								<sf:errors path="confirmPassword" cssClass="help-block" element="em" />
							</div>
						</div>
                      <!-- radio button using bootstrap class of radio-inline -->
						<div class="form-group">
							<label class="control-label col-md-4">Role</label>
							<div class="col-md-8 mx-auto">
								<label class="radio-inline">  
								      <sf:radiobutton path="role" value="USER" checked="checked" /> User
								</label> 
								<%-- <label class="radio-inline">
								      <sf:radiobutton path="role" value="SUPPLIER" /> Supplier
								</label> --%>
							</div>
						</div>

						<div class="form-group">
							<div class="mx-auto col-md-8">
							  <!-- submit button inside the form -->
								<button type="submit" name="_eventId_billing"
									class="btn btn-primary"> Next - Billing <span class="glyphicon glyphicon-chevron-right"></span>
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


<%@ include file="../shared/flows-footer.jsp"%>