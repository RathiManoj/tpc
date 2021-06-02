<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1>Add Students</h1>

	<div>
		<div>
			<ul class="nav nav-tabs nav-fill">
				<li class="nav-item"><a id="import-student-tab"
					class="nav-link active" href="#importStudentTab" data-toggle="tab"
					role="tab" aria-controls="importStudentTab" aria-selected="true">Import
						from File</a></li>
				<li class="nav-item"><a id="single-student-tab"
					class="nav-link" href="#singleStudentTab" data-toggle="tab"
					role="tab" aria-controls="singleStudentTab" aria-selected="true">Add
						Single Student</a></li>
			</ul>
		</div>

		<div class="tab-content col-md-6 offset-md-3 card shadow mt-3 p-3">
			<div class="tab-pane fade show active" id="importStudentTab"
				role="tabpanel" aria-labelledby="import-student-tab">
				<form action="/college/students/importStudents" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="file">Select file:</label> <br> <input
							type="file" class="form-control-file" id="file" name="file"
							accept=".csv"> <a href="/sample.csv">Download Sample
							CSV file</a>
					</div>
					<div class="form-group">
						Select Course: <select name="course" class="form-control">
							<c:forEach items="${ courses }" var="course">
								<option value="${ course.getId() }">${ course.getName() }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<select class="form-control" name="startYear">
							<c:forEach begin="2000" end="2025" var="year">
								<option>${ year }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<select class="form-control" name="endYear">
							<c:forEach begin="2000" end="2025" var="year">
								<option>${ year }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<button class="btn btn-primary">Submit</button>
					</div>
				</form>
			</div>

			<div class="tab-pane fade" id="singleStudentTab" role="tabpanel"
				aria-labelledby="single-student-tab">
				<form action="/college/students" method="post">
					<div class="form-group">
						<input type="text" class="form-control" name="enrollNo"
							placeholder="Roll No">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="name"
							placeholder="Name">
					</div>
					<div class="form-group">
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="gender" value="Male">
								Male
							</label>
						</div>
						<div class="form-check form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="gender" value="Female">
								Female
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="email"
							placeholder="Email">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="mobile"
							placeholder="Mobile">
					</div>
					<div class="form-group">
						Select Course: <select class="form-control" name="course">
							<c:forEach items="${ courses }" var="course">
								<option value="${ course.getId() }">${ course.getName() }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<select class="form-control" name="startYear">
							<c:forEach begin="2000" end="2025" var="year">
								<option>${ year }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<select class="form-control" name="endYear">
							<c:forEach begin="2000" end="2025" var="year">
								<option>${ year }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<button class="btn btn-primary">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/footer" />