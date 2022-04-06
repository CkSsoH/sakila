<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "dao.*"%>
<%@ page import = "vo.*"%>
<%
String category = request.getParameter("category");
	String rating = request.getParameter("rating");
	double price = -1; // price 데이터가 입력되지 않았을때
	if(!request.getParameter("price").equals("")) {
		price = Double.parseDouble(request.getParameter("price"));
	}
	int length = -1; // length 데이터가 입력되지 않았을때
	if(!request.getParameter("length").equals("")) {
		length = Integer.parseInt(request.getParameter("length"));
	}
	String title = request.getParameter("title");
	String actor = request.getParameter("actor");
	
	int beginRow = 0;
	int rowPerPage = 10;
	
	FilmDao filmDao = new FilmDao();
	List<FilmList> list = filmDao.selectFilmListSearch(beginRow ,rowPerPage ,category, rating, price, length, title, actor);
	System.out.println(list.size()); // 0
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filmSearchAction</title>
	<!-- bootstrap 4 불러와서 사용하겠음 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container"><!-- 화면(고정너비 컨텐츠 사용할거임) -->
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
					for(FilmList f : list) {
				%>
						<tr class = "table-success">
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
	</div>
</body>
</html>