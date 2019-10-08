<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link href="${pageContext.request.contextPath }/mainCSS/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/mainCSS/style.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/product.css">

<script>
$(function() {
	$("#btn").on("click", function() {
		console.log("test btn");
	})
});

</script>

<style>
#center {
position:absolute;
left:42%;
}
</style>

</head>
<body>

<div id="center"><h1>WISH LIST</h1></div>
<br><br><br><br>

		<!-- 사진 슬라이드 밑에 상품 진열 -->
			<c:forEach items="${optionList }" var="dto">
				<figure class="snip1384">
					<img src="image/thumbnail/product${dto.p_id }.jpg" alt="sample83"
						width="400" height="400" />
					<figcaption>
						<h3>${dto.p_name }</h3>
						<p>${dto.p_color }</p>
						<p>${dto.p_size }</p>
						<p>${dto.p_detail }</p>
						<i class="ion-ios-arrow-right"></i>
					</figcaption>
					<a href="basic_productDetail.do?key=${dto.p_id }"></a>
				</figure>
				<input type="button" id="btn" value="aaaa">
			</c:forEach>
</body>
</html>