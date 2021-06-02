<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1>Student Profile</h1>
	
	<form action="" method="post">
		<div class="form-group">
			<input type="text" class="form-control" name="name" value="${ student.getName() }" >
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="email" value="${ student.getEmail() }" >
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="mobile" value="${ student.getMobile() }" >
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="image" value="${ student.getImage() }" >
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="linkedinUrl" value="${ student.getLinkedinUrl() }" >
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="githubUrl" value="${ student.getGithubUrl() }" >
		</div>
		<div class="form-group">
			<button class="btn btn-primary">Submit</button>
		</div>
	</form>

</div>

<jsp:include page="/footer" />