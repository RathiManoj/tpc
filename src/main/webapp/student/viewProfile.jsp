<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1>Student Profile</h1>

	<!-- details -->
	<div>
		<!-- personal details -->
		<div>
			<a href="/students/edit/personal">Edit Personal Details</a>
			<div>
				Roll No. <input class="form-control" value="${ student.getId() }"
					readonly>
			</div>
			<div>
				Name <input class="form-control" value="${ student.getId() }"
					readonly>
			</div>
			<div>
				Gender <input class="form-control" value="${ student.getId() }"
					readonly>
			</div>
			<div>
				Email <input class="form-control" value="${ student.getId() }"
					readonly>
			</div>
			<div>
				Mobile <input class="form-control" value="${ student.getId() }"
					readonly>
			</div>
			<div>
				Image <input class="form-control" value="${ student.getId() }"
					readonly>
			</div>
			<div>
				LinkedIn <input class="form-control" value="${ student.getId() }"
					readonly>
			</div>
			<div>
				Github <input class="form-control" value="${ student.getId() }"
					readonly>
			</div>
		</div>

		<!-- educational details -->
		<div>
			<a href="/students/edit/education">Edit Personal Details</a>
			<c:forEach items="${ student.getEducation() }" var="education">
				<div>
					<div class="form-group">
						Course: <input class="form-control"
							value="${ education.getCourse() }">
					</div>
					<div class="form-group">
						School: <input class="form-control"
							value="${ education.getCourse() }">
					</div>
					<div class="form-group">
						Board/University: <input class="form-control"
							value="${ education.getCourse() }">
					</div>
					<div class="form-group">
						Started: <input class="form-control"
							value="${ education.getStartYear() }">
					</div>
					<div class="form-group">
						End: <input class="form-control"
							value="${ education.getEndYear() }">
					</div>
					<div class="form-group">
						Marks: <input class="form-control"
							value="${ education.getMarks() }">
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</div>

<jsp:include page="/footer" />