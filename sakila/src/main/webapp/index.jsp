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
		<h3>table list</h3>
		<div class="btn-group-vertical">
			<a href="<%=request.getContextPath()%>/storeList.jsp" class="btn btn-outline-danger" role="button">Store List</a>
			<a href="<%=request.getContextPath()%>/staffList.jsp" class="btn btn-outline-danger" role="button">Staff List</a>
		</div>
		<h3>view list</h3>
		<div class="btn-group-vertical">
			<a href="<%=request.getContextPath()%>/actorInfoList.jsp" class="btn btn-outline-warning" role="button">actorInfo List (view)</a>
			<a href="<%=request.getContextPath()%>/customerList.jsp" class="btn btn-outline-warning" role="button">customerList(view)</a>
			<a href="<%=request.getContextPath()%>/filmList.jsp" class="btn btn-outline-warning" role="button">filmList(view)</a>
			<a href="<%=request.getContextPath()%>/nicerButSlowerFilmList.jsp" class="btn btn-outline-warning" role="button">nicerButSlowerFilmList(view)</a>
			<a href="<%=request.getContextPath()%>/salesByFilmCategory.jsp" class="btn btn-outline-warning" role="button">salesByFilmCategory(view)</a>
			<a href="<%=request.getContextPath()%>/salesByStore.jsp" class="btn btn-outline-warning" role="button">salesByStore(view)</a>
			<a href="<%=request.getContextPath()%>/staffListView.jsp" class="btn btn-outline-warning" role="button">staffList(view)</a>
		</div>
		<h3>procedure list</h3>
		<div class="btn-group-vertical">
			<a href="<%=request.getContextPath()%>/filmInStock.jsp" class="btn btn-outline-secondary" role="button">filmInStock</a>
			<a href="<%=request.getContextPath()%>/filmNotInStock.jsp" class="btn btn-outline-secondary" role="button">filmNotInStock</a>
			<a href="<%=request.getContextPath()%>/rewardsReport.jsp" class="btn btn-outline-secondary" role="button">rewardsReport</a>
		</div>
		<h3>film Search</h3>
		<div class="btn-group-vertical">
		<a href="<%=request.getContextPath()%>/filmSearchForm.jsp" class="btn btn-outline-success" role="button">filmSearchForm</a>
		<a href="<%=request.getContextPath()%>/rentalSearchForm.jsp" class="btn btn-outline-success" role="button">rentalSearchForm</a>
		</div>
	</div>
</body>
</html>