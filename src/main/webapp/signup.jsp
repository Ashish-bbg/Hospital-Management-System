<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp Page</title>
<%@ include file="component/allCss.jsp"%>
</head>
<body>
	<%@ include file="component/navBar.jsp"%>
	
	<%
		String redirect = request.getParameter("redirect");
	%>

	<div class="login-form-container">
		<form action="user_register" method="POST">
			<h2>User Register</h2>
			<c:if test="${not empty successMessage}">
				<p class="text-center text-success">${successMessage}</p>
				<c:remove var="successMessage" scope="session" />

			</c:if>

			<c:if test="${not empty errorMessage}">
				<p>${errorMessage}</p>
				<c:remove var="errorMessage" scope="session" />
			</c:if>

			<label for="name">Full Name</label> <input id="name" type="text"
				required name="name" /> <label for="mail">Email address</label> <input
				id="mail" type="email" required name="email" /> <label for="pass">Password</label>
			<input type="password" required name="password" /> <input id="pass"
				type="submit" value="Register" class="login-btn" />
			
			<input type="hidden" name="redirect" value="<%= redirect %>" />
		</form>
		<p>Already have an Account <a href="user_login.jsp">Login</a></p>

	</div>

</body>
</html>