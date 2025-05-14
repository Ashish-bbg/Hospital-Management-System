<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../component/allCss.jsp" %>
<style>
.pw-container {
	width: 300px;
	margin: 35px auto;
	border: 1px solid grey;
	padding: 10px;
	border-radius: 5px;
}

.pw-inner-continer {
	display: flex;
	flex-direction: column;
}

.pw-inner-continer input {
	margin-bottom: 10px;
}

.pw-btn {
	background-color: #198754;
	color: white;
	border: none;
	padding: 5px 0;
	border-radius: 7px;
}

.pw-btn:hover {
	background-color: #037703;
}
</style>

</head>
<body>
	
	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@ include file="navBar.jsp" %>
	<div class="pw-container">
		<h4 style="text-align: center;">Change Password</h4>

		<form action="../doctChangePassword" method="POST">
			<div class="pw-inner-continer">

				<c:if test="${not empty succMsg}">
					<h4 style="color: green">${succMsg}</h4>
					<c:remove var="succMsg" />
				</c:if>

				<c:if test="${not empty errorMsg}">
					<h4 style="color: red">${errorMsg}</h4>
					<c:remove var="errorMsg" />
				</c:if>

				<label for="newPassword">Enter New Password</label> <input
					type="text" name="newPassword" id="newPassword" /> <label
					for="oldPassword">Enter Old Password</label> <input type="text"
					name="oldPassword" id="oldPassword" /> <input type="hidden"
					name="uid" value="${doctObj.id}" /> <input type="submit"
					value="Change Password" class="pw-btn" />
			</div>
		</form>

	</div>
</body>
</html>