<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First Page</title>
<%@ include file="component/allCss.jsp"%>

<style>
.container {
	display: flex;
	justify-content: space-between;
}

.left-container {
	display: flex;
	flex-wrap: wrap;
	box-shadow: none;
}

.right-container {
	box-shadow: none;
}

.left-content {
	width: 45%;
	padding: 10px;
	margin: 10px;
	border-radius: 10px;
	box-shadow: 4px 3px 10px 0px grey;
}

.left-content p:first-child {
	font-size: 18px;
}

/*** main content style starts***/
.hr-border {
	margin-top: 3rem;
	border: 1px solid #bbb9b9f2;
}

.main-container {
	margin-top: 2rem;
}

.main-content {
	margin: 2% 8%;
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
}

.main-content-box {
	width: 22%;
	height: 300px;
	text-align: center;
	padding-top: 1em;
	border-radius: 10px;
	box-shadow: 4px 3px 10px 0px grey;
}

.main-content-box h3:nth-of-type(1) {
	font-size: 20px;
}

.image-container {
	
}

.image-container img {
	width: 95%;
	object-fit: cover;
}
</style>

</head>
<body>
	<%@ include file="component/navBar.jsp"%>
	

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/hos1.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hos2.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/hos3.webp" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<h1 style="text-align: center; margin: 10px">Key Features of our
		Hospital</h1>

	<div class="container">
		<div class="left-container">
			<div class="left-content">
				<p>100% Safe</p>
				<p>While there isn't a hospital that can guarantee 100% safety,
					many hospitals in Hyderabad prioritize patient safety and provide a
					safe environment for care.</p>
			</div>
			<div class="left-content">
				<p>Clean Environment</p>
				<p>While there isn't a hospital that can guarantee 100% safety,
					many hospitals in Hyderabad prioritize patient safety and provide a
					safe environment for care.</p>
			</div>
			<div class="left-content">
				<p>Friendly Doctors</p>
				<p>While there isn't a hospital that can guarantee 100% safety,
					many hospitals in Hyderabad prioritize patient safety and provide a
					safe environment for care.</p>
			</div>
			<div class="left-content">
				<p>Medical Research</p>
				<p>While there isn't a hospital that can guarantee 100% safety,
					many hospitals in Hyderabad prioritize patient safety and provide a
					safe environment for care.</p>
			</div>
		</div>
		<div class="right-container">
			<img src="img/doc6.webp" alt="doctor image" height=350px />
		</div>
	</div>

	<div class="hr-border"></div>
	<div class="main-container">
		<h2 style="text-align: center">Our Team</h2>
		<div class="main-content">

			<div class="main-content-box">
				<div class="image-container">
					<img src="img/doc2.png" alt="doctor image" height="200px" />
				</div>
				<h3>Samuani Simi</h3>
				<p>(CEO & Chainrman)</p>
			</div>

			<div class="main-content-box">
				<div class="image-container">
					<img src="img/doc3.jpg" alt="doctor image" height="200px" />
				</div>
				<h3>Samuani Simi</h3>
				<p>(CEO & Chainrman)</p>
			</div>

			<div class="main-content-box">
				<div class="image-container">
					<img src="img/doc4.webp" alt="doctor image" height="200px" />
				</div>
				<h3>Samuani Simi</h3>
				<p>(CEO & Chainrman)</p>
			</div>

			<div class="main-content-box">
				<div class="image-container">
					<img src="img/doc1.jpg" alt="doctor image" height="200px" />
				</div>
				<h3>Samuani Simi</h3>
				<p>(CEO & Chainrman)</p>
			</div>

		</div>

	</div>

<%@ include file="component/footer.jsp" %>

</body>
</html>