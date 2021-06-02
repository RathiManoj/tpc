<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1>Students List</h1>
	<p>
		<a href="/college/students/new">Add new students</a>
	</p>

	<div>
		<div class="dropdown">
			<span class="dropdown-toggle" id="filterButton"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				Filter </span>
			<div class="dropdown-menu">
				<a class="dropdown-item">By Course</a>
				<div class="dropdown-divider"></div>
				<c:forEach items="${ courses }" var="course">
					<a class="dropdown-item" href="/college/students/byCourse/${ course.getId() }">${ course.getName() }</a>
				</c:forEach>
			</div>
		</div>
		<c:if test="${ not empty students }">
			<div id="accordian">
				<c:forEach items="${ students }" var="student">
					<div class="card my-3">
						<div class="card-header" data-toggle="collapse"
							data-target="#card-${ student.getId() }" aria-expended="true"
							aria-controls="card-${ student.getId() }">
							<strong>${ student.getName() },${ student.getEnrollNo() },
								${ student.getCourse().getName() }</strong>
						</div>
						<div id="card-${ student.getId() }" class="collapse"
							data-parent="#accordian">
							<div class="card-body">
								<div class="mb-3">
									<h5>Email</h5>
									${ student.getEmail() }
								</div>
								<div class="mb-3">
									<h5>Mobile</h5>
									${ student.getMobile() }
								</div>
								<div class="mb-3">
									<h5>Course</h5>
									${ student.getCourse().getName() }
								</div>
								<div class="mb-3">
									<h5>Admission Year</h5>
									${ student.getStartYear() }
								</div>
								<div class="mb-3">
									<h5>Graduation Year</h5>
									${ student.getEndYear() }
								</div>
								<div class="mb-3">
									<h5>Actions:</h5>
									<button class="btn btn-primary">Deactivate</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</div>

<jsp:include page="/footer" />