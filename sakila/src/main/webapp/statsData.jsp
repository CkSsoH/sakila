<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="dao.*" %>
<%
	StatsDataDao statsDataDao = new StatsDataDao();
	// #제일 많이 (금액) 빌려간 사람을 내림차순으로 정렬해라 ( customer 별 총 amount)
	List<Map<String, Object>> amountByCustomer = statsDataDao.amountByCustomer();
	
	List<Map<String, Object>> filmCountByRentalRate = statsDataDao.filmCountByRentalRate();
	List<Map<String, Object>> filmCountByRating = statsDataDao.filmCountByRating();
	List<Map<String, Object>> filmCountByLanguage = statsDataDao.filmCountByLanguage();
	List<Map<String, Object>> filmCountByLength = statsDataDao.filmCountByLength();
	List<Map<String, Object>> filmCountByCategory = statsDataDao.filmCountByCategory();
	List<Map<String, Object>> storePaymentByWeek = statsDataDao.storePaymentByWeek();
	List<Map<String, Object>> actorCountByfilm = statsDataDao.actorCountByfilm();
	List<Map<String, Object>> actorByIncome = statsDataDao.actorByIncome(); 
	List<Map<String, Object>> customerCountByCountry = statsDataDao.customerCountByCountry();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>statsData</title>
	<!-- bootstrap 4 불러와서 사용하겠음 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container"><!-- 화면(고정너비 컨텐츠 사용할거임) -->
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-secondary" role="button">index</a>
		<div class ="container p-3 my-3 bg-dark text-white">
			<h1>statsData List</h1>
		</div>
			<h3>1. amountByCustomer(총지불액이 180달러가 넘는 사람)</h3>
			<table class="table table-hover">
				<tr class = "table-primary">
					<th>고객아이디</th>
					<th>고객이름</th>
					<th>총지불액</th>
				</tr>
				
				<%
					for(Map<String, Object>m : amountByCustomer){
				%>
						<tr class = "table-info">
							<td><%=m.get("customerId") %></td>
							<td><%=m.get("name") %></td>
							<td><%=m.get("total") %></td>
						</tr>
				<%	
					}
				%>
			</table>
		
		<h3>2. rental_rate별 영화갯수</h3>
		<table class="table table-hover">
			<tr class = "table-primary">
				<td>대여료</td>
				<td>영화갯수</td>
			</tr>
			
			<%
				for(Map<String, Object> m : filmCountByRentalRate){
			%>
					<tr class = "table-info">
						<td><%=m.get("rentalRate")%></td>
						<td><%=m.get("rcnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		
		<h3>3. rating 별 영화갯수</h3>
		<table class="table table-hover">
			<tr class = "table-primary">
				<td>등급</td>
				<td>영화갯수</td>
			</tr>
			<%
				for(Map<String, Object> m : filmCountByRating){
			%>
					<tr class = "table-info">
						<td><%=m.get("rating")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		
		<h3>4. language 별 영화갯수</h3>
		<table class="table table-hover">
			<tr class = "table-primary">
				<td>언어</td>
				<td>영화갯수</td>
			</tr>
			<%
				for(Map<String, Object> m : filmCountByLanguage){
			%>
					<tr class = "table-info">
						<td><%=m.get("name")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		
		<h3>5. length 별 영화갯수</h3>
		<table class="table table-hover">
			<tr class = "table-primary">
				<td>영화길이별 구간</td>
				<td>영화갯수</td>
			</tr>
			<%
				for(Map<String, Object> m : filmCountByLength){
			%>
					<tr class = "table-info">
						<td><%=m.get("length")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<h3>6. category별 영화 갯수</h3>
		<table class="table table-hover">
			<tr class = "table-primary">
				<td>카테고리 ID</td>
				<td>카테고리 이름</td>
				<td>영화갯수</td>
			</tr>
			<%
				for(Map<String, Object> m : filmCountByCategory){
			%>
					<tr class = "table-info">
						<td><%=m.get("categoryId")%></td>
						<td><%=m.get("name")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%		
				}
			%>
		</table>
		
		<h3>7. 요일별 매장 매출갯수</h3>
		<table class="table table-hover">
			<tr class = "table-primary">
				<td>매장ID</td>
				<td>weekNum</td>
				<td>dayOfWeek</td>
				<td>매출갯수</td>
			</tr>
			<%
				for(Map<String, Object> m : storePaymentByWeek){
			%>
					<tr class = "table-info">
						<td><%=m.get("storeId")%></td>
						<td><%=m.get("weekNum")%></td>
						<td><%=m.get("dayOfWeek")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		<h3>8. 배우별 영화출연 횟수</h3>
		<table class="table table-hover">
			<tr class = "table-primary">
				<td>배우ID</td>
				<td>배우이름</td>
				<td>출연횟수</td>
			</tr>
			<%
				for(Map<String, Object> m : actorCountByfilm){
			%>
					<tr class = "table-info">
						<td><%=m.get("actorId")%></td>
						<td><%=m.get("name")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
		
		<h3>9. 배우별 수입</h3>
		<table class="table table-hover">
			<tr class = "table-primary">
				<td>배우 ID</td>
				<td>배우 이름</td>
				<td>수입합계</td>
			</tr>
			<%
				for(Map<String, Object> m : actorByIncome){
			%>
					<tr class = "table-info">
						<td><%=m.get("actorId")%></td>
						<td><%=m.get("name")%></td>
						<td><%=m.get("income")%></td>
					</tr>
			<%
				}
			%>
			
		</table>	
		
		<h3>10. 나라별 고객수</h3>
		<table class="table table-hover">
			<tr class = "table-primary">
				<td>나라이름</td>
				<td>고객수</td>
			</tr>
			<%
				for(Map<String, Object> m : customerCountByCountry){
			%>
					<tr class = "table-info">
						<td><%=m.get("country")%></td>
						<td><%=m.get("cnt")%></td>
					</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>