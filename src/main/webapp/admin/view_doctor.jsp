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
	justify-content: center;
}

.right-container h3 {
	text-align: center;
	font-weight: 400;
	font-size: 22px;
	margin-top: 10px;
}

.right-container {
	box-shadow: 0px 2px 9px 4px grey;
	border-radius: 10px;
	/*width: 60%; */
	margin-top: 1.5rem;
	margin-right: 1rem;
	padding: 1rem;
}

table {
	/*border-collapse: separate;
	border-spacing: 14px 0;*/
	
}

th, td {
	padding: 10px;
	font-size: 14px;
}

td {
	
}

.line {
	border-bottom: 1.5px solid black;
	margin-left: 10px;
}

.line-bottom {
	border-bottom: 1.1px solid #d9d0d0;
}

.btn-edit, .btn-delete {
	color: white;
	text-decoration: none;
	padding: 5px 10px;
	border-radius: 7px;
}

.btn-edit {
	background-color: blue;
}

.btn-delete {
	background-color: red;
}

.btn-edit:hover, .btn-delete:hover {
	background-color: white;
	border: 0.3px solid black;
}



.msg {
	text-align: center;
	color: green;
	font-size: 16px;
}
</style>

</head>
<body>
	<%@include file="navBar.jsp"%>

	<div class="full-container">


		<div class="right-container">

			<c:if test="${not empty errorMsg }">
				<p class="msf">${errorMsg}</p>
				<c:remove var="errorMsg" scope="session" />
			</c:if>

			<c:if test="${not empty succMsg }">
				<p class="msg">${succMsg}</p>
				<c:remove var="succMsg" scope="session" />
			</c:if>

			<script>
			setTimeout(() => {
					let msg = document.querySelector(".msg");
					msg.style.display = "none";
					}, 2000);	
			
			</script>

			<h3>Doctor Details</h3>
			<table>
				<thead>
					<tr>
						<th class="more_space">Full Name</th>
						<th class="more_space">DOB</th>
						<th class="more_space qua_space">Qualification</th>
						<th class="more_space">Specialist</th>
						<th class="more_space">Email</th>
						<th class="more_space">Mob No</th>
						<th>Action</th>
					</tr>
				</thead>

				<tbody>
					<tr class="line"></tr>
					<%
					DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
					List<Doctor> doc_list = dao2.getAllDoctor();
					for (Doctor d : doc_list) {
					%>
					<tr class="line-bottom">
						<td><%=d.getFullName()%></td>
						<td><%=d.getDob()%></td>
						<td><%=d.getQualification()%></td>
						<td><%=d.getSpecialist()%></td>
						<td><%=d.getEmail()%></td>
						<td><%=d.getMobNo()%></td>
						<td><a href="editDoctor.jsp?id=<%=d.getId()%>" class="btn-edit">Edit</a>
							<a class="btn-delete" href="../deleteDoctor?id=<%=d.getId()%>">Delete</a></td>
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