<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login Page</title>
<%@ include file="component/allCss.jsp"%>
</head>
<body>
	<%@ include file="component/navBar.jsp"%>

	<div class="login-form-container">
	
	
		<form action="adminLogin" method="POST">
		
		<c:if test="${ not empty errorMessage }">
			<h2 style="color: red">${errorMessage}</h2>
		</c:if>
		<c:remove var="errorMessage" scope="session" />
		
		<c:if test="${ not empty successLogoutMsg }">
			<h2 style="color: green">${successLogoutMsg}</h2>
		</c:if>
		<c:remove var="successLogoutMsg" scope="session" />
		
		
		
			<h2>Admin Login</h2>
			<label for="mail">Email address</label> <input id="mail" type="email"
				required name="email" /> <label for="pass">Password</label> <input
				type="password" required name="password" /> <input id="pass"
				type="submit" value="Login" class="login-btn" />
		</form>

	</div>

</body>
</html>