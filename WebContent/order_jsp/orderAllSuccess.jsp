<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Bootstrap 4, from LayoutIt!</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script>
$(document).ready (function() {
	
	//총금액 계산
	var sum = 0;
	productPrice = $('[name=productPrice]')
	for(var i = 0; i < productPrice.length; i++) {
		sum += parseInt(productPrice[i].value);
		$('#allScore').val(sum+"원");
		$('#totalScore').val(sum+2500+"원");

		
		
	}
	
	
	//주문날자 출력용
	var now = new Date();
	var year= now.getFullYear();
	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	        
	var chan_val = year + '-' + mon + '-' + day;
	$('#today').val("주문날짜: " + chan_val);
	
});


</script>

<style>
ul {
padding-left:200px;
font-size:20px;
}

</style>


</head>

<body>

	

	<!--SHIPPING METHOD-->
	<div class="panel panel-default">
		<br />
		<div class="panel-heading text-center">
			<h4>${id}님 주문 완료!</h4>
		</div>
		<div class="panel-body">
			<table class="table borderless">
				<thead>
					<tr>
						<td><strong>주문상품</strong></td>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="i" begin="0" end="${(fn:length(amountId))-1}">
								<tr>
									<td>
										<div class="media">
											<a class="thumbnail pull-left" href="#"> <img
												class="media-object" src="image/clothesDetail/amount${amountId[i]}.jpg"
												style="width: 72px; height: 72px;">
											</a>
											<div class="media-body">
												<h5 class="media-heading">${productName[i] }</h5>
												<h5 class="media-heading">${productId[i] }</h5>
											</div>
										</div>
									</td>
									<td><h5>색상: <span>${amountColor[i] }</span></h5></td>
									<td><h5>사이즈: <span>${amountSize[i] }</span></h5></td>
									<td><h5>수량: <span>${amountCount[i] }</span></h5></td> 
									<td><h5>가격: <input type="text" name="productPrice" value="${productPrice[i]}" style="border:none">원</td>
								</tr>
								</c:forEach>
				</tbody>
			</table>


		</div>
	</div>
	<!--SHIPPING METHOD END-->
		<ul>
			<li>주문번호: ${orders.orderId }</li>
			<li>주문일자: <input type="text" id="today" style="border:none"></li>
			<li>상품합계: <input type="text" id="allScore" name="allScore" style="border:none"></li>
			<li>배송비: 2500원</li>
			<li>총결제금액: <input type="text" id="totalScore" name="totalScore" style="border:none"></li>
		</ul>
			

</body>
</html> 