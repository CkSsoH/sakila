<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "util.DBUtil" %>
<%@ page import = "dao.FilmDao" %>
<%@ page import = "java.util.*" %>
<%
	FilmDao fd = new FilmDao();
	Map<String,Object> map =new HashMap<>();
	
	int filmId = 0;
	if(request.getParameter("filmId")!=null){
		filmId= Integer.parseInt(request.getParameter("filmId"));
		System.out.println(filmId + "<--filmId");
	}
	int storeId = 0;
	if(request.getParameter("storeId")!=null){
		storeId= Integer.parseInt(request.getParameter("storeId"));
		System.out.println(storeId + "<--storeId");
	}

	if(storeId==999){
		response.sendRedirect(request.getContextPath()+"/filmNotInStock.jsp"); 
	}
	
	map=fd.filmNotInStockCall(filmId, storeId);
	List<Integer> list = (List<Integer>)(map.get("list"));
	int count =0;
	count = (Integer)(map.get("count"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>film not in stock</title>
	<!-- bootstrap 4 불러와서 사용하겠음 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container"><!-- 화면(고정너비 컨텐츠 사용할거임) -->
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-secondary" role="button">index</a>
		<div class ="container p-3 my-3 bg-dark text-white">
			<h1>film not in stock</h1>
		</div>
		<form method="post" action="<%=request.getContextPath()%>/filmNotInStock.jsp">
			<div class="form-group">
				<label for="usr">storeId</label>
				<select id="usr" name="storeId" class="form-control">
				<option value="999">선택하세요.</option>
				<option value="1">store 1</option>
				<option value="2">store 2</option>
			</div>
			<div class="form-group">
				<label for="usr">filmId</label>
				<input type="text" class="form-control" id="usr" name="filmId" >
			</div>
			<button type="submit" class="btn btn-info">검색</button>
			
			<table class="table table-hover">
				<thead>
					<tr class = "table-primary">
						<th>inventoryId (총 <%=count%>건 대여중)</th>
					</tr>
					
				</thead>
				<tbody>
					<%
						for(Integer i : list){
					%>
							<tr class = "table-secondary">
								<td><%=i%></td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>