<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="dao.*" %>
<%
	int storeId = -1; //입력되지 않았을때 초기화값
	if(request.getParameter("storeId") != null){ //스토어ID를 선택했다면 선택한값 받아서 int로 형변환
		storeId = Integer.parseInt(request.getParameter("storeId"));
	}
	String customerName = request.getParameter("customerName");
		System.out.println(customerName + "<--customerName");
		
	String beginDate = request.getParameter("beginDate");
		System.out.println(beginDate + "<--beginDate");

	String endDate = request.getParameter("endDate");
		System.out.println(endDate + "<--endDate");

	
	//페이징
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		System.out.println(currentPage + "<--currentPage");
	}
	int rowPerPage = 10;
	if(request.getParameter("rowPerPage") != null){
		rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		System.out.println(rowPerPage + "<--rowPerPage");
	}
	int beginRow = (currentPage -1) * rowPerPage;
	System.out.println(beginRow + "<--beginRow");
	
	RentalDao rentalDao = new RentalDao();
	List<Map<String, Object>> list = rentalDao.selectRentalSearchList(storeId, customerName, beginDate, endDate, beginRow, rowPerPage);
	int totalRow = rentalDao.selectRentalTotalRow(storeId, customerName, beginDate, endDate);
	int lastPage = (int)(Math.ceil((double)totalRow / (double)rowPerPage));
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rentalSearchAction</title>
	<!-- bootstrap 4 불러와서 사용하겠음 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container"><!-- 화면(고정너비 컨텐츠 사용할거임) -->
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-secondary" role="button">index</a>
		<div class ="container p-3 my-3 bg-dark text-white">
			<h1>검색 된 고객정보 리스트</h1>
		</div>
		<table class="table table-hover">
			<thead>
				<tr class = "table-primary">
					<th>rentalId</th>
					<th>storeId</th>
					<th>staffId</th>
					<th>inventoryId</th>
					<th>customerId</th>
					<th>customerName</th>
					<th>rentalDate</th>
					<th>returnDate</th>
					<th>filmId</th>
					<th>title</th>
					
				</tr>
			</thead>
			<tbody>
				<%
					for(Map<String,Object> m : list){
				%>
					<tr class = "table-success">
						<td><%=m.get("rentalId")%></td>
						<td><%=m.get("storeId")%></td>
						<td><%=m.get("staffId")%></td>
						<td><%=m.get("inventoryId")%></td>
						<td><%=m.get("customerId")%></td>
						<td><%=m.get("customerName")%></td>
						<td><%=m.get("rentalDate")%></td>
						<td><%=m.get("returnDate")%></td>
						<td><%=m.get("filmId")%></td>
						<td><%=m.get("title")%></td>
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
					<!-- 받은 storeId, customerName, beginDate, endDate 값 같이 넘김 -->
					<a href="<%=request.getContextPath()%>/rentalSearchAction.jsp?currentPage=<%=currentPage-1%>&storeId=<%=storeId%>&customerName=<%=customerName%>&beginDate=<%=beginDate%>&endDate=<%=endDate%>" class="btn btn-outline-info">이전</a>
			<%
				}
				if(currentPage < lastPage) {
			%>
					<!-- 받은 storeId, customerName, beginDate, endDate 값 같이 넘김 -->
					<a href="<%=request.getContextPath()%>/rentalSearchAction.jsp?currentPage=<%=currentPage+1%>&storeId=<%=storeId%>&customerName=<%=customerName%>&beginDate=<%=beginDate%>&endDate=<%=endDate%>" class="btn btn-outline-info">다음</a>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>