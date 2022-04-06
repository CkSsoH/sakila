<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.FilmDao"%>
<%@ page import="vo.FilmList"%>
<%@ page import="java.util.*"%>
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
	List<FilmList> list = new ArrayList<FilmList>();
	FilmDao filmDao = new FilmDao();
	list = filmDao.selectFilmListByPage(beginRow, rowPerPage);
	totalRow = filmDao.selectFilmListTotalRow();
	System.out.println(totalRow+"<--selectFilmListTotalRow");
	
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
<title>film List</title>
	<!-- bootstrap 4 불러와서 사용하겠음 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container"><!-- 화면(고정너비 컨텐츠 사용할거임) -->
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-secondary" role="button">index</a>
		<div class ="container p-3 my-3 bg-dark text-white">
			<h1>film List</h1>
		</div>
		<table class="table table-hover">
			<thead>
				<tr class = "table-primary">
					<th>Fid</th>
					<th>title</th>
					<th>description</th>
					<th>Category</th>
					<th>price</th>
					<th>length</th>
					<th>rating</th>
					<th>actors</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(FilmList f : list){
				%>
						<tr class = "table-warning">
							<td><%=f.getFid()%></td>
							<td><%=f.getTitle()%></td>
							<td><%=f.getDescription()%></td>
							<td><%=f.getCategory()%></td>
							<td><%=f.getPrice()%></td>
							<td><%=f.getLength()%></td>
							<td><%=f.getRating()%></td>
							<td><%=f.getActors()%></td>
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
					<a href="<%=request.getContextPath()%>/filmList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-primary">이전</a>			
			<%
				}
			%>
			<%
				if(currentPage < lastPage){
			%>
					<a href="<%=request.getContextPath()%>/filmList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-success">다음</a>
			<%		
				}
			%>
		</div>
	</div>
</body>
</html>