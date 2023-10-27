<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<%@ page import="com.db.DBconnect"%>
<%@ page import="com.dao.jobDAO"%>
<%@ page import="com.entity.jobs"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Home</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body>
	<div class="container">
		<div class="text-center text-success">
			<h4>All Jobs</h4>
		</div>
	</div>
	<div class="container-fluid flex">
		<div class="row g-3">
			<div class="">
				<div class="card">
					<div class="card-body">
						<div class="row g-3">
							<form action="more_view.jsp" method="get">



								<div class="col-md-5 mt-2 position-relative">
									<label for="validationTooltip04" class="form-label">Location</label>
									<select name="location" class="form-select"
										id="validationTooltip04" required>
										<option selected disabled value="">Choose...</option>
										<option value="Karnataka">Karnataka</option>
										<option value="Jharkand">Jharkand</option>
										<option value="Tamil Nadu">Tamil Nadu</option>
										<option value="Andhra Pradesh">Andhra Pradesh</option>
										<option value="Delhi">Delhi</option>
										<option value="Kashmir">Kashmir</option>
										<option value="Maharastra">Maharastra</option>
										<option value="Gujurat">Gujurat</option>
									</select> <label for="validationTooltip04" class="mt-2 form-label">Category</label>
									<select name="category" class="form-select"
										id="validationTooltip04" required>
										<option selected disabled value="">Choose...</option>
										<option value="It">It</option>
										<option value="Banking">Banking</option>
										<option value="Sales">Sales</option>
										<option value="Government">Government</option>
										<option value="Teacher">Teacher</option>
										<option value="Online">Online</option>
										<option value="Fieldwork">Fieldwork</option>
									</select>
									<button type="submit" class="btn mt-2 btn-success">Submit</button>
								</div>
							</form>



						</div>



					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	jobDAO dao = new jobDAO(DBconnect.getconn());
	List<jobs> list = dao.getAllJobs();
	for (jobs j : list) {
	%>

	<div class="container-fluid">
		<div class="card mt-2">
			<div class="card-body">
				<div class="text-success text-center">
					<i class="fa-solid fa-briefcase"></i>

				</div>
				<h6><%=j.getTittle()%></h6>
				<%
				if (j.getDescription().length() > 0 && j.getDescription().length() < 200) {
				%>
				<p><%=j.getDescription()%></p>
				<%
				} else {
				%>
				<p><%=j.getDescription()%>...
				</p>
				<%
				}
				%>
				<br>
				<form class="row g-3 needs-validation ms-2" novalidate>
					<div class="col-md-3">
						<label for="validationCustom01" class="form-label">
							Location</label> <input type="text" class="form-control"
							id="validationCustom01" value="Location:<%=j.getLocation()%>"
							readonly>
						<div class="valid-feedback">Looks good!</div>
					</div>
					<div class="col-md-3">
						<label for="validationCustom01" class="form-label">Category
						</label> <input type="text" class="form-control" id="validationCustom01"
							value="Category:<%=j.getCategory()%>" readonly>
						<div class="valid-feedback">Looks good!</div>
					</div>
				</form>
			</div>
			<h6 class="ms-3">
				Publish Date
				<%=j.getPdate().toString()%></h6>
			<div class="text-center text-success">
				<a href="one_view.jsp?id=<%=j.getId()%>">
					<button type="button" class=" mb-2 btn btn-success">View More</button>

				</a>

			</div>
		</div>
	</div>
	<%
	}
	%>


</body>
</html>