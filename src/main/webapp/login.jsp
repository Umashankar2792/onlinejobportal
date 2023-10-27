<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="all_component/all_css.jsp"%>
<head>
<meta charset="UTF-8">
<title>login page</title>


</head>
<body style="background-color: #f0f1f2;">

	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid mt-5">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa-solid fa-user-large"></i>
							<form action="login" method="Post">

								<h5>Login page</h5>

								<div class="form-floating mb-3">

									<input type="email" class="form-control" id="floatingInput"
										placeholder="name@example.com" name="email"> <label
										for="floatingInput">Email address</label>
								</div>
								<div class="form-floating">
									<input type="password" class="form-control"
										id="floatingPassword" placeholder="Password" name="Password">
									<label for="floatingPassword">Password</label>
									<button type="submit" class="btn m-3 pe-4 ps-4 btn-success">Login</button>
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