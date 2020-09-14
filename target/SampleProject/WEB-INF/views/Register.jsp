<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
 <%@include file="scripts.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add User</title>
<style type="text/css"/>
.errorName{color: red;}
</style>
</head>
<body>
	<div><h3>Fill Your Credentials !</h3></div>
	<sf:form action="saveUser" modelAttribute="user" class="form-group">
	<div>
		<label for="username">Name : </label>
		<sf:input path="username" id="username" class="form-control"/>
		<%-- <sf:errors path="username" cssClass="errorName"/> --%> 
	</div><br/>
	<div>
		<label for="password">Password : </label>
		<sf:input path="password" id="password" class="form-control"/>
		<%-- <sf:errors path="password" cssClass="errorName"/> --%> 
	</div><br/>
	<div>
		<label for="emailid">Email Id: </label>
		<sf:input path="emailid" id="emailid" class="form-control"/>
		<%-- <sf:errors path="emailid" cssClass="errorName"/> --%>
	</div> <br/> 
	<div>	
		<input type="submit" value="Save" class="btn btn-success"/>
	</div>
	
	</sf:form>

</body>
</html>