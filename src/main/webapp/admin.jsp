<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>
<style>
.img-back {
	background-image:
		url("https://thumbs.dreamstime.com/b/admin-realistic-neon-sign-brick-wall-background-d-rendered-royalty-free-stock-image-can-be-used-online-banner-ads-87933543.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	height: 90vh;
	width: 100%; 
}
</style>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${userobj.role ne 'admin'}">
	<c:redirect url ="login.jsp"></c:redirect>
	</c:if>



	<div class="container-fluid img-back">
		<div class="text-center">
			<h1 class="text-white p-4"><i class="fa-solid fa-user-secret"></i>Welcome Admin</h1>
		</div>
	</div>



</body>
</html>