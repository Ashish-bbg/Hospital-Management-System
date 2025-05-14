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
<title>User Appointement</title>
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

.right-container {
	box-shadow: 0px 2px 9px 4px grey;
	border-radius: 10px;
	/*width: 60%;*/
	margin-top: 1.5rem;
	margin-right: 1rem;
	padding: 1rem;
}


.line {
	border-bottom: 1.5px solid black;
	margin-left: 10px;
}

.line-bottom {
	border-bottom: 1.1px solid #d9d0d0;
}

.btn {
	background-color: #198754;
	text-decoration: none;
	border: 1px solid;
	padding: 5px 10px;
	border-radius: 7px;
	margin-top: 1rem;
	color: white;
}

.btn a {
	text-decoration: none; 
	color: white;

}


</style>

</head>
<body>
	<%@include file="../component/navBar.jsp"%>
	
	<c:if test="${empty userObj}">
		<c:redirect url="user_login.jsp?redirect=user_appointement.jsp"></c:redirect>
	</c:if>

	<div class="full-container">

		<div class="left-container">
			<h3>User Appointement</h3>

			<c:if test="${not empty errorMsg}">
				<span class="remove" style="color: red">${errorMsg}</span>
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

			<form class="form-items" action="appAppointment" method="POST">

				<label for="name" id="name">Full Name</label>
				 <input type="text"
					id="name" name="full_name" required />
				 <label for="age">Age</label>
				<input type="text" id="age" name="age" required />
				 <label for="gender">Gender</label>
				
				 <select id="gender" name="gender" required>
					<option value="male">Male</option> 
					<option value="female">Female</option>
				 </select>
				 
				 <label for="email">Email</label> 
				<input type="email" name="email"
					id="email" required />
				<label for="phone">Mob No</label>
				 <input type="tel" name="mob_no" id="phone" required /> 
				 
				 
				 <label for="appointment">Appointment Date</label>
				  <input type="date" id="appointment" name="appoint_date" />
				  
				  <label for="doctor">Doctor</label>
				  <select name="doct"
					id="doctor" required>
					<option value="">--select--</option>
					<% DoctorDao dao = new DoctorDao(DBConnect.getConn());
						List<Doctor> list = dao.getAllDoctor();	  
						for(Doctor d: list){%>
							<option value="<%= d.getId() %>"><%= d.getFullName() %> (<%= d.getSpecialist() %>) </option>
							<%
						}
					%>		
					
					
				</select> 
				
				<label for="Diseases">Diseases</label>
				 <input type="text"	name="diseases" id="diseases" required />
				  <label for="address">Full Address</label>
				  <textarea name="full_address" id="address" rows="3" cols=""></textarea>
				 
				 
				 <c:if test="${not empty userObj}">
				 	<input class="btn" type="submit" value="submit" />
					<input type="hidden" name="userid" value="${userObj.id}" />
					
				 </c:if>
				  
				  <a href="./view_appointment.jsp">View Appointement</a>
			</form>

		</div>


	</div>


</body>
</html>