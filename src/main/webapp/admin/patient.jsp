<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Patient</title>
<%@ include file="../component/allCss.jsp"%>
</head>
<body>
	
	<%@ include file="navBar.jsp"%>

	<div class="full-container">


		<div class="right-container">



			<h3 style="color: green">Appointment List</h3>
			<table>
				<thead>
					<tr class="line">
						<th class="more_space">Full Name</th>
						<th class="more_space">Gender</th>
						<th class="more_space qua_space">Age</th>
						<th class="more_space">Appoint Date</th>
						<th class="more_space">Email</th>
						<th class="more_space">Mob No</th>
						<th class="more_space">Diseases</th>
						<th class="more_space">Doctor Name</th>
						<th class="more_space">Address</th>
						<th class="more_space">Status</th>

					</tr>
				</thead>

				<tbody>
					<%
					AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
					DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
					List<Appointment> list = dao.getAllAppointment();
					for (Appointment ap : list) {
					Doctor d = dao2.getDoctorById(ap.getDoctorId());
					%>

					<tr>
						<td><%=ap.getFullName()%></td>
						<td><%=ap.getGender()%></td>
						<td><%=ap.getAge()%></td>
						<td><%=ap.getAppointDate()%></td>
						<td><%=ap.getEmail()%></td>
						<td><%=ap.getPhNo()%></td>
						<td><%=ap.getDiseases()%></td>
						<td><%=d.getFullName()%></td>
						<td><%=ap.getAddress()%></td>
						<td><%=ap.getStatus()%></td>
					</tr>

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