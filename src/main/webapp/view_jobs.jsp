<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.db.DBconnect"%>
<%@ page import="com.dao.jobDAO"%>
<%@ page import="com.entity.jobs"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>


<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view jobs</title>
<%@include file="all_component/all_css.jsp"%>


</head>
<body style="background-color: #f0f1f2">
	<%@ include file="all_component/navbar.jsp"%>
<c:if test="${userobj.role ne 'admin'}">
	<c:redirect url ="login.jsp"></c:redirect>
	</c:if>


	<div class="container-fluid ">
		<div class="row">
			<div class="col-md-12">
			
				<h5 class="text-primary text-center">All Jobs</h5>
				<c:if test="${not empty msg }">
							<div class="alert alert-success" role="alert">${msg}</div>
							<c:remove var="msg" />
						</c:if>
				<%
				jobDAO dao = new jobDAO(DBconnect.getconn());
				List<jobs> list = dao.getAllJobs();
				for (jobs j : list) {
				%>
				<div class="container-fluid ">
					<div class="row">
						<div class="col-md-12">
							<div class="card mt-2">
								<div class="card-body">
									<div class="text-center text-primary">
										<i class="fa-regular fa-clipboard"></i>
									</div>
														<input type="hidden"  name="id" value="<%=j.getId()%>" >
									

									<h6><%=j.getTittle()%></h6>
									<h6><%=j.getDescription()%></h6>

								</div>
								<form class="row g-3 needs-validation ms-2" novalidate>
									<div class="col-md-3">
										<label for="validationCustom01" class="form-label">
											Location</label> <input type="text" class="form-control"
											id="validationCustom01"
											value="Location:<%=j.getLocation()%>" readonly>
										<div class="valid-feedback">Looks good!</div>
									</div>
									<div class="col-md-3">
										<label for="validationCustom01" class="form-label">Category
											</label> <input type="text" class="form-control"
											id="validationCustom01"
											value="Category:<%=j.getCategory()%>" readonly>
										<div class="valid-feedback">Looks good!</div>
									</div>
									<div class="col-md-3">
										<label for="validationCustom01" class="form-label">status
											</label> <input type="text" class="form-control"
											id="validationCustom01" value="Status:<%=j.getStatus()%>"
											readonly>
										<div class="valid-feedback">Looks good!</div>
									</div>
									<h5 class="ms-2">
										Publish Date:<%=j.getPdate()%></h5>
									<div class="text-center">
										<a href="edit_jobs.jsp?id=<%= j.getId() %>"
											class="btn btn-ms mb-2 btn-success text-white">Edit</a> <a
											href="delete?id=<%=j.getId() %>"
											class="btn btn-ms btn-danger mb-2 text-white">Delete</a>
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>





				<%
				}
				%>



			</div>
		</div>
	</div>


</body>
</html>