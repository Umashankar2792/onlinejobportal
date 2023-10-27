<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class=" navbar navbar-expand-lg  bg-custom " data-bs-theme="dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<c:if test="${userobj.role eq 'admin'}"> 
						<li class="nav-item"><a class="nav-link" href="add_job.jsp"><i
								class="fa-solid fa-circle-plus"></i>Post job</a></li>
						<li class="nav-item"><a class="nav-link" href="view_jobs.jsp"><i
								class="fa-solid fa-eye"></i>View job</a></li>


					</c:if> 



				</ul>
				<form class="d-flex">
					<a href="signup.jsp" class="btn btn-light me-1"> <i
						class="fa-solid fa-user"></i>Signup
					</a> <a href="login.jsp" class="btn btn-light"><i
						class="fa-sharp fa-solid fa-right-to-bracket"></i>login</a>


				</form>
			</div>
		</div>
	</nav>

</body>
</html>