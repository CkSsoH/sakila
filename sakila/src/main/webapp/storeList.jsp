<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%
	StoreDao storeDao = new StoreDao();
	List<Map<String, Object>> list = storeDao.selectStoreList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store List</title>
	<!-- bootstrap 4 불러와서 사용하겠음 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container"><!-- 화면(고정너비 컨텐츠 사용할거임) -->
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-secondary" role="button">index</a>
		<div class ="container p-3 my-3 bg-dark text-white"> <!-- 상단타이틀 -->
			<h1>Store List</h1>
		</div>
		<table  class="table table-hover">
			<thead>
				<tr class = "table-primary">
					<th>storeId</th>
					<th>staffId</th>
					<th>staffName</th>
					<th>addressId</th>
					<th>staffAddress</th>
					<th>lastUpdate</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(Map m : list){
				%>
						<tr class ="table-danger">
							<td><%=m.get("storeId")%></td>
							<td><%=m.get("staffId")%></td>
							<td><%=m.get("staffName")%></td>
							<td><%=m.get("addressId")%></td>
							<td><%=m.get("staffAddress")%></td>
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