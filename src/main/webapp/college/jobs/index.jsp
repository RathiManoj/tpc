<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1>Jobs Page</h1>

	<c:if test="${not empty message }">
		<div class="alert alert-success">${message}</div>
	</c:if>

	<c:if test="${not empty error }">
		<div class="alert alert-danger">${error}</div>
	</c:if>

	<a href="/jobs/new">Add new job</a>

	<div>
		<div class="dropdown">
			<span class="dropdown-toggle" id="filterButton"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				Filter </span>
			<div class="dropdown-menu">
				<a class="dropdown-item">By Course</a>
				<div class="dropdown-divider"></div>
				<c:forEach items="${ courses }" var="course">
					<a class="dropdown-item" href="/jobs/byCourse/${ course.getId() }">${ course.getName() }</a>
				</c:forEach>
			</div>
		</div>
		<div>
			<c:if test="${ not empty jobs }">
				<div id="accordian">
					<c:forEach items="${ jobs }" var="job">
						<div class="card my-3">
							<div class="card-header" data-toggle="collapse"
								data-target="#card-${ job.getId() }" aria-expended="true"
								aria-controls="card-${ job.getId() }">
								<strong>${ job.getJobTitle() } at ${ job.getCompanyName() }
								</strong>
							</div>
							<div id="card-${ job.getId() }" class="collapse"
								data-parent="#accordian">
								<div class="card-body">
									<div class="mb-3">
										<h5>Website</h5>
										<a href="${ job.getWebsite() }">${ job.getWebsite() }</a>
									</div>
									<div class="mb-3">
										<h5>Job Type</h5>
										${ job.getJobType() }
									</div>
									<div class="mb-3">
										<h5>Applicable for Courses</h5>
										<c:forEach items="${ job.getCourses() }" var="course">
											${ course.getName() }
										</c:forEach>
									</div>
									<div class="mb-3">
										<h5>Job Location</h5>
										${ job.getJobLocation() }
									</div>
									<div class="mb-3">
										<h5>Applied By</h5>
										${ job.getAppliedBy() }
									</div>
									<div class="mb-3">
										<h5>Students applied:</h5>
										<div class="px-3 pb-3">
											<c:forEach items="${ job.getStudents() }" var="student">
												<div>${student.getName() }</div>
											</c:forEach>
										</div>
									</div>
									<div class="mb-3">
										<h5>Actions:</h5>
										<c:choose>
											<c:when test="${not job.isActive() }">
												<a href="/jobs/${job.getId()}/activate"
													class="btn btn-primary">Activate</a>
											</c:when>
											<c:otherwise>
												<a href="/jobs/${job.getId()}/deactivate"
													class="btn btn-primary">Deactivate</a>
											</c:otherwise>
										</c:choose>

									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>
</div>

<jsp:include page="/footer" />