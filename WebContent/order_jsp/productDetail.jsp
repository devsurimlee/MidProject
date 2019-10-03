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
									<div id="productName" value=${dto.p_name }><h1>${dto.p_name }</h1></div>
								</thead>
								<tbody>
									<br/><br/>
									<tr>
										<th id="productPrice" value=${dto.p_price }><h3>가격: ${dto.p_price }</h3></th>
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
									<tr>
										<td colspan="2"><input type="image" id="naverPayBtn" value="네이버페이 결제 버튼" src="image/etc/naverPayBtn.jpg"></td>
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

<!-- 네이버페이 테스트용 -->
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script>
    var oPay = Naver.Pay.create({
          "mode" : "production", // development or production
          "clientId": "u86j4ripEt8LRfPGzQ8" // clientId
    });

    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
    var elNaverPayBtn = document.getElementById("naverPayBtn");

    elNaverPayBtn.addEventListener("click", function() {
        oPay.open({
          "merchantUserKey": "test", //가맹점 사용자 식별키 *merchantUserKey(가맹점의 사용자키) 파라미터는 개인 아이디와 같은 개인정보 데이터를 제외한 사용자 식별키값으로 전달해 주시면 됩니다.
          "merchantPayKey": "1", //가맹점 주문 번호 *가맹점에서 사용중인 주문번호 또는 결제번호를 전달해 주시면 됩니다.
          "productName": $("#productName").attr("value"),
          "totalPayAmount": $("#productPrice").attr("value"),
          "taxScopeAmount": $("#productPrice").attr("value"),
          "taxExScopeAmount": "0",
          "returnUrl": "basic_index.do" //결제완료시 띄울 페이지
        });
    });

</script>
<!-- 네이버페이 테스트용 끝 -->



</body>
</html>