<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath }/mainCSS/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/mainCSS/style.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/product.css">

<script type="text/javascript">
	$(function() {
		$(".hover").mouseleave(function() {
			$(this).removeClass("hover");
		});
	})
</script>

</head>
<body>
		<!-- 아이디 세션용 -->
		<div id ="id" name="id" style="visibility:hidden">${id }</div>

	<!-- 메인 화면 들어가자마자 보이는 사진 슬라이드 -->
	<div class="carousel slide" id="carousel-299453">
		<ol class="carousel-indicators">
			<li data-slide-to="0" data-target="#carousel-299453" class="active">
			</li>
			<li data-slide-to="1" data-target="#carousel-299453"></li>
			<li data-slide-to="2" data-target="#carousel-299453"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" alt="Carousel Bootstrap First"
					src="image/main_sample1.jpg">
				<div class="carousel-caption">
					<h4>First Thumbnail label</h4>
					<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
						Donec id elit non mi porta gravida at eget metus. Nullam id dolor
						id nibh ultricies vehicula ut id elit.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" alt="Carousel Bootstrap Second"
					src="image/main_sample2.jpg">
				<div class="carousel-caption">
					<h4>Second Thumbnail label</h4>
					<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
						Donec id elit non mi porta gravida at eget metus. Nullam id dolor
						id nibh ultricies vehicula ut id elit.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" alt="Carousel Bootstrap Third"
					src="image/main_sample3.jpg">
				<div class="carousel-caption">
					<h4>Third Thumbnail label</h4>
					<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
						Donec id elit non mi porta gravida at eget metus. Nullam id dolor
						id nibh ultricies vehicula ut id elit.</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carousel-299453" data-slide="prev"><span class="carousel-control-prev-icon"></span>
			<span class="sr-only">Previous</span></a> 
		<a class="carousel-control-next" href="#carousel-299453" data-slide="next"><span class="carousel-control-next-icon"></span>
			<span class="sr-only">Next</span></a>
	</div>
	<br />	<br />

	<!-- 사진 슬라이드 밑에 상품 진열 -->
	
	<c:forEach items="${list }" var="dto">
		<figure class="snip1384">
		<img src="image/clothes/${dto.p_id }.jpg" alt="sample83" width="400" height="400"/>
		<figcaption>
			<h3>${dto.p_name }</h3>
			<p>${dto.p_color }</p>
			<i class="ion-ios-arrow-right"></i>
		</figcaption>
		<a href="#"></a>
	</figure>
	</c:forEach>

</body>
</html>