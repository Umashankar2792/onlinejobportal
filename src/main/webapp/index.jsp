<%@ page import="com.db.DBconnect" %>

<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="all_component/all_css.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.back-img {
	background:
		url("https://universalbackground.com/wordpress/wp-content/uploads/2016/07/shutterstock_290015294.jpg");
	width: 100%;
	height: 90vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style> 
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>

	 
	

	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-black p-4"><i class="fa-solid fa-globe"></i>ONLINE JOB PORTAL</h1>
		</div>
	</div>
	<%@ include file= "all_component/footer.jsp" %>

</body>
</html>