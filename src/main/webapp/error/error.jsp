<jsp:include page="/header" />

<div class="container">
	<h1>Error Page</h1>
	${SPRING_SECURITY_LAST_EXCEPTION.message}

</div>

<jsp:include page="/footer" />