<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1 style="text-align: center;">Login</h1>
	<div class="row mt-3">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-10 offset-1">
			<div>
				<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}">
					<div class="alert alert-danger">
						${SPRING_SECURITY_LAST_EXCEPTION.message}</div>
				</c:if>
				<div>
					<form action="/login" method="post">
						<div class="form-group">
							<input type="email" class="form-control" name="username"
								placeholder="Username or Email">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="password"
								placeholder="Password">
						</div>
						<div class="form-group">
							<button class="btn btn-primary btn-lg btn-block">Login</button>
						</div>
					</form>
					<a href="/">Go Back</a>
				</div>

			</div>
		</div>
	</div>


</div>

<jsp:include page="/footer" />