<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link href="${pageContext.request.contextPath }/mainCSS/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/mainCSS/style.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/product.css">


</head>
<body>
<div style="text-align:center"><h2>DRESS</h2></div>

	
	<form>
	<c:forEach items="${list }" var="dto">
		<figure class="snip1384">
		<img src="image/thumbnail/product${dto.p_id }.jpg" alt="sample83" width="400" height="400"/>
		<figcaption>
			<h3>${dto.p_name }</h3>
			<p>${dto.p_color }</p>
			<p>${dto.p_size }</p>
			<p>${dto.p_detail }</p>
			<i class="ion-ios-arrow-right"></i>
		</figcaption>
		<a href="basic_productDetail.do?key=${dto.p_id }"></a>
	</figure>
	</c:forEach>
	</form>



</body>
</html>