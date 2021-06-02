<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1>Student Educational Details</h1>
	
	<form action="" method="post">
		<div class="form-group">
			<input type="text" class="form-control" name="course" value="${ student.education.getCourse() }" >
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="school" value="${ student.education.getSchool() }" >
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="board" value="${ student.education.getBoard() }" >
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="startYear" value="${ student.education.getStartYear() }" >
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="endYear" value="${ student.education.getEndYear() }" >
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="marks" value="${ student.education.getMarks() }" >
		</div>
		<div class="form-group">
			<button class="btn btn-primary">Submit</button>
		</div>
	</form>

</div>

<jsp:include page="/footer" />