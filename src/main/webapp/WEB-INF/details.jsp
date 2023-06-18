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
		<h1 class="my-4">Song Details</h1>
		<a href="/dashboard">Dashboard</a>
	</div>
	
	<div>
		<h3 class="my-3">Title: <c:out value="${ song.title }"></c:out></h3>
		<h3 class="my-3">Artist: <c:out value="${ song.artist }"></c:out></h3>
		<h3 class="my-3">Rating: <c:out value="${ song.rating }"></c:out></h3>
	</div>
</div>
</body>
</html>