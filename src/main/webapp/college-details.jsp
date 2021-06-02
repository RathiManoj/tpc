<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">

	<div>
		<h2>${college.getName() }</h2>
		<div>
			<span>${college.getAddress() },</span> <span>${college.getCity() }</span><br>
			<span>Pin code: ${college.getPin() }</span><br> <span>${college.getState() },
				${college.getCountry() }</span><br> <span><a
				href="${college.getWebsite() }" target="_blank">${college.getWebsite() }</a></span>
		</div>
		<div>
			<h3>Courses offered:</h3>
			<div class="px-3 pb-3">
				<c:forEach items="${courses }" var="course">
					<div>${course.key.getName()}
						- <a href="/college/students/byCourse/${course.key.getId()}">${course.value}
							students</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div>
			<h4>Contact Admin</h4>
			<div>
				<strong>${college.getAdminName() }</strong><br> <span>${college.getAdminJob() }</span><br>
				<span>${college.getAdminPhone() }, <a
					href="mailto:${college.getAdminEmail() }" target="_blank">${college.getAdminEmail() }</a></span>
			</div>
		</div>
	</div>

</div>

<jsp:include page="/footer" />