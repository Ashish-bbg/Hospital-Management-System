<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Page</title>
<%@ include file="../component/allCss.jsp"%>
<style>
.admin-title {
	text-align: center;
	margin-top: 2rem;
	font-weight: 400;
}

.card-container {
	margin: 2rem 6rem;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	
}
 
.card-content {
	width: 250px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 150px;
	color: green;
	box-shadow: 4px 3px 7px 2px grey;
	border-radius: 10px;
	cursor: pointer;
}

.card-content p {
	margin-bottom: 0;
	font-size: 19px;
}
</style>
</head>
<body>

	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@ include file="navBar.jsp"%>

	<h2 class="admin-title">Doctor Dashboard</h2>

	<div class="card-container">

		<div class="card-content">
			<i class="fa-solid fa-user-doctor fa-3x" style="color: #198754;"></i>
			<%
				Doctor d = (Doctor)session.getAttribute("doctObj");
				DoctorDao dao = new DoctorDao(DBConnect.getConn());
				int doctCnt = dao.countDoctor();
				int appDoctCnt = dao.countAppointmentByDoctorId(d.getId());
			%>
			<p>Doctor</p>
			<p><%=doctCnt %></p>
		</div>

		<div class="card-content">
			<i class="fa-solid fa-calendar-check fa-3x" style="color: #198754;"></i>
			<p>Total Appointment</p>
			<p><%=appDoctCnt %></p>
		</div>
	</div>
</body>
</html>