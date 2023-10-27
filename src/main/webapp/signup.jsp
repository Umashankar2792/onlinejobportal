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
</head>
<body style="background-color: #f0f1f2;">

	<%@ include file="all_component/navbar.jsp"%>


	<div class="container-fluid mt-5">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa-sharp fa-solid fa-user-plus"></i>
							<h5>Registration</h5>
							<c:if test="${not empty msg}">
							<h5 class="text-success text-center">"${msg}"</h5>
							<c:remove var="msg"/>
							</c:if>							<form action="adduser" method="post">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="floatingInput"
									name="name" placeholder="name@example.com"> <label
									for="floatingInput">Enter full name</label>
							</div>
							<div class="form-floating">
								<input type="text" class="form-control"
									id="floatingPassword"  name="qua">
								<label for="floatingPassword">Enter Qualification</label>
							</div>
							<div class="form-floating mb-3 mt-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="name@example.com" name="email"> <label
									for="floatingInput">Email address</label>
							</div>
							<div class="form-floating">
								<input type="password" name="ps" class="form-control"
									id="floatingPassword" placeholder="Password"> <label
									for="floatingPassword">Password</label>
								<button type="submit" class="btn m-3 pe-4 ps-4 btn-success">Signup</button>
							</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>