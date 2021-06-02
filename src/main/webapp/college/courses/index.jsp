<jsp:include page="/header" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<h1>Courses List</h1>

	<c:if test="${ not empty courses }">
		<table class="table">
			<tr>
				<th>S. No</th>
				<th>Name</th>
				<th>duration</th>
				<th>Credits</th>
			</tr>
			<%
				int i = 1;
			%>
			<c:forEach items="${ courses }" var="course">
				<tr>
					<td><%=i%></td>
					<td>${ course.getName() }</td>
					<td>${ course.getDuration() }</td>
					<td>${ course.getCredits() }</td>
				</tr>
				<%
					i++;
				%>
			</c:forEach>
		</table>
	</c:if>
</div>

<jsp:include page="/footer" />