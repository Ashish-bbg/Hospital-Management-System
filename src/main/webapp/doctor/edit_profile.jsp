<%@page import="com.entity.Specalist"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SpecalistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.left-container{
		width: 30%;
	}
</style>
<%@ include file="../component/allCss.jsp"%>

</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@ include file="navBar.jsp"%>

	<div class="full-container">

		<div class="left-container">
			<h3>Update Doctor</h3>

			<script>
				setTimeout(() => {
					let msg = document.querySelector(".remove");
					msg.style.display = "none";
					
				}, 2000);
			</script>

			<form class="form-items" action="../doctorUpdateProfile" method="POST">
			<c:if test="${not empty succMsg}">
				<h4 style="color: green">${succMsg}</h4>
				<c:remove var="succMsg" />
			</c:if>

			<c:if test="${not empty errorMsg}">
				<h4 style="color: red">${errorMsg}</h4>
				<c:remove var="errorMsg" />
			</c:if>

				<label for="name" id="name">Full Name</label> <input type="text"
					id="name" name="full_name" value="${doctObj.fullName}" required /> <label for="dob">DOB</label>
				<input type="date" id="dob" name="dob" value="${doctObj.dob }" required /> <label for="qua">Qualification</label>
				<input type="text" id="qua" name="qualification" required value="${doctObj.qualification}" /> <label
					for="specialist">Specialist</label> <select name="specalist"
					id="specialist" required>
					<option value="${doctObj.specialist }">${doctObj.specialist }</option>

					<%
					SpecalistDAO dao = new SpecalistDAO(DBConnect.getConn());
					List<Specalist> list = dao.getAllSpecalist();
					for (Specalist s : list) {
					%>
					<option><%=s.getSpecalistName()%>
						<%
						}
						%>
					
				</select> <label for="email">Email</label> <input type="email" name="email"
					id="email" required value="${doctObj.email}" /> <label for="phone">Mob No</label> <input
					type="tel" name="mob_no" id="phone" required value="${doctObj.mobNo }" /> <input
					type="submit" value="Update" class="btn-submit" /> <a
					href="./index.jsp">Back</a>
				<input type="hidden" name="id" value="${doctObj.id}" />
			</form>

		</div>
		
		

	</div>



</body>
</html>