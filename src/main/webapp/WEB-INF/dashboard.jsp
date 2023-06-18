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
	<nav class="navbar">
		<div class="container-fluid " >
			<div class="d-flex justify-content-between" style="width:20%;">
				<a href="/songs/new">Add new</a>
				<a href="/songs/top">Top songs</a>
			</div>
			<form action="/search" method="post" class="d-flex">
			    <input type="text" name="search" class="form-control me-3" placeholder="Artist"/>
			    <input type="submit" value="search" class="btn btn-primary"/>
			</form>
		</div>
	</nav>
	<table class="table border">
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Rating</th>
				<th scope="col">Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="song" items="${ songs }">
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