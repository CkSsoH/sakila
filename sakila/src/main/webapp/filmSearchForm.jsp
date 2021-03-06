<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%
CategoryDao categoryDao = new CategoryDao();
	List<Category> categoryList = categoryDao.selectCategoryList();	
	FilmDao filmDao = new FilmDao();
	List<Double> priceList = filmDao.selectfilmPriceList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>filmSearchForm</title>
	<!-- bootstrap 4 불러와서 사용하겠음 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container"><!-- 화면(고정너비 컨텐츠 사용할거임) -->
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-secondary" role="button">index</a>
		<div class ="container p-3 my-3 bg-dark text-white">
			<h1>필름 리스트 뷰 검색</h1>
		</div>
		<form action="<%=request.getContextPath()%>/filmSearchAction.jsp" method="post">
			<table class="table table-hover">
				<tr>
					<td class = "table-primary">카테고리</td>
					<td class = "table-success">
						<select name="category">
							<option value="">카테고리선택</option>
							<%
								for(Category c : categoryList) {
							%>
									<option value="<%=c.getName()%>"><%=c.getName()%></option>
							<%		
								}
							%>
						</select>				
					</td>
				</tr>
				<tr>
					<td class = "table-primary">등급</td>
					<td class = "table-success">
						<select name="rating" >
							<option value="">등급선택</option>
							<option value="G">G</option>
							<option value="PG">PG</option>
							<option value="PG-13">PG-13</option>
							<option value="R">R</option>
							<option value="NC-17">NC-17</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class = "table-primary">대여료</td>
					<td class = "table-success">
						<div><input type="radio" name="price" value="" checked="checked">선택안함</div>
						<%
							for(Double p : priceList) {
						%>
								<div><input type="radio" name="price" value="<%=p%>"><%=p%></div>
						<%		
							}
						%>
					</td>
				</tr>
				<tr>
					<td class = "table-primary">영화시간</td>
					<td class = "table-success">
						<div><input type="radio" name="length" value="" checked="checked">선택안함</div>
						<div><input type="radio" name="length" value="0">1시간 미만</div><!-- length < 60 -->
						<div><input type="radio" name="length" value="1">1시간 이상</div><!-- length >= 60 -->
					</td>
				</tr>
				<tr>
					<td class = "table-primary">제목 검색</td>
					<td class = "table-success">
						<input type="text" name="title">
					</td>
				</tr>
				<tr>
					<td class = "table-primary">배우 검색</td>
					<td class = "table-success">
						<input type="text" name="actor">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-info">검색</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>