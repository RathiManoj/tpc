<jsp:include page="/header" />

<div class="container">
	<h1>Add New Course</h1>

	<div>
		<form action="/college/courses" method="post">
			<div class="form-group">
				<input type="text" class="form-control" name="name"
					placeholder="Course Name">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="duration"
					placeholder="Duration">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="credits"
					placeholder="Credits">
			</div>
			<div class="form-group">
				<button class="btn btn-primary">Submit</button>
			</div>
		</form>
	</div>
</div>

<jsp:include page="/footer" />