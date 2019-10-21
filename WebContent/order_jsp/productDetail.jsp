<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



<!-- 수량체크용 -->
<script>
var dtoList = JSON.parse('${dtoList}');
var amountList = JSON.parse('${amountList}');


var totalPrice = 0;
console.log(amountList);
console.log(dtoList[0].p_price + "금액!!");


	function add() {
		var color =$("[name=colorGroup]:checked").length > 0 ? $("[name=colorGroup]:checked").val() : "" ;
		var size = $("[name=sizeGroup]:checked").length >0 ? $("[name=sizeGroup]:checked").val() : "";
		totalPrice = dtoList[0].p_price;
		productCnt.colorNsize.value = "-색상: " + color + " -사이즈:" + size + " -가격: " + totalPrice;
		
		for(var i = 0; i < amountList.length; i++ ){
			if (amountList[i].amount_color == color && amountList[i].amount_size == size) {
				// selectOption 1) 재고아이디
				selectOption.productId.value = amountList[i].amount_id;
				selectOption.amountId.value =amountList[i].amount_id;
				selectOption.orderProductCount.value = 1;
				var count = amountList[i].amount_count;
				//<재고> 부분에 물품 재고값 넣어줌
				productCnt.productAmount.value= "-재고: " + count;
				break;
			}
	 	  }
		// selectOption 3)총금액 4)색상 5)사이즈 
		selectOption.productPrice.value = totalPrice;
		selectOption.productColor.value = color;
		selectOption.productSize.value = size;
		
		
		if ($("[name=colorGroup]:checked").length > 0 && $("[name=sizeGroup]:checked").length > 0 ) {
			$("#total_product").show();	
			$("#amount").show();
		}

	}
	
 	function change(num) {
		var color =$("[name=colorGroup]:checked").val();
		var size = $("[name=sizeGroup]:checked").val();
		var count = 0;
		for(var i = 0; i < amountList.length; i++ ){
			if (amountList[i].amount_color == color && amountList[i].amount_size == size) {
				//selectOption 6)수량
				var count = amountList[i].amount_count;
				//<재고> 부분에 물품 재고값 넣어줌
				break;
			}
	 	  }
		var y = Number(cnt.value) + num;
		
		if (y < 1) { 
			y = 1;
		} if (y > count) {
			y = count;
		}
		productCnt.cnt.value = y;
		selectOption.productCount.value = y;
		selectOption.orderProductCount.value = y;
		
		totalPrice = dtoList[0].p_price * y;
		productCnt.colorNsize.value = "-색상: " + color + " -사이즈:" + size + " -가격: " + totalPrice;
		
		selectOption.productPrice.value = totalPrice;

 	}//

</script>
<!-- 수량체크용 끝 -->

<script>
$(document).ready (function()
	{
	$("#total_product").hide();	
	$("#amount").hide();
	
	//카트
	var cart = $("#cart");
	if($('#id').val().length == "") {
		cart.click( function() { 
			alert("로그인 화면으로 이동합니다");
			window.location.href = "basic_loginForm.do";
		});
	} else {
		cart.click( function() {
			if(! $("[name=colorGroup]:checked").val()) {
				alert("색상을 선택해주세요");
				return false;
			}  if(! $("[name=sizeGroup]:checked").val()) {
				alert("사이즈를 선택해주세요");
				return false;
			}
		$("#selectOption").attr("action", "basic_cartInsert.do");
		selectOption.submit();
		
		var cartResurt = confirm("상품이 카트에 담겼습니다. 카트로 이동하시겠습니까?");
		if(cartResurt == true) {
			window.location.replace("basic_cartView.do");
		} else {
			//취소하면 페이지 그대로
		}
	});
		
		
	}//
		
/* 		//카트
		var cart = $("#cart");
			cart.click( function() {
				if(! $("[name=colorGroup]:checked").val()) {
					alert("색상을 선택해주세요");
					return false;
				}  if(! $("[name=sizeGroup]:checked").val()) {
					alert("사이즈를 선택해주세요");
					return false;
				}
			$("#selectOption").attr("action", "basic_cartInsert.do");
			selectOption.submit();
			
			var cartResurt = confirm("상품이 카트에 담겼습니다. 카트로 이동하시겠습니까?");
			if(cartResurt == true) {
				window.location.replace("basic_cartView.do");
			} else {
				//취소하면 페이지 그대로
			}
		}); */
		
		
		
	
	//위시리스트
	var wishList = $("#wishList");
	if($('#id').val().length == "") {
		wishList.click( function() { 
			alert("로그인 화면으로 이동합니다");
			window.location.href = "basic_loginForm.do";
		});
	} else {
		wishList.click( function() {
			$("#selectOption").attr("action", "basic_wishlistInsert.do");
			selectOption.submit();
			
			var wishlistResurt = confirm("상품이 위시리스트에 담겼습니다. 위시리스트로 이동하시겠습니까?");
			if(wishlistResurt == true) {
				window.location.replace("basic_wishListView.do");
			} else {
				//취소하면 페이지 그대로
			};

		})
	}
	
	//상품구매
	$("#buyNow").click( function() {
		if(! $("[name=colorGroup]:checked").val()) {
			alert("색상을 선택해주세요");
			return false;
		}  if(! $("[name=sizeGroup]:checked").val()) {
			alert("사이즈를 선택해주세요");
			return false;
		}
		selectOption.submit();
		
	});

});

