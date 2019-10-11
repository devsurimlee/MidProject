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
		//전체결제
		var tr = $('tr')
		var allOrderBtn = $("#allOrderBtn");
		allOrderBtn.click( function() {
			if(tr.length > 1 ) {
				var resurt = confirm("전체주문창으로 넘어갑니다");
				if(resurt == true) {
					cartForm.submit();
					} else {
						//취소하면 페이지 그대로
					}
		 	 } else {
				var resurt = confirm("전체주문창으로 넘어갑니다");
				if(resurt == true) {
					$("#cartForm").attr("action", "basic_orderSingleForm.do");
					cartForm.submit();
					} else {
						//취소하면 페이지 그대로
					}
		 	 }
		});
		

		
		//최종금액 계산
		var optionList = JSON.parse('${optionList}');
		var sum = 0;
		for(var i = 0; i <optionList.length; i++ ){
			sum += optionList[i].p_price;
		}
		$("#productPrice").val(sum+"원");
		$("#totalPrice").val(sum+2500+"원");
		
	});
	
	//JSP라서 button에 보면 event있음
	function deleteCart(e, amountId) {
		var tr = $(e.target).parent().parent()
		console.log(tr + "tr check");
		$.ajax( {
			url : 'cartDelete.do',
			data : {
				deleteCheck : amountId
			},
			dataType: 'json',
			success : function() {
				 alert("상품이 삭제되었습니다");
				 tr.remove();
			}
		});
		
	};
	
	function deleteAllCart() {
		
		$.ajax( {
			url : 'cartDelete.do',
			data : {
				deleteAll : 'deleteAll'
			},
			dataType: 'json',
			success : function() {
				 alert("상품이 모두 삭제되었습니다");
				 $('tr').remove();
				 
			}
		});
		
	}
	
</script>

<style>
ul {
   list-style:none;
   padding-left:400px;
   padding-right:400px;
}
   
ul li { 
padding:0 10px; /* 각 메뉴 간격 */

}

</style>
</head>

<body>

<form id="cartForm" name="cartForm" method="post" action="basic_orderAllForm.do">
	<!--SHIPPING METHOD-->
	<div class="panel panel-default">
		<br />
		<div class="panel-heading text-center">
			<h1>CART</h1>
		</div>
		<div class="panel-body">
			<table class="table borderless">
				<thead>
					<strong>ITEM LIST</strong>
				</thead>
				<tbody>
				<c:forEach items="${OptionList }" var="dto">
					<tr>
						<td><input type="checkBox"></td>
						<td>
							<div class="media">
								<a class="thumbnail pull-left" href="#"> <img
									class="media-object"
									src="image/clothesDetail/amount${dto.amountId }.jpg"
									style="width: 72px; height: 72px;">
								</a>
								<div class="media-body">
									<h5 class="media-heading"></h5><input type="text" id="productName" name="productName" value="${dto.p_name }" style="border:0" >
									<h5 class="media-heading"></h5><input type="text" id="productId" name="productId" value="${dto.p_id }" style="border:0" size="10">
								</div>
							</div>
						</td>
						<td> <input type="text" id="amountId" name="amountId" value="${dto.amountId }" style="border:0" size="5"></td>
						<td><h5>
								색상: <input type="text" id="amountColor" name="amountColor" value="${dto.amount_color }" style="border:0">
							</h5></td>
						<td><h5>
								사이즈: <input type="text" id="amountSize" name="amountSize" value="${dto.amount_size }" style="border:0" size="10">
							</h5></td>
						<td><h5>
								수량: <input type="text" id="amountCount" name="amountCount" value="${dto.a_count }" style="border:0" size="10">
							</h5></td>
						<td><h5>
								가격: <input type="text" id="price" name="price" value="${dto.p_price }" style="border:0" size="10">
							</h5></td>
						<td><button type="button" class="btn btn-md btn-primary btn-block" id="deleteBtn" name="deleteBtn" onclick="deleteCart(event, '${dto.amountId }')">삭제</button></td>	
						<input type="text" id="key" name="key" value="${dto.p_id }" style="border:0" size="10">					
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!--SHIPPING METHOD END-->
</form>

		<ul>
			<li><h3>결제 금액</h3></li>
			<li>상품합계: <input type="text" id="productPrice" style="border:0"></li>
			<li>배송비: <input type="text" id="deliveryPrice" style="border:0" value="2500원"></li>
			<hr>
			<li>총결제금액 <input type="text" id="totalPrice" style="border:0"></li>
		</ul>
		<ul>
			<li><button id="selectOrderBtn" name="selectOrderBtn" class="btn btn-md btn-primary btn-block">선택상품결제</button>
			<button id="allOrderBtn" name="allOrderBtn" class="btn btn-md btn-primary btn-block" onclick ="orderAll()">전체결제</button>
			<button id="deleteAllBtn" name="deleteAllBtn" class="btn btn-md btn-primary btn-block" onclick ="deleteAllCart()">장바구니비우기</button></li>
		</ul>
</body>
</html>