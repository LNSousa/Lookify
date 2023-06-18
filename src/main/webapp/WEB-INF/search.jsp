<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
	<div class="d-flex justify-content-between align-items-center">
		<h1 class="my-4">Songs by: ${ artist }</h1>
		<a href="/dashboard">Dashboard</a>
	</div>
	<table class="table border">
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Rating</th>
				<th scope="col">Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="song" items="${ results }">
				<tr class="align-middle ">
					<td style="width:50%;"><a href="/songs/${ song.id }"><c:out value="${ song.title }"></c:out></a></td>
					<td><c:out value="${ song.rating }"></c:out></td>
					<td><form action="/songs/${song.id}/delete" method="post">
					    <input type="hidden" name="_method" value="delete">
					    <input type="submit" value="delete" class="btn btn-danger">
					</form></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>