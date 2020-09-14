<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="scripts.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table border="2" height="50%" width="60%">
		<tr>
			<th align="center">ID</th>
			<th align="center">NAME</th>
			<th align="center">COURSE</th>
			<th align="center">ADDRESS</th>
			<th align="center">OPERATIONS</th>
		</tr>
		<c:forEach items="${allData}" var="student">
   		<tr>
   			<td align="center">${student.id}</td>
   			<td align="center">${student.name}</td>
   			<td align="center">${student.course}</td>
   			<td align="center">${student.address}</td>
   			<td align="center"><a href="deleteStudent?id=${student.id}" class="btn btn-danger">DELETE</a> &nbsp; &nbsp; &nbsp;
   			 <a href="editStudent?id=${student.id}" class="btn btn-info">EDIT</a></td>
   		</tr>
   		</c:forEach>
	</table>
   
</body>
</html>