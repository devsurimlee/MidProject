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
		//카트에 담을때의 수량에 따른 금액책정
		var optionList = JSON.parse('${optionList}');
		var amountCount = $('[name=amountCount]');
		var amountId = $('[name=amountId]');
		var price = $('[name=price]');
		var sum = 0;
	
		for(var i = 0; i < optionList.length; i++) {
			price[i].value *= amountCount[i].value ; 
			sum +=  parseInt(price[i].value);
		}
		
		$("#productPrice").val(sum);
		$("#totalPrice").val(sum+2500);

		
		
		//전체결제
		var tr = $('tr')
		var allOrderBtn = $("#allOrderBtn");
		$("#trLength").val(tr.length);
		
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
		
	}); 
	
	//JSP라서 button에 보면 event있음
	function deleteCart(e, amountId) {
		var tr = $(e.target).parent().parent()
		$.ajax( {
			url : 'cartDelete.do',
			data : {
				deleteCheck : amountId
			},
			dataType: 'json',
			success : function() {
				 alert("상품이 삭제되었습니다");
				 tr.remove();
				 
				 
				 //상품삭제시 금액수정
				 	var sum = $('#productPrice').val();
					sum -= parseInt(tr.children().eq(6).attr('id')) * tr.children().eq(5).children().eq(1).val();
					
					console.log( tr.children().eq(5).children().eq(1).val() +"check"   );
					
					$("#productPrice").val(sum);
					$("#totalPrice").val(sum + 2500);   
					
					//상품이 하나도 없을때 설명글 띄우기, 버튼삭제
					if($('tr').length == 0) {
						$('ul').remove();
						$('#forAjax').append("<h3>카트가 비어있어요~~ 상품을 찾으러 가볼까요?</h3>");
					}
				 
			}
		});
		
		//펑션 끝나고 리로드인데, 이거 안넣으면 버그있음!
		location.reload();
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
				 $("#productPrice").val('0');
				 $("#totalPrice").val('0');
				 $('ul').remove();
				 $('#forAjax').append("<h3>카트가 비어있어요~~ 상품을 찾으러 가볼까요?</h3>");
			}
		});
		
	}//
	
	
	//구매수량 변경용
 	function change(trAmountId, num) {
	var optionList = JSON.parse('${optionList}');
	var amountCount = $('[name=amountCount]');
	var amountId = $('[name=amountId]');
	var price = $('[name=price]');

	for(var i = 0; i < optionList.length; i++) {
		if(trAmountId == amountId[i].value) {
			var y = Number(amountCount[i].value  ) + num;
			
			if(y < 1) {
				y = 1;
			}
			
			//물품별 금액책정
			amountCount[i].value = y;
			price[i].value = optionList[i].p_price * y; 
			
			//상품합계, 총결제금액 책정
			var sum = 0;
			for(var i = 0; i < optionList.length; i++) {
				sum +=  parseInt(price[i].value);
			}
			
			$("#productPrice").val(sum);
			$("#totalPrice").val(sum+2500);
			
		}
	  }
 	}//
	
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
#top {
	position: absolute;
	left: 45%;
}

#middle {
	position: absolute;
	left: 20%;
}

#forAjax {
	position: absolute;
	left: 20%;
}


</style>
</head>

<body>

<div id="top"><h2><b>CART</b></h2></div><br><br>

<c:if test="${!empty OptionList }">
<form id="cartForm" name="cartForm" method="post" action="basic_orderAllForm.do">
	<!--SHIPPING METHOD-->
	<div class="panel panel-default">
		<br />
		<div class="panel-heading text-center">
		</div>
		<div class="panel-body">
			<table class="table borderless">
				<thead>
				</thead>
				<tbody>
				<tr>
					<th>-</th>
					<th>상품명</th>
					<th>품번</th>
					<th>색상</th>
					<th>사이즈</th>
					<th>수량</th>
					<th>가격</th>
					<th></th>
				</tr>
				<c:forEach items="${OptionList }" var="dto">
					<tr>
						<td> </td>
						<td>
							<div class="media">
								<a class="thumbnail pull-left" href="#"> <img
									class="media-object"
									src="image/clothesDetail/amount${dto.amountId }.jpg"
									style="width: 72px; height: 72px;">
								</a>
								<div class="media-body">
									<h5 class="media-heading"><input type="text" id="productName" name="productName" value="${dto.p_name }" style="border:0" ></h5>
									<h5 class="media-heading"><input type="text" id="productId" name="productId" value="${dto.p_id }" style="border:0" size="10"></h5>
								</div>
							</div>
						</td>
						<td>
							<h5><input type="text" id="amountId" name="amountId" value="${dto.amountId }" style="border:0" size="5"></h5>
						</td>
						<td>
							<h5><input type="text" id="amountColor" name="amountColor" value="${dto.amount_color }" style="border:0"></h5>
						</td>
						<td>
							<h5><input type="text" id="amountSize" name="amountSize" value="${dto.amount_size }" style="border:0" size="10"></h5>
						</td>
						<td>
							
										<a href="#" onclick="change(${dto.amountId }, -1)">◀</a>
										<input type="text" id="amountCount" name="amountCount" value="${dto.a_count }" size="3">
										<a href="#" onclick="change(${dto.amountId }, 1)">▶</a>
								
						</td>
						<td id ="${dto.p_price }"><h5>
								<input type="text" id="price" name="price" value="${dto.p_price }" style="border:0" size="4">원
							</h5></td>
						<td><button type="button" class="btn btn-md btn-primary btn-block" id="deleteBtn" name="deleteBtn" onclick="deleteCart(event, '${dto.amountId }')">삭제</button>	
						<input type="hidden" id="key" name="key" value="${dto.p_id }" style="border:0" size="10">	
						<input type="hidden" id="trLength" name="trLength"></td>		
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
			<li>상품합계: <input type="text" id="productPrice" style="border:0" size="4">원</li>
			<li>배송비: <input type="text" id="deliveryPrice" style="border:0" value="2500원"></li>
			<hr>
			<li>총결제금액: <input type="text" id="totalPrice" style="border:0" size="4">원</li>
		</ul>
		<ul>
			<li>
			<!-- <button id="selectOrderBtn" name="selectOrderBtn" class="btn btn-md btn-primary btn-block">선택상품결제</button> -->
			<button id="allOrderBtn" name="allOrderBtn" class="btn btn-md btn-primary btn-block" onclick ="orderAll()">전체결제</button>
			<button id="deleteAllBtn" name="deleteAllBtn" class="btn btn-md btn-primary btn-block" onclick ="deleteAllCart()">장바구니비우기</button></li>
		</ul>
</c:if>
	
	<div id="forAjax"></div>
	
	<c:if test="${empty OptionList }">
		<div id="middle"><h3>카트가 비어있어요~~ 상품을 찾으러 가볼까요?</h3></div>
	</c:if>
	
</body>
</html>