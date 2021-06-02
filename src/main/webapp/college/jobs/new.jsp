<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1 style="text-align: center;">New Jobs Page</h1>

	<div class="row my-3">
		<div
			class="card p-3 col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-10 offset-1">
			<form action="/jobs" method="post">
				<div class="form-group">
					<label>Company Name</label> <input type="text" class="form-control"
						name="companyName" placeholder="Company Name">
				</div>
				<div class="form-group">
					<label>Job Type</label> <select class="form-control" name="jobType">
						<option>Select One</option>
						<option>Full-time</option>
						<option>Part-time</option>
						<option>Internship</option>
						<option>Others</option>
					</select>
				</div>
				<div class="form-group">
					<label>Job Title</label> <input type="text" class="form-control"
						name="jobTitle" placeholder="Job Title">
				</div>
				<div class="form-group">
					<label class="form-label">Degree Program</label>
					<c:forEach items="${ courses }" var="course">
						<div class="px-3">
							<label class="form-label"> <input type="checkbox"
								name="courses" value="${ course.getId() }"> ${ course.getName() }
							</label>
						</div>
					</c:forEach>
				</div>
				<div class="form-group">
					<label>Website</label> <input type="text" class="form-control"
						name="website" placeholder="Website">
				</div>
				<div class="form-group">
					<label>Job Location</label> <input type="text" class="form-control"
						name="jobLocation" placeholder="Job Location">
				</div>
				<div class="form-group">
					<label>Applied By:</label> <input type="date" class="form-control"
						name="appliedBy" placeholder="Applied By" />
				</div>
				<div>
					<button class="btn btn-primary btn-lg">Create a Job</button>
				</div>
			</form>
		</div>
	</div>
</div>

<jsp:include page="/footer" />