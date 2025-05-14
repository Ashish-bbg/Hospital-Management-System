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
	
	display: flex;
	width: 100%;
	justify-content: space-evenly;
}

.left-container {
	/* border: 1px solid green; */
	width: 33%;
	margin: 1.5rem;
	border-radius: 10px;
	box-shadow: 2px 2px 11px grey;
}

.left-container h3 {
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

.btn-submit {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 5px;
	border-color: #007bff;
	border-radius: 5px;
	transition: color .95s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.btn-submit:hover {
	background-color: #0069d9;
}





</style>

</head>
<body>
	<%@include file="navBar.jsp"%>

	<div class="full-container">

		<div class="left-container">
			<h3>Add Doctor</h3>

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

			<form class="form-items" action="../addDoctor" method="POST">

				<label for="name" id="name">Full Name</label> <input type="text"
					id="name" name="full_name" required /> <label for="dob">DOB</label>
				<input type="date" id="dob" name="dob" required /> <label for="qua">Qualification</label>
				<input type="text" id="qua" name="qualification" required /> <label
					for="specialist">Specialist</label> <select name="specalist"
					id="specialist" required>
					<option value="">--select--</option>

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
					id="email" required /> <label for="phone">Mob No</label> <input
					type="tel" name="mob_no" id="phone" required /> <label
					for="password">Password</label> <input type="password"
					name="password" id="password" required /> <input type="submit"
					value="Submit" class="btn-submit" /> <a href="./view_doctor.jsp">View Doctors</a>

			</form>

		</div>


	</div>


</body>
</html>