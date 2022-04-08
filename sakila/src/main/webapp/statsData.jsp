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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>statsData</title>
</head>
<body>
	<h1>1. amountByCustomer(총지불액이 180달러가 넘는 사람)</h1>
	<table border="1">
		<tr>
			<th>고객아이디</th>
			<th>고객이름</th>
			<th>총지불액</th>
		</tr>
		
		<%
			for(Map<String, Object>m : amountByCustomer){
		%>
				<tr>
					<td><%=m.get("customerId") %></td>
					<td><%=m.get("name") %></td>
					<td><%=m.get("total") %></td>
				</tr>
		<%	
			}
		%>
	</table>
	
	<h1>2. rental_rate별 영화갯수</h1>
	<table border = "1">
		<tr>
			<td>대여료</td>
			<td>영화갯수</td>
		</tr>
		
		<%
			for(Map<String, Object> m : filmCountByRentalRate){
		%>
				<tr>
					<td><%=m.get("rentalRate")%></td>
					<td><%=m.get("rcnt")%></td>
				</tr>
		<%
			}
		%>
	</table>
	
	<h1>3. rating 별 영화갯수</h1>
	<table border = "1">
		<tr>
			<td>등급</td>
			<td>영화갯수</td>
		</tr>
		<%
			for(Map<String, Object> m : filmCountByRating){
		%>
				<tr>
					<td><%=m.get("rating")%></td>
					<td><%=m.get("cnt")%></td>
				</tr>
		<%
			}
		%>
	</table>
	
	<h1>4. language 별 영화갯수</h1>
	<table border = "1">
		<tr>
			<td>언어</td>
			<td>영화갯수</td>
		</tr>
		<%
			for(Map<String, Object> m : filmCountByLanguage){
		%>
				<tr>
					<td><%=m.get("name")%></td>
					<td><%=m.get("cnt")%></td>
				</tr>
		<%
			}
		%>
	</table>
	
	<h1>5. length 별 영화갯수</h1>
	<table border = "1">
		<tr>
			<td>영화길이별 구간</td>
			<td>영화갯수</td>
		</tr>
		<%
			for(Map<String, Object> m : filmCountByLength){
		%>
				<tr>
					<td><%=m.get("length")%></td>
					<td><%=m.get("cnt")%></td>
				</tr>
		<%
			}
		%>
	</table>
</body>
</html>