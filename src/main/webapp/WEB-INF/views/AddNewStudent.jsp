<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
 <%@include file="scripts.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Student</title>
<style type="text/css"/>
.errorName{color: red;}
</style>
</head>
<body>
	<div><h3>Fill Your Credentials !</h3></div>
	<sf:form action="saveStudent" modelAttribute="stu" class="form-group">
	<div>
		<label for="name">Name : </label>
		<sf:input path="name" id="name" class="form-control"/>
		<sf:errors path="name" cssClass="errorName"/> 
	</div><br/>
	<div>
		<label for="course">Course : </label>
		<sf:input path="course" id="course" class="form-control"/>
		<sf:errors path="course" cssClass="errorName"/> 
	</div><br/>
	<div>
		<label for="address">Address : </label>
		<sf:input path="address" id="address" class="form-control"/>
		<sf:errors path="address" cssClass="errorName"/>
	</div> <br/> 
	<div>	
		<input type="submit" value="Save" class="btn btn-success"/>
	</div>
	
	</sf:form>

</body>
</html>