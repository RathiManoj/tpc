<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1>Hello ${student.getName()}</h1>

	<div class="row mt-5">
		<div class="col-sm-3">
			<c:choose>
				<c:when test="${not empty student.getImage() }">
					<img class="img-thumbnail" alt="user-image"
						src="/user-data/${ student.getId() }/${student.getImage()}">
				</c:when>
				<c:otherwise>
					<img class="img-thumbnail" alt="user-image"
						src="/user-data/image.png">
				</c:otherwise>
			</c:choose>
		</div>

		<div class="col-sm-9 mt-3 mt-sm-0">
			<form action="update-profile" method="post"
				enctype="multipart/form-data">
				<div class="form-group">
					<label>Name:</label> <input type="text" class="form-control"
						name="name" placeholder="Name" value="${ student.getName() }" />
				</div>
				<div class="form-group">
					<label>Enrollment No:</label> <input type="text"
						class="form-control" name="enrollNo" placeholder="Enrollment No"
						value="${ student.getEnrollNo() }" />
				</div>
				<div class="form-group">
					<label>Email:</label> <input type="text" class="form-control"
						name="email" placeholder="Email" value="${ student.getEmail() }" />
				</div>
				<div class="form-group">
					<label>Gender:</label>
					<div class="px-3">
						<div class="form-check form-check-inline">
							<label> <input type="radio" class="form-check-input"
								name="gender" value="Male"
								${student.getGender() eq "Male" ? "checked" : ""}> Male
							</label>
						</div>
						<div class="form-check form-check-inline">
							<label> <input type="radio" class="form-check-input"
								name="gender" value="Female"
								${student.getGender() eq "Female" ? "checked" : ""}>
								Female
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label>Mobile Number:</label> <input type="text"
						class="form-control" name="mobile" placeholder="Mobile Number"
						value="${ student.getMobile() }" />
				</div>
				<div class="form-group">
					<label>LinkedIn Profile Url:</label> <input type="url"
						class="form-control" name="linkedinUrl"
						placeholder="LinkedIn Profile Url"
						value="${ student.getLinkedinUrl() }" />
				</div>
				<div class="form-group">
					<label>Github Profile Url:</label> <input type="url"
						class="form-control" name="githubUrl"
						placeholder="Github Profile Url"
						value="${ student.getGithubUrl() }" />
				</div>
				<div class="form-group">
					<label for="profile-image"> Profile Image:</label> <input
						type="file" class="form-control-file" name="image"
						id="profile-image" accept="image/*" />
				</div>
				<div class="form-group">
					<button class="btn btn-primary btn-lg">Update</button>
				</div>
			</form>
		</div>
	</div>
</div>

<jsp:include page="/footer" />