<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Specalist"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecalistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Page</title>
<%@include file="../component/allCss.jsp"%>

<style>
.full-container {
	border: 1px solid red;
	display: flex;
	width: 100%;
	justify-content: center;
}

.left-container {
	/* border: 1px solid green; */
	width: 29%;
	margin: 1.5rem;
	border-radius: 10px;
	box-shadow: 2px 2px 11px grey;
}

.left-container h3, .right-container h3 {
	text-align: center;
	font-weight: 400;
	font-size: 22px;
	margin-top: 10px;
}

.form-items {
	display: flex;
	flex-direction: column;
	padding: 1rem;
}

.form-items input, select {
	margin-bottom: 1rem;
}

.submit-btn {
	background-color: #198754;
	color: white;
	padding: 5px 0;
	border-radius: 5px;
	border: none;
	font-size: 15px;
}
</style>

</head>
<body>
	<%@include file="../component/navBar.jsp"%>

	<div class="full-container">

		<div class="left-container">
			<h3>Edit Doctor Details</h3>

			<c:if test="${not empty errorMsg}">
				<span class="remove" style="color: red">${erroMsg}</span>
				<c:remove var="errorMsg" scope="session" />
			</c:if>

			<c:if test="${not empty succMsg}">
				<span class="remove" style="color: green">${succMsg}</span>
				<c:remove var="succMsg" scope="session" />
			</c:if>

			<script>
				setTimeout(() => {
					let msg = document.querySelector(".remove");
					msg.style.display = "none";
					
				}, 2000);
			</script>

			<%
			int id = Integer.parseInt(request.getParameter("id"));
			DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
			Doctor d = dao2.getDoctorById(id);
			%>

			<form class="form-items" action="../updateDoctor" method="POST">

				<label for="name" id="name">Full Name</label> <input type="text"
					id="name" name="full_name" value="<%= d.getFullName() %>" required /> <label for="dob">DOB</label>
				<input type="date" id="dob" name="dob" value="<%= d.getDob() %>" required /> <label for="qua">Qualification</label>
				<input type="text" id="qua" name="qualification" value="<%= d.getQualification() %>" required /> <label
					for="specialist">Specialist</label> <select name="specalist"
					id="specialist" required>
					<option value="<%= d.getSpecialist() %>"><%= d.getSpecialist() %></option>

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
					id="email" value="<%= d.getEmail() %>" required /> <label for="phone">Mob No</label> <input
					type="tel" name="mob_no" id="phone" value="<%= d.getMobNo() %>" required /> <label
					for="password">Password</label> <input type="text"
					name="password" id="password" value="<%= d.getPassword() %>" required /> <input type="submit"
					value="Update details" class="submit-btn" />
					<input type="hidden" name="id" value="<%= d.getId() %>" />
			</form>

		</div>



	</div>


</body>
</html>