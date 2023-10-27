<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<%@ page import="com.db.DBconnect"%>
<%@ page import="com.dao.jobDAO"%>
<%@ page import="com.entity.jobs"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit page</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${userobj.role ne 'admin'}">
	<c:redirect url ="login.jsp"></c:redirect>
	</c:if>

	<div class="container  mt-4 p-2">

		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">

					<div class="text-center text-success">
						<i class="fa-solid fa-user-group"></i>
						<%
						jobDAO dao = new jobDAO(DBconnect.getconn());
						int id = Integer.parseInt(request.getParameter("id"));
						jobs j = dao.getJobById(id);
						%>


						<h1>Edit jobs</h1>

						<br> 
					</div>
					



					<form action="update" method="post"
						class="row g-3 needs-validation" novalidate>
											<input type="hidden"  name="id" value="<%=j.getId()%>" >
						
						<div>
							<label for="validationCustom01" class="form-label">Enter
								Job Tittle </label> <input value="<%=j.getTittle()%>" name="tittle"
								type="text" class="form-control" id="validationCustom01"
								required>
							<div class="valid-feedback">Looks good!</div>
						</div>
						<br>


						<div class="col-md-4 position-relative">
							<label for="validationTooltip04" class="form-label">Location</label>
							<select name="location" class="form-select"
								id="validationTooltip04" required>
								<option value="<%=j.getLocation()%>"><%=j.getLocation()%></option>
								<option value="Karnataka">Karnataka</option>
								<option value="Jharkand">Jharkand</option>
								<option value="Tamil Nadu">Tamil Nadu</option>
								<option value="Andhra Pradesh">Andhra Pradesh</option>
								<option value="Delhi">Delhi</option>
								<option value="Kashmir">Kashmir</option>
								<option value="Maharastra">Maharastra</option>
								<option value="Gujurat">Gujurat</option>
							</select>
							<div class="invalid-tooltip">Please select a valid state.</div>
						</div>
						<div class="col-md-4 position-relative">
							<label for="validationTooltip04" class="form-label"><%=j.getCategory()%></label>
							<select name="category" class="form-select"
								id="validationTooltip04" required>
								<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>
								<option value="It">It</option>
								<option value="Banking">Banking</option>
								<option value="Sales">Sales</option>
								<option value="Government">Government</option>
								<option value="Teacher">Teacher</option>
								<option value="Online">Online</option>
								<option value="Fieldwork">Fieldwork</option>
							</select>
							<div class="invalid-tooltip">Please select a valid state.</div>
						</div>
						<div class="col-md-4 position-relative">
							<label for="validationTooltip04" class="form-label">status</label>
							<select name="status" class="form-select"
								id="validationTooltip04" required>
								<option name="status" value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
								<option value="Active">Active</option>
								<option value="InActive">InActive</option>
							</select>
							<div class="invalid-tooltip">Status</div>
						</div>
						<br> Enter Description
						<div class="form-floating">
							<textarea name="desc" class="form-control"
								placeholder="Leave a comment here" id="floatingTextarea2"
								style="height: 150px"></textarea>
							<label value="<%=j.getDescription()%>" for="floatingTextarea2"><%=j.getDescription()%></label>
						</div>
						<button type="submit" class="btn col-md-3 btn-success">Update
							Job</button>

					</form>


				</div>
			</div>
		</div>
	</div>






</body>
</html>