<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Login Page</title>
<%@ include file="component/allCss.jsp"%>
</head>
<body>
	<%@ include file="component/navBar.jsp"%>
	
	<div class="login-form-container">
		
		<c:if test="${not empty errorMsg}">
			<p style="color: red; text-align: center;">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session"/>
		</c:if>
		
		<c:if test="${not empty succMsg}">
			<p style="color: green; text-align: center;">${succMsg}</p>
			<c:remove var="succMsg" scope="session"/>
		</c:if>
		
		<form action="doctorLogin" method="POST">
			<h2>Doctor Login</h2>
			<label for="mail">Email address</label> <input id="mail" type="email"
				required name="email" /> <label for="pass">Password</label> <input
				type="password" required name="password" /> <input id="pass"
				type="submit" value="Login" class="login-btn" />
		</form>
		
	</div>
	
</body>
</html>