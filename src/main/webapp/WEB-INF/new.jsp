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
		<h1 class="my-4">Add Song</h1>
		<a href="/dashboard">Dashboard</a>
	</div>
	<form:form action="/songs/new" method="post" modelAttribute="song" style="width:50%;">
	    <div class="my-3">
	        <form:label path="title" class="form-label">Song title</form:label><br/>
	        <form:errors path="title" style="color:red"/>
	        <form:input type="text" class="form-control" path="title"/>
	    </div>
	    <div class="my-3">
	        <form:label path="artist" class="form-label">Artist</form:label><br/>
	        <form:errors path="artist" style="color:red"/>
	        <form:input type="text" class="form-control" path="artist"/>
	    </div>
	    <div class="my-3">
	        <form:label path="rating" class="form-label">Rating (1-10)</form:label><br/>
	        <form:errors path="rating" style="color:red"/>
	        <form:select class="form-control" path="rating">
	        	<form:option value="0">Please select a rating</form:option>
	        	<form:option value="1">1</form:option>
	        	<form:option value="2">2</form:option>
	        	<form:option value="3">3</form:option>
	        	<form:option value="4">4</form:option>
	        	<form:option value="5">5</form:option>
	        	<form:option value="6">6</form:option>
	        	<form:option value="7">7</form:option>
	        	<form:option value="8">8</form:option>
	        	<form:option value="9">9</form:option>
	        	<form:option value="10">10</form:option>
	        </form:select>
	    </div>
		<button type="submit" class="btn btn-primary my-5">Submit</button>
	</form:form>
</div>
</body>
</html>