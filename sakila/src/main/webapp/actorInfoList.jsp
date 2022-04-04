<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="dao.ActorInfoDao" %>
<%@ page import ="vo.ActorInfo" %>
<%
	//현재 페이지
	int currentPage = 1;

	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		System.out.println(currentPage + "<--currentPage");
	}
	//한 페이지당 10개
	int rowPerPage = 10;
	if(request.getParameter("rowPerPage") != null){
		rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		System.out.println(rowPerPage + "<--rowPerPage");
	}
	int beginRow = (currentPage - 1) * rowPerPage;
		System.out.println(beginRow + "<--beginRow");
	
	int totalRow = 0;
	List<ActorInfo> list = new ArrayList<ActorInfo>();
	ActorInfoDao actorInfoDao = new ActorInfoDao();
	list = actorInfoDao.selectActorInfoListByPage(beginRow, rowPerPage);
	totalRow = actorInfoDao.selectActorInfoTotalRow(); 
	System.out.println(totalRow+"<--totalRow");
	
	int lastPage = 0;
	if(totalRow % rowPerPage == 0) {
		lastPage = totalRow / rowPerPage;
	} else {
		lastPage = (totalRow / rowPerPage) + 1;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>actorInfo List</title>
	<!-- bootstrap 4 불러와서 사용하겠음 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container"><!-- 화면(고정너비 컨텐츠 사용할거임) -->
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-secondary" role="button">index</a>
		<div class ="container p-3 my-3 bg-dark text-white">
			<h1>actorInfo List</h1>
		</div>
		<table class="table table-hover">
			<thead>
				<tr class = "table-primary">
					<th>actorId</th>
					<th>firstName</th>
					<th>lastName</th>
					<th>filmInfo</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(ActorInfo a : list){
				%>
						<tr class = "table-warning">
							<td><%=a.getActorId()%></td>
							<td><%=a.getFirstName()%></td>
							<td><%=a.getLastName()%></td>
							<td><%=a.getFilmInfo()%></td>
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
					<a href="<%=request.getContextPath()%>/actorInfoList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-primary">이전</a>
			<%		
				}
			%>
			<%
				if(currentPage < lastPage) {
			%>
					<a href="<%=request.getContextPath()%>/actorInfoList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-success">다음</a>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>