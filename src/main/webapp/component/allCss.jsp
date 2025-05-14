<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
.login-form-container {
	box-shadow: 2px 2px 8px 2px grey;
	width: 400px;
	padding: 1rem;
	margin: 3rem auto;
	border-radius: 10px;
}

.login-form-container h2 {
	text-align: center;
	font-size: 1.7rem;
	font-weight: 400;
}

.login-form-container input {
	width: 100%;
	margin: 5px 0 10px 0;
}

.login-btn {
	margin-top: 1em;
	background-color: #198754;
	color: white;
	font-weight: 500;
	border-radius: 4px;
	padding: 5px 0;
	font-size: 14px;
	border: none;
}

.login-form-container p {
	margin: 1rem 0 0.2rem 0;
}

.login-form-container a {
	text-decoration: none;
}

.full-container {
	
	display: flex;
	width: 100%;
	justify-content: center;
}

.left-container {
	/* border: 1px solid green; */
	/*width: 29%;*/
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

.btn {
	color: white;
	text-decoration: none;
	border: 1px solid;
	padding: 5px 10px;
	border-radius: 7px;
}

.btn:first-child {
	background-color: transparent;
}

.btn:nth-child(2) {
	background-color: red;
}

.btn-sucess {
	color: white; 
	background-color: green;
	text-decoration: none;
	border: 1px solid;
	padding: 5px 10px;
	border-radius: 7px;

}
 
.btn:hover {
	background-color: #c9c2c25e;
}

.btn-sucess:hover {
	background-color: #c9c2c25e;
}
.msg {
	text-align: center;
	color: green;
	font-size: 16px;
}

.btn-pending {
	text-decoration: none;
	background-color: #ffc107;
	padding: 5px 10px;
	border-radius: 5px;
	color: black;
}
</style>


</head>
<body>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>