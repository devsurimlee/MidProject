<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	var now = new Date();

	var year= now.getFullYear();
	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	        
	var chan_val = year + '-' + mon + '-' + day;
	$('#today').val("주문날짜: " + chan_val);
	
});



</script>

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
					<!-- foreach ($order->lineItems as $line) or some such thing here -->
					<tr>
						<td>
							<div class="media">
								<a class="thumbnail pull-left" href="#"> <img
									class="media-object"
									src="image/clothesDetail/amount${orderDetail.amountId}.jpg"
									style="width: 72px; height: 72px;">
								</a>
								<div class="media-body">
									<h5 class="media-heading">${ofDTO.productName }</h5>
									<h5 class="media-heading">${ofDTO.productId }</h5>
								</div>
							</div>
						</td>
						<td><h5>
								색상: <span>${ofDTO.productColor }</span>
							</h5></td>
						<td><h5>
								사이즈: <span>${ofDTO.productSize }</span>
							</h5></td>
						<td><h5>
								수량: <span>${ofDTO.productCount }</span>
							</h5></td>
						<td><h5>
								가격: <span>${orders.orderTotalPrice }</span><span>원</span>
							</h5></td>
					</tr>
				</tbody>
			</table>


		</div>
	</div>
	<!--SHIPPING METHOD END-->
	<table>
		<thead></thead>
		<tbody>
			<tr>
				<td>주문번호:${orders.orderId }</td>
			</tr>
			<tr>
				<td><input type="text" id="today" style="border:none"></td>
			</tr>
			<tr>
				<td>상품합계:${orders.orderTotalPrice }원 </td>
			</tr>
			<tr>
				<td>배송비: 2500원 </td>
			</tr>
			<tr>
				<td>총결제금액:${orders.orderTotalPrice +2500}원 </td>
			</tr>
		</tbody>
	</table>
	
</body>
</html> 