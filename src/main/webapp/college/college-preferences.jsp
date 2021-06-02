<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">

	<div class="px-2">
		<form action="college-preferences" method="post">
			<div class="form-group">
				<label for="name">College name:</label> <input type="text"
					class="form-control" id="name" name="name"
					value="${college.getName() }">
			</div>
			<div class="form-group">
				<label for="address">Address:</label> <input type="text"
					class="form-control" id="address" name="address"
					value="${college.getAddress() }">
			</div>
			<div class="form-group">
				<label for="city">City:</label> <input type="text"
					class="form-control" id="city" name="city"
					value="${college.getCity() }">
			</div>
			<div class="form-group">
				<label for="state">State:</label> <input type="text"
					class="form-control" id="state" name="state"
					value="${college.getState() }">
			</div>
			<div class="form-group">
				<label for="pin">Pin:</label> <input type="text"
					class="form-control" id="pin" name="pin"
					value="${college.getPin() }">
			</div>
			<div class="form-group">
				<label for="country">Country:</label> <input type="text"
					class="form-control" id="country" name="country"
					value="${college.getCountry() }">
			</div>
			<div class="form-group">
				<label for="website">Website:</label> <input type="text"
					class="form-control" id="website" name="website"
					value="${college.getWebsite() }">
			</div>
			<div>
				<h3>Admin Contact Details:</h3>
				<div class="px-3">
					<div class="form-group">
						<label for="admin-name">Name:</label> <input type="text"
							class="form-control" id="admin-name" name="adminName"
							value="${college.getAdminName() }">
					</div>
					<div class="form-group">
						<label for="admin-job">Job Title:</label> <input type="text"
							class="form-control" id="admin-job" name="adminJob"
							value="${college.getAdminJob() }">
					</div>
					<div class="form-group">
						<label for="admin-phone">Phone:</label> <input type="text"
							class="form-control" id="admin-phone" name="adminPhone"
							value="${college.getAdminPhone() }">
					</div>
					<div class="form-group">
						<label for="admin-email">Email:</label> <input type="email"
							class="form-control" id="admin-email" name="adminEmail"
							value="${college.getAdminEmail() }">
					</div>
				</div>
			</div>
			<div class="form-group">
				<button class="btn btn-primary btn-lg">Update</button>
			</div>
		</form>
	</div>

</div>

<jsp:include page="/footer" />