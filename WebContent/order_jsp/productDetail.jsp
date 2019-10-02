<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$("label[name='colorGroup']".on("click", function() {
			console.out("aa");
		})
		
	});

</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-5">
					<!-- 슬라이드 시작 -->
						<div class="carousel slide" id="carousel-823080">
							<ol class="carousel-indicators">
								<li data-slide-to="0" data-target="#carousel-823080"
									class="active"></li>
								<li data-slide-to="1" data-target="#carousel-823080"></li>
								<li data-slide-to="2" data-target="#carousel-823080"></li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img class="d-block w-100"
										src="image/thumbnail/product${dto.p_id }.jpg" />
									<div class="carousel-caption">
									</div>
								</div>
								
								<c:forEach items="${amount }" var="amount">
								<div class="carousel-item">
									<img class="d-block w-100" 
										src="image/clothesDetail/amount${amount.amount_id }.jpg" />
									<div class="carousel-caption">
									</div>
								</div>
								</c:forEach>
							</div>
							<a class="carousel-control-prev" href="#carousel-823080"
								data-slide="prev"><span class="carousel-control-prev-icon"></span>
								<span class="sr-only">Previous</span></a> <a
								class="carousel-control-next" href="#carousel-823080"
								data-slide="next"><span class="carousel-control-next-icon"></span>
								<span class="sr-only">Next</span></a>
						</div>
						<!-- 슬라이드 끝 -->
					</div>
					<div class="col-md-7">
						<div style="height: 200px;">
							<table>
								<thead>
									<h1>${dto.p_name }</h1>
								</thead>
								<tbody>
									<br/><br/>
									<tr>
										<th><h3>가격: ${dto.p_price }</h3></th>
									</tr>
									<tr>
										<th><h3>등급할인: </h3></th>
									</tr>
									<tr>
										<th><h3>색상</h3></th>
									</tr>
									<tr>	
										<td>
										<c:forEach items="${amount }" var="amount">
											<label id="color${amount.amount_id }" name="colorGroup">${amount.amount_color}</label>
										</c:forEach>
										</td>
									</tr>
									<tr>
										<th><h3>사이즈</h3></th>
									</tr>
									<tr>
										<td>
										<c:forEach items="${amount }" var="amount">
											<label id="size${amount.amount_id }" name="sizeGroup">${amount.amount_size}</label>
										</c:forEach>
										</td>
									</tr>
								</tbody>
							</table>
						
						
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<td width="200"><button type="button"
												class="btn btn-md btn-primary btn-block">CART</button></td>
										<td width="200"><button type="button"
												class="btn btn-md btn-primary btn-block">WISHLIST</button></td>
									<tr>
										<td colspan="2"><button type="button"
												class="btn btn-md btn-primary btn-block">BUY NOW</button></td>
									</tr>
								</tbody>
							</table>
							</div>
					</div>
					<!-- col md 7 끝 -->
				</div>
				<hr>
				<div class="row">
					<div class="col-md-12">
						${dto.p_detail }<br />

						<img src="image/thumbnail/product${dto.p_id }.jpg" />
						<c:forEach items="${amount }" var="amount">
							<img src="image/clothesDetail/amount${amount.amount_id }.jpg" />
						</c:forEach>
						<img src="image/etc/${dto.p_category }.jpg" />

					</div>
					<!-- 상세페이지 끝 -->
				</div>
			</div>
		</div>
	</div>


</body>
</html>