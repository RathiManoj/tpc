<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1>Hello, ${ user.getName() }</h1>

	<c:if test="${not empty message }">
		<div class="alert alert-success">${message}</div>
	</c:if>

	<c:if test="${not empty error }">
		<div class="alert alert-danger">${error}</div>
	</c:if>

	<div class="row">
		<div class="col-md-6 col-sm-12 p-2">
			<div class="card">
				<div class="card-header">Manage your OnCampus Recruitment</div>
				<div class="card-body">
					<p>
						<a href="/jobs">Active Jobs: ${activeJobs}</a>
					</p>
					<p>
						<a href="/jobs">Jobs pending Approval: ${ deactiveJobs}</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-6 col-sm-12 p-2">
			<div class="card">
				<div class="card-header">Manage your Placement Portal</div>
				<div class="card-body">
					<p>
						<a href="/college-details">Manage your college:</a>
					</p>
					<p>
						<a href="/college-preferences">Update your college preference:</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<!-- <div class="col-md-6 col-sm-12 p-2">
			<div class="card">
				<div class="card-header">Manage your Network</div>
				<div class="card-body">
					<p>
						<a>Invite Employees/Recruiters:</a>
					</p>
					<p>
						<a>Active Employees:</a>
					</p>
				</div>
			</div>
		</div> -->
		<div class="col-md-6 col-sm-12 p-2">
			<div class="card">
				<div class="card-header">Manage your Students</div>
				<div class="card-body">
					<p>
						<a href="/college/students">Manage Students:</a>
					</p>
					<p>
						<a href="/college/students/new">Add students to your portal:</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/footer" />