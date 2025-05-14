<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login Page</title>
<%@ include file="component/allCss.jsp"%>


</head>
<body>
	<%@ include file="component/navBar.jsp"%>
	
			<%
				String redirect = request.getParameter("redirect");
			%>
	
	<div class="login-form-container">
		<form action="userLogin" method="POST">
			<h2>User Login</h2>

			<c:if test="${not empty errorMsg}">
				<h2 class="msg" style="color: red">${errorMsg}</h2>
			</c:if>
			<c:remove var="errorMsg" scope="session" />	


			<c:if test="${not empty userLogoutSuccessMsg}">
				<h2 class="msg" style="color: green">${userLogoutSuccessMsg}</h2>
			</c:if>
			<c:remove var="userLogoutSuccessMsg" scope="session"/>
				
			<script>
				setTimeout(() => {
					let msg = document.querySelector(".msg");
					if(msg){
						msg.style.display = "none";	
					}
				}, 2000);
			
			</script>

			<label for="mail">Email address</label> <input id="mail" type="email"
				required name="email" /> <label for="pass">Password</label> <input
				type="password" required name="password" /> <input id="pass"
				type="submit" value="Login" class="login-btn" />
			<input type="hidden" name="redirect" value="<%= redirect %>" />
		</form>
		<p>
			Don't have an account? <a href="signup.jsp">create one</a>
		</p>
	</div>


</body>
</html>