<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import ="java.util.*" %>
<%
	StoreDao storeDao = new StoreDao();
	List<Integer> storeIdList = storeDao.selectStoreIdList();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rentalSearchForm</title>
	<!-- bootstrap 4 불러와서 사용하겠음 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container"><!-- 화면(고정너비 컨텐츠 사용할거임) -->
		<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-secondary" role="button">index</a>
		<div class ="container p-3 my-3 bg-dark text-white">
			<h1>대여 상세 검색</h1>
		</div>
		<form action ="<%=request.getContextPath()%>/rentalSearchAction.jsp" method="post">
			<table class="table table-hover">
				<!-- storeId 검색 -->
				<tr>
					<td class = "table-primary">스토어 ID</td>
					<td class = "table-success">
						<%
							for(Integer i : storeIdList){
						%>
								<div><input type ="radio" name ="storeId" value="<%=i%>"><%=i%>번 가게</div> 
						<%
							}
						%>
					</td>
				</tr>
				<!-- 고객이름 검색 -->
				<tr>
					<td class = "table-primary">고객이름</td>
					<td class = "table-success">
						<input type ="text" name = "customerName">
					</td>
				</tr>
				<!-- 대여일자 -->
				<tr>
					<td class = "table-primary">대여일자</td>
					<td class = "table-success">
						<input type ="date" name = "beginDate"> ~ <input type ="date" name = "endDate">
					</td>
				</tr>
				<!-- 검색버튼 -->
				<tr>
					<td colspan = "2">
						<button type="submit" class="btn btn-info">검색</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>