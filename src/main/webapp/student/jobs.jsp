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

	<a href="/jobs/applied">View applied jobs</a>

	<div>
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
										<h5>Actions:</h5>
										<a href="/jobs/apply/${job.getId()}" class="btn btn-primary">Apply</a>

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