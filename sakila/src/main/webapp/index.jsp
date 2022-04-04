<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
	<!-- bootstrap 4 불러와서 사용하겠음 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container"><!-- 화면(고정너비 컨텐츠 사용할거임) -->
		<div class ="container p-3 my-3 bg-dark text-white">
			<h1>INDEX</h1>
		</div>
		<a href="<%=request.getContextPath()%>/storeList.jsp" class="btn btn-outline-primary" role="button">Store List</a>
		<a href="<%=request.getContextPath()%>/staffList.jsp" class="btn btn-outline-success" role="button">Staff List</a>
		<a href="<%=request.getContextPath()%>/actorInfoList.jsp" class="btn btn-outline-warning" role="button">ActorInfo List</a>
	</div>
</body>
</html>