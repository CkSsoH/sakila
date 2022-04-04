<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="vo.CustomerList" %>
<%@ page import ="dao.CustomerListDao" %>
<%
	int currentPage = 1;

	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		System.out.println(currentPage + "<--currentPage");
	}
	
	// 페이지당 10개씩
	int rowPerPage = 10;
	if(request.getParameter("rowPerPage") != null){
		rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		System.out.println(rowPerPage + "<--rowPerPage");
	}
	int beginRow = (currentPage - 1) * rowPerPage;
	System.out.println(beginRow + "<--beginRow");
	
	int totalRow = 0;
	List<CustomerList> list = new ArrayList<CustomerList>();
	CustomerListDao customerListDao = new CustomerListDao();
	list = customerListDao.selectCustomerListByPage(beginRow, rowPerPage);
	totalRow = customerListDao.totalRow();
	System.out.println(totalRow+"<--totalRow");
	
	int lastPage = 0;
	if(totalRow % rowPerPage == 0){
		lastPage = totalRow / rowPerPage;
	} else {
		lastPage = (totalRow / rowPerPage) + 1;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customerList</title>
	<!-- bootstrap 4 불러와서 사용하겠음 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container"><!-- 화면(고정너비 컨텐츠 사용할거임) -->
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-secondary" role="button">index</a>
		<div class ="container p-3 my-3 bg-dark text-white">
			<h1>customer List</h1>
		</div>
		<table class="table table-hover">
			<thead>
				<tr class = "table-primary">
					<th>iD</th>
					<th>name</th>
					<th>address</th>
					<th>zipCode</th>
					<th>phone</th>
					<th>city</th>
					<th>country</th>
					<th>notes</th>
					<th>sId</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(CustomerList c : list){
				%>
						<tr class = "table-warning">
							<td><%=c.getId()%></td>
							<td><%=c.getName()%></td>
							<td><%=c.getAddress()%></td>
							<td><%=c.getZipCode()%></td>
							<td><%=c.getPhone()%></td>
							<td><%=c.getCity()%></td>
							<td><%=c.getCountry()%></td>
							<td><%=c.getNotes()%></td>
							<td><%=c.getsId()%></td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<div>
			<%
				if(currentPage > 1) {
			%>
					<a href="<%=request.getContextPath()%>/customerList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-primary">이전</a>			
			<%
				}
			%>
			<%
				if(currentPage < lastPage){
			%>
					<a href="<%=request.getContextPath()%>/customerList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-success">다음</a>
			<%		
				}
			%>
		</div>
	</div>
</body>
</html>