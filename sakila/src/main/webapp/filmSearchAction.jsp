<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "dao.*"%>
<%@ page import = "vo.*"%>
<%
	// 검색 값 받아오기 
	String category ="";
	if(request.getParameter("category") != null){
		category = request.getParameter("category");
		System.out.println(category + "<--category");
	}
	String rating = "";
	if(request.getParameter("rating") != null){ //불러온 값이 null 이 아니면
		rating = request.getParameter("rating");
		System.out.println(rating + "<--rating");
	}
	double price = -1; // price 데이터가 입력되지 않았을때
	if(!request.getParameter("price").equals("")) { //불러온 값이 공백이 아니면
		price = Double.parseDouble(request.getParameter("price"));
		System.out.println(price + "<--price");
	}
	int length = -1; // length 데이터가 입력되지 않았을때
	if(!request.getParameter("length").equals("")) {
		length = Integer.parseInt(request.getParameter("length"));
		System.out.println(length + "<--length");
	}
	String title = "";
	if(request.getParameter("title") != null){
		title = request.getParameter("title");
		System.out.println(title + "<--title");
	}
	String actors = "";
	if(request.getParameter("actors") != null){
		actors = request.getParameter("actors");
		System.out.println(actors + "<--actors");
	}
	
	
	// 페이징
	int currentPage = 1; // 현재페이지 초기화
	if(request.getParameter("currentPage") != null){ // 이전, 다음 버튼을 통해 들어왔다면 currentPage에 페이지수 적용
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		System.out.println(currentPage + "<--currentPage");
	}
	int rowPerPage = 10;
	int beginRow = (currentPage - 1) * rowPerPage;
	
	FilmDao filmDao = new FilmDao();
	int totalCount = filmDao.selectFilmSearchTotalRow(category, rating, price, length, title, actors); // 데이터의 수
	int lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage));
	
	List<FilmList> list = filmDao.selectFilmListSearch(beginRow ,rowPerPage ,category, rating, price, length, title, actors);
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
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-secondary" role="button">index</a>
		<div class ="container p-3 my-3 bg-dark text-white">
			<h1>검색 된 영화 목록</h1>
		</div>
		<table class="table table-hover">
			<thead>
				<tr class = "table-primary">
					<th>FID</th>
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
		<div>
			<%
				if(currentPage > 1) { // currentPage가 1보다 클 때 이전 버튼 보임
			%>
					<a href="<%=request.getContextPath()%>/filmSearchAction.jsp?currentPage=<%=currentPage-1%>&category=<%=category%>&rating=<%=rating%>&price=<%=price%>&length=<%=length%>&title=<%=title%>&actors=<%=actors%>" class="btn btn-outline-info">이전</a>
			<%
				}
				if(currentPage < lastPage) { // currentPage가 lastPage보다 작을 때만 다음 버튼 보임
			%>
					<a href="<%=request.getContextPath()%>/filmSearchAction.jsp?currentPage=<%=currentPage+1%>&category=<%=category%>&rating=<%=rating%>&price=<%=price%>&length=<%=length%>&title=<%=title%>&actors=<%=actors%>" class="btn btn-outline-info">다음</a>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>