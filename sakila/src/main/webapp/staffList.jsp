<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.StaffDao" %>
<%
	StaffDao staffDao = new StaffDao();
	List<Map<String, Object>> staffList = staffDao.selectStaffList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff List</title>
	<!-- bootstrap 4 불러와서 사용하겠음 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container"><!-- 화면(고정너비 컨텐츠 사용할거임) -->
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-secondary" role="button">index</a>
		<div class ="container p-3 my-3 bg-dark text-white">
			<h1>Staff List</h1>
		</div>
		<table class="table table-hover">
			<thead>
				<tr class = "table-primary">
					<th>staffId</th>
					<th>storeId</th>
					<th>staffName</th>
					<th>addressId</th>
					<th>picture</th>
					<th>staffAddress</th>
					<th>email</th>
					<th>active</th>
					<th>username</th>
					<th>password</th>
					<th>lastUpdate</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(Map m : staffList){
				%>
						<tr class = "table-danger">
							<td><%=m.get("staffId")%></td>
							<td><%=m.get("storeId")%></td>
							<td><%=m.get("staffName")%></td>
							<td><%=m.get("addressId")%></td>
							<td><%=m.get("picture")%></td>
							<td><%=m.get("staffAddress")%></td>
							<td><%=m.get("email")%></td>
							<td><%=m.get("active")%></td>
							<td><%=m.get("username")%></td>
							<td><%=m.get("password")%></td>
							<td><%=m.get("lastUpdate")%></td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>