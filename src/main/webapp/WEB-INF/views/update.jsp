<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
 <%@include file="scripts.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student</title>
<style type="text/css"/>
.errorName{color: red;}
</style>
</head>
<body>
	<sf:form action="updateStudentToDB" modelAttribute="data" class="form-group">
	<div>
		
		<sf:input path="id" type="hidden" class="form-control"/> 
	</div><br/>
	
	<div>
		<label for="name">Name : </label>
		<sf:input path="name" id="name" class="form-control" value="${data.name}"/> 
		<sf:errors path="name" cssClass="errorName"/>
	</div><br/>
	<div>
		<label for="course">Course : </label>
		<sf:input path="course" id="course" class="form-control" value="${data.course }"/>
		<sf:errors path="course" cssClass="errorName"/> 
	</div><br/>
	<div>
		<label for="address">Address : </label>
		<sf:input path="address" id="address" class="form-control" value="${data.address}"/>
		<sf:errors path="address" cssClass="errorName"/>
	</div> <br/> 
	<div>	
		<input name="action" value="UPDATE" type="submit" class="btn btn-primary"/>
	</div>
	
	</sf:form>
</body>
</html>