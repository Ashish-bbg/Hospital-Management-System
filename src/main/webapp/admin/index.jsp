<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	justify-content: space-between;
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



.btn:hover {
		
}
</style>

</head>
<body>
	<%@ include file="navBar.jsp"%>
	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty errorMsg}">
		<span class="msg">${errorMsg}</span>
		<c:remove var="errorMsg" scope="session" />
	</c:if>


	<h2 class="admin-title">Admin Dashboard</h2>

			<%
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			int doctCnt = dao.countDoctor();
			int userCnt = dao.countUser();
			int appointCnt = dao.countAppointment();
			int specalistCnt = dao.countSpecalist();
			%>
	<div class="card-container">

		<div class="card-content">
			<i class="fa-solid fa-user-doctor fa-3x" style="color: #198754;"></i>

			<p>Doctor</p>
			<p><%=doctCnt%></p>
		</div>

		<div class="card-content">
			<i class="fa-solid fa-user fa-3x" style="color: #198754;"></i>
			<p>User</p>
			<p><%=userCnt%></p>
		</div>

		<div class="card-content">
			<i class="fa-solid fa-calendar-check fa-3x" style="color: #198754;"></i>
			<p>Total Appointment</p>
			<p><%=appointCnt%></p>
		</div>

		<div class="card-content" data-bs-toggle="modal"
			data-bs-target="#exampleModal">
			<i class="fa-solid fa-calendar-check fa-3x" style="color: #198754;"></i>
			<p>Specialist</p>
			<p><%=specalistCnt%></p>

			<c:if test="${not empty succMsg}">
				<span class="msg" style="color: green; text-align: center">${succMsg}</span>
				<c:remove var="succMsg" scope="session" />
			</c:if>

			<script>
				setTimeout(() => {
					let msg = document.querySelector(".msg");
					msg.style.display = "none";
				}, 2000);
			</script>

		</div>


		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Specialist</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<form action="../addSpecalist" method="POST">
							<div class="form-group">
								<label>Enter Specialist Name</label> <input type="text"
									class="form-control" name="specName" />
							</div>
							<button style="margin-top: 5px;" type="submit"
								class="btn btn-primary">Add</button>
						</form>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>

					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>