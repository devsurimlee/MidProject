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

<script type="text/javascript">
	$(function() {
		$(".hover").mouseleave(function() {
			$(this).removeClass("hover");
		});
	})
</script>


<script>
$(document).ready(function(){
	  $('#copyRight').css("color", "gray"); 
	});
</script>



</head>
<body>

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
	
	
<br/><br/><br/>
	<table id = "copyRight">
		<thead></thead>
		<tbody>
			<tr>
				<td width="450">(주) 예담쇼핑몰</td>
				<td>통신판매신고번호 : 2019-대구중구-****</td>
			</tr>
			<tr>
				<td>대표자: 강연우, 박지원, 이수림</td>
				<td>TEL : 053-356-****
				<td />
			</tr>
			<tr>
				<td>COPYRIGHT (주)예담쇼핑몰</td>
				<td>ADDRESS : 대구광역시 중구 국채보상로 537 (수동, 5층)</td>
			</tr>
			<tr>
				<td></td>
				<td>CONTACT yedam.help@gmail.com FOR MORE INFORMATION.</td>
			</tr>
		</tbody>
	</table>
	<br/>

</body>
</html>