<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1 style="text-align: center;">Update Password</h1>

	<div class="row mt-3">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-10 offset-1">
			<div>
				<c:if test="${not empty message }">
					<div class="alert alert-success">${message}</div>
				</c:if>

				<c:if test="${not empty error }">
					<div class="alert alert-danger">${error}</div>
				</c:if>

				<div>
					<form action="/update-password" method="post">
						<div class="form-group">
							<label for="currentPassword">Current Password:</label> <input
								type="password" class="form-control" name="currentPassword"
								placeholder="Current Password">
						</div>
						<div class="form-group">
							<label for="newPassword">New Password:</label> <input
								type="password" class="form-control" name="newPassword"
								placeholder="New Password">
						</div>
						<div class="form-group">
							<button class="btn btn-primary btn-lg btn-block">Update</button>
						</div>
					</form>
					<a href="/home">Go Back</a>
				</div>

			</div>
		</div>
	</div>


</div>

<jsp:include page="/footer" />