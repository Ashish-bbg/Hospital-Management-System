<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comment Page</title>
<%@ include file="../component/allCss.jsp"%>

<style>

	.main-container {
		
		
		margin: 51px auto;
	    width: 560px;
		padding: 10px;
		border-radius: 10px;
		box-shadow: 3px 2px 11px 4px grey;
	}
	
	.comment-container{
    	display: flex; 	
    	justify-content: space-around;
    	
	}
	
	.comment-container input {
		margin-bottom: 10px;
	}
	
	.left, .right{
		width: 45%;
		display: flex;
		flex-direction: column;
		
	}
	
	.right{
		}
		
	.bottom {
		
		display: flex;
		flex-direction: column;
		
	}
	
	
	.submit-btn {
		background-color: #198754;
		margin-top: 15px;
		text-align: center;
		color: white;
		border: none;
		padding: 5px;
		border-radius: 5px;
	}

</style>

</head>
<body>

	<c:if test="${empty doctObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	
	<%@ include file="navBar.jsp" %>
	
		
	<form action="../updateStatus" method="post">
	<div class="main-container">
			<div class="comment-container">
				<%
					int id = Integer.parseInt(request.getParameter("id"));
					AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
					Appointment ap = dao.getAppointmentById(id);
				%>
					<div class="left">
						<label for="name">Patient Name</label>
						<input type="text" name="patientName" id="name" value="<%= ap.getFullName() %>" />
					
					
					
						<label for="age">Age</label>
						<input type="text" name="age" id="age" value="<%= ap.getAge() %>" />
					</div>
					
					<div class="right">
						<label for="mobNo">Mob No</label>
						<input type="text" name="mobNo" id="mobNo" value="<%= ap.getPhNo() %>" />
						
						
						
						<label for="diseases">Diseases</label>
						<input type="text" name="diseases" id="diseases" value="<%= ap.getDiseases() %>" />
					</div>
					</div>
					<div class="bottom">
						<label for="comment">Comment</label>
						<textarea name="comm" id="comment"></textarea>
						<input type="submit" value="Submit" class="submit-btn" />
					</div>
					
					
			</div>
			<input type="hidden" name="id" value="<%= ap.getId() %>" />
			<input type="hidden" name="did" value="<%= ap.getDoctorId() %>" />
		</form>
		
	
	

</body>
</html>