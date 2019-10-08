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
		
		$('#allOrderBtn').on("click", function() {
			OrderForm.submit();
		})
		
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
display:inline; /* 세로나열을 가로나열로 변경 */ 
padding:0 10px; /* 각 메뉴 간격 */

}


</style>


</head>


<body>

<form id="cartForm" name="cartForm" method="post" action="basic_cartdelete.do">
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
									<h5 class="media-heading">${dto.p_name }</h5>
									<h5 class="media-heading">${dto.p_id }</h5>
								</div>
							</div>
						</td>
						<td><h5>품번: </h5></td>
						<td id ="${dto.amountId }"></td>
						<td><h5>
								색상: <span>${dto.amount_color }</span>
							</h5></td>
						<td><h5>
								사이즈: <span>${dto.amount_size }</span>
							</h5></td>
						<td><h5>
								수량: <span>${dto.a_count }</span>
							</h5></td>
						<td><h5>
								가격: <span>${dto.p_price }</span><span>원</span>
							</h5></td>
						<td><button type="button" class="btn btn-md btn-primary btn-block" id="deleteBtn" name="deleteBtn" onclick="deleteCart(event, '${dto.amountId }')">삭제</button></td>	
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!--SHIPPING METHOD END-->
</form>
		<ul>
			<li><button id="selectOrderBtn" name="selectOrderBtn" class="btn btn-md btn-primary btn-block">선택상품결제</button>
			<li><button id="allOrderBtn" name="allOrderBtn" class="btn btn-md btn-primary btn-block">전체결제</button>
			<li><button id="deleteAllBtn" name="deleteAllBtn" class="btn btn-md btn-primary btn-block" onclick ="deleteAllCart()">장바구니비우기</button>
		</ul>
</body>
</html>