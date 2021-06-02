<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1 style="text-align: center;">Register</h1>

	<div class="row">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-10 offset-1">
			<div class="card shadow p-3">
				<form action="/register" method="post">
					<div class="form-group">
						<input type="text" class="form-control" name="name"
							placeholder="Name">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" name="username"
							placeholder="Email">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="password"
							placeholder="Password">
					</div>
					<div class="form-group">
						<label>Select Role</label> <select class="form-control"
							name="roles">
							<c:forEach items="${ roles }" var="role">
								<c:if test="${ role.getRoleId() eq 1 }">
									<option value="${ role.getRoleId() }">${ role.getRole() }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<button class="btn btn-primary btn-lg btn-block">Register</button>
					</div>
				</form>
				<a href="/">Go Back</a>
			</div>

		</div>
	</div>

</div>

<jsp:include page="/footer" />