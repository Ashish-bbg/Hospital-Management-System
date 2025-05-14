<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../component/allCss.jsp"%>
<style>
	.disabled{
		background-color: #117f1182;
	}
	.disabled:hover{
		background-color: #117f1182;
		cursor:no-drop;
		color: white;
	}
</style>
</head>
<body>
	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@ include file="navBar.jsp"%>
	
	<c:if test="${not empty succMsg }">
		<h3 style="color: green">${succMsg}</h3>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty errorMsg }">
		<h3 style="color: red">${errorMsg}</h3>
		<c:remove var="errorMsg" scope="session"/>
	</c:if>

	<div class="full-container">


		<div class="right-container">



			<h3 style="color: green">Appointment List</h3>
			<table>
				<thead>
					<tr class="line">
						<th class="more_space">Full Name</th>
						<th class="more_space">Gender</th>
						<th class="more_space qua_space">Age</th>
						<th class="more_space">Appointment Date</th>
						<th class="more_space">Email</th>
						<th class="more_space">Mob No</th>
						<th class="more_space">Diseases</th>
						<th class="more_space">Status</th>
						<th class="more_space">Action</th>

					</tr>
				</thead>

				<tbody>
					<%
					Doctor doct = (Doctor) session.getAttribute("doctObj");
					AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
					List<Appointment> list = dao.getAllAppointmentByDoctorLogin(doct.getId());
					for (Appointment ap : list) {
					%>
					<tr>
						<td><%=ap.getFullName()%></td>
						<td><%=ap.getGender()%></td>
						<td><%=ap.getAge()%></td>
						<td><%=ap.getAppointDate()%></td>
						<td><%=ap.getEmail()%></td>
						<td><%=ap.getPhNo()%></td>
						<td><%=ap.getDiseases()%></td>
						<td><%=ap.getStatus()%></td>
						<td>
						
						<% if("pending".equals(ap.getStatus())) {%>
						
						<a href="comment.jsp?id=<%= ap.getId() %>" class="btn-sucess">Comment</a>
						<% }else{ %>
						<a href="#" class="btn-sucess disabled">Comment</a>
							
						<%} %>
						
						</td>
					<tr>
						<%
						}
						%>
					
				</tbody>
			</table>
		</div>
		<a href="./index.jsp">Go Back</a>

	</div>


</body>
</html>