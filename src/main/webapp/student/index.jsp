<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1>Hello ${student.getName()}</h1>

	<c:if test="${not empty message }">
		<div class="alert alert-success">${message}</div>
	</c:if>

	<c:if test="${not empty error }">
		<div class="alert alert-danger">${error}</div>
	</c:if>

	<div class="text-right m-3">
		<a class="btn btn-primary" role="button" href="/update-profile">Update
			Profile</a>
	</div>

	<div class="row">
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
			<table class="table">
				<tr>
					<th scope="col">Enrollment No.</th>
					<td>${ student.getEnrollNo() }</td>
				</tr>
				<tr>
					<th scope="col">Gender</th>
					<td>${ student.getGender() }</td>
				</tr>
				<tr>
					<th scope="col">Email</th>
					<td>${ student.getEmail() }</td>
				</tr>
				<tr>
					<th scope="col">Mobile</th>
					<td>${ student.getMobile() }</td>
				</tr>
				<tr>
					<th scope="col">Course Enrolled</th>
					<td>${student.getCourse().getName()}
						(${student.getStartYear()} -
						${student.getEndYear()})</td>
				</tr>
				<tr>
					<th scope="col">LinkedIn Profile</th>
					<td>${ student.getLinkedinUrl() }</td>
				</tr>
				<tr>
					<th scope="col">Github Profile</th>
					<td>${ student.getGithubUrl() }</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<jsp:include page="/footer" />