</script>



</head>
<body>
<!-- 단품 주문용 폼 value값 선택은 JS function add(), change(num) 참조-->
<form id="selectOption" name="selectOption" method="post" action="basic_orderForm.do">
<table>
	<thead></thead>
	<tbody>
		<tr>
			<td><input type="hidden" id="id" name="id" value="${id }"></td>
			<td><input type="hidden" id="key" name="key" value="${key }"></td>
			<td><input type="hidden" id="productId" name="productId"></td>
			<td><input type="hidden" id="productName" name="productName" value="${dto.p_name }"></td> 
			<td><input type="hidden" id="productPrice" name="productPrice"></td>
			<td><input type="hidden" id="productColor" name="productColor"></td>
			<td><input type="hidden" id="productSize" name="productSize"></td>
			<td><input type="hidden" id="productCount" name="productCount" value="1"></td> 
			<td><input type="hidden" id="orderProductCount" name="orderProductCount"></td>
			<td><input type="hidden" id="amountId" name="amountId"></td>
		</tr>
	</tbody>
</table>
</form>

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
						<form name="productCnt">
							<table>
								<thead>
									<tr>
										<td id="productName"><h1>${dto.p_name }</h1></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th id="productPrice"><h3>가격: ${dto.p_price }</h3></th>
									</tr>
									<tr>
										<c:if test="${grant != green }">
										<th><h3>등급할인: </h3></th>
										</c:if>
									</tr>
									<tr>
										<th><h3>색상</h3></th>
									</tr>
									<tr>	
										<td>
										<!-- forTokens string 잘라서 넣어줌 delims가 구분자 -->
										<c:forTokens items="${dto.p_color }" var="color" delims=",">
											<input type="radio" id="${color }" name="colorGroup" value="${fn:trim(color) }" onclick="add()">${color}
										</c:forTokens>
										</td>
									</tr>
									<tr>
										<th><h3>사이즈</h3></th>
									</tr>
									<tr>
										<td>
										<c:forTokens items="${dto.p_size }" var="size" delims=",">
											<input type="radio" id="${size}" name="sizeGroup" value="${fn:trim(size) }" onclick="add()">${size }
										</c:forTokens>
										</td>
									</tr>
									<tr>
										<td id="total_product"><input type="text" id="colorNsize" name="colorNsize" size="50" style="border:0">
										<a href="#" onclick="change(-1)">◀</a>
										<input type="text" id="cnt" name="cnt" value="1" size="3">
										<a href="#" onclick="change(1)">▶</a></td>
									</tr>
									<tr>
										<td id="amount"><input type="text" id="productAmount" name="productAmount" style="border:0"></td>
									</tr>
								</tbody>
							</table>
							</form>
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<td width="200"><button type="button" id ="cart" name="cart"
												class="btn btn-md btn-primary btn-block">CART</button></td>
										<td width="200"><button type="button" id ="wishList" name="wishList"
												class="btn btn-md btn-primary btn-block">WISHLIST</button></td>
									<tr>
										<td colspan="2"><button type="button" id="buyNow" name="buyNow"
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

						<img src="image/thumbnail/product${dto.p_id }.jpg" /><br>
						<c:forEach items="${amount }" var="amount">
							<img src="image/clothesDetail/amount${amount.amount_id }.jpg" /><br>
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