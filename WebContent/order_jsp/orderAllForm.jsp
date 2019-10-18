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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- 회원정보, 배송지정보 같게하는 JS -->
<script type="text/javascript">
	$(function() {
		
		//총금액 계산
		var sum = 0;
		productPrice = $('[name=productPrice]')
		for(var i = 0; i < productPrice.length; i++) {
			sum += parseInt(productPrice[i].value);
			$('#allScore').val(sum);
			$('#totalScore').val(sum+2500);
			$('#orderTotalPrice').val(sum+2500);

			
			
		}
		
		
		//체크박스 체크
		$(checkBox).change(function() {
			if ($(checkBox).is(":checked")) {
				
				var userName = $("[name^='user']")  	
				var orderName = $("[name^='order']")
				for(var i = 0; i < userName.length; i++) {
					orderName[i].readOnly = true;
					orderName[i].value = userName[i].value;
				}
			} else {
				
				var orderName = $("[name^='order']")
				for(var i = 0; i < orderName.length; i++) {
					orderName[i].readOnly = false;
					orderName[i].value = "";
				}
			}
		});
	});
</script>
<!-- 회원정보, 배송지정보 같게하는 JS 끝-->

<!-- 다음주소API 스크립트 시작 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function userDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}

						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('userPostCode').value = data.zonecode;
						document.getElementById("userAddress").value = addr
								+ extraAddr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("userDetailAddress").focus();
					}
				}).open();
	}

	function orderDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('orderPostCode').value = data.zonecode;
						document.getElementById("orderAddress").value = addr
								+ extraAddr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("orderDetailAddress").focus();
					}
				}).open();
	}
</script>
<!-- 다음주소API 스크립트 끝 -->
<%
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
%>


<script type="text/javascript">
	function checkOrderForm() {
		var userForm = document.userForm;
		var orderForm = document.orderForm;
		var checkOutForm = document.checkOutForm;
		
		if (userForm.userName.value == "") {
			alert("주문자 이름을 입력하세요.");
			userForm.userName.focus();
			return false;
		}
		
		if (userForm.userPhoneNum.value == "") {
			alert("주문자 휴대폰 번호를 입력하세요.");
			userForm.userPhoneNum.focus();
			return false;
		}
		
		
		if (orderForm.orderName.value == "") {
			alert("수신자 이름을 입력하세요.");
			orderForm.orderName.focus();
			return false;
		}

		if (orderForm.orderPostCode.value == "") {
			alert("우편번호를 입력하세요.");
			orderForm.orderPostCode.focus();
			return false;
		}
		
		if (orderForm.orderPostCode.value == "") {
			alert("우편번호를 입력하세요.");
			orderForm.orderPostCode.focus();
			return false;
		}

		orderForm.submit();
	}
</script>



</head>

<body>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<!--SHIPPING METHOD-->
				<div class="panel panel-default">
					<br />
					<div class="panel-heading text-center">
						<h4>ORDER LIST</h4>
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
			</div>
		</div>

		<div class="row">
			<!-- 주문폼 시작 -->
			<div class="col-md-8">
				<form id="userForm" name="userForm" method="post">
					<div class="panel-heading text-center">
						<h4>주문자 정보</h4>
					</div>
					<div>
						<input type="checkbox" id="checkBox" name="checkBox">주문자정보가
						배송지 정보와 같음
					</div>
					<table id ="userTable">
						<tr>
							<th width="80">이름</th>
							<td><input type="text" id="userName" name="userName" value="${mdto.mName }"></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" id="userPhoneNum"
								name="userPhoneNum" value="${mdto.mPhone }">
						</tr>
						<c:if test="${not empty id }">
							<tr>
								<th>주소</th>
								<td><input type="text" id="userPostCode"
									name="userPostCode" value="${mdto.mPostcode }">&nbsp;<input
									type="button" onclick="userDaumPostcode()" value="우편번호 찾기"></td>
							</tr>
							<tr>
								<th></th>
								<td><input type="text" id="userAddress" name="userAddress"
									value="${mdto.mAddress1 }"size="50"></td>
							</tr>

							<tr>
								<th></th>
								<td><input type="text" id="userDetailAddress"
									name="userDetailAddress" value="${mdto.mAddress2 }"size="50"></td>
							</tr>
						</c:if>
					</table>
				</form>
				<br />
				<form id="orderForm" name="orderForm" method="post" action="basic_orderAllSuccess.do">
					<div class="panel-heading text-center">
						<h4>배송지 정보</h4>
					</div>
					<table id="orderTable">
						<tr>
							<th width="80">이름</th>
							<td><input type="text" id="orderName" name="orderName"></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" id="orderPhoneNum"
								name="orderPhoneNum"></td>
						</tr>

						<tr>
							<th>주소</th>
							<td><input type="text" id="orderPostCode" name="orderPostCode"
								placeholder="우편번호">&nbsp;<input type="button"
								onclick="orderDaumPostcode()" value="우편번호 찾기"></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" id="orderAddress" name="orderAddress"
								placeholder="주소" size="50"></td>
						</tr>

						<tr>
							<th></th>
							<td><input type="text" id="orderDetailAddress"
								name="orderDetailAddress" placeholder="상세주소" size="50"></td>
						</tr>
						<tr>
							<th>배송메모</th>
							<td><input type="text" id="orderMemo" name="orderMemo"
								size="50"></td>
						</tr>
							<td><input type="hidden" id="orderTotalPrice" name="orderTotalPrice" value="${ofDTO.productPrice }"></td>
							<td><input type="hidden" id="orderProductCount" name="orderProductCount"></td>
						</tr>
					</table>
					
					
					<table>
						<thead></thead>
						<tbody>
							<tr>
								<c:forEach var="i" begin="0" end="${(fn:length(amountId))-1}">
									<input type="hidden" id="amountId" name="amountId" value="${amountId[i] }">
									<input type="hidden" id="amountCount" name="amountCount" value="${amountCount[i] }">
									<input type="hidden" id="productName" name="productName" value="${productName[i] }">
									<input type="hidden" id="productId" name="productId" value="${productId[i] }">
									<input type="hidden" id="amountColor" name="amountColor" value="${amountColor[i] }">
									<input type="hidden" id="amountSize" name="amountSize" value="${amountSize[i] }">
									<input type="hidden" id="price" name="price" value="${productPrice[i] }">
								</c:forEach>
							</tr>
						</tbody>
					</table>
					
					
				</form>
				<br /> <br />
			</div>
			<!-- 주문폼 끝 -->

			<!-- 총금액 시작 -->
			<div class="col-md-4">
				<br />
				<!--REVIEW ORDER-->
				<div class="panel panel-default">
					<div class="panel-heading text-center">
						<h4>결제금액</h4>
						<br />
					</div>
					<div class="panel-body">
						<div class="col-md-12">
							<strong>상품합계</strong> <br />
							<div class="pull-right">						
								<input type="text" id="allScore" name="allScore" style="border:0"><span>원</span>
							</div>
						</div>

						<div class="col-md-12">
							<strong>배송비</strong>
							<div class="pull-right">
								<span>+2,500</span><span>원</span>
							</div>
							<hr>
						</div>
						<div class="col-md-12">
							<strong>총결제금액</strong>
							<div class="pull-right">
								<span><input type="text" id="totalScore" name="totalScore" style="border:0"></span><span>원</span>
							</div>
							<hr>
						</div>
						<!-- 일반결제버튼 -->
						<form id="checkOutForm" name="checkOutForm" method="post">
							<button type="button" class="btn btn-primary btn-lg btn-block"
								onclick="checkOrderForm()" style="width: 226px" >Checkout</button>
						</form>
					</div><br>
						<!-- 네이버페이버튼 JS밑에있음 -->
						<input type="image" id="naverPayBtn" value="네이버페이 결제 버튼" src="image/etc/naverPayBtn.jpg">
				</div>
				<!--REVIEW ORDER END-->
			</div>
			<!-- 총금액 끝 -->

		</div>
	</div>
	
	
	<!-- 네이버페이 JS -->
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script>
    var oPay = Naver.Pay.create({
          "mode" : "production", // development or production
          "clientId": "u86j4ripEt8LRfPGzQ8", // clientId
          "openType": "layer", //layer, popup, page; 생략시 디폴트 layer
          "onAuthorize" : function(oData) {

        		    if(oData.resultCode === "Success") {
        		      // 네이버페이 결제 승인 요청 처리
        		      orderForm.submit();
        		    } else {
        		      console.log("결제취소");
        		    }
          }
    });

    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
    var elNaverPayBtn = document.getElementById("naverPayBtn");

    elNaverPayBtn.addEventListener("click", function() {
		var userForm = document.userForm;
		var orderForm = document.orderForm;
		var checkOutForm = document.checkOutForm;
		
		if (userForm.userName.value == "") {
			alert("주문자 이름을 입력하세요.");
			userForm.userName.focus();
			return false;
		}
		
		if (userForm.userPhoneNum.value == "") {
			alert("주문자 휴대폰 번호를 입력하세요.");
			userForm.userPhoneNum.focus();
			return false;
		}
		
		
		if (orderForm.orderName.value == "") {
			alert("수신자 이름을 입력하세요.");
			orderForm.orderName.focus();
			return false;
		}

		if (orderForm.orderPostCode.value == "") {
			alert("우편번호를 입력하세요.");
			orderForm.orderPostCode.focus();
			return false;
		}
		
		if (orderForm.orderPostCode.value == "") {
			alert("우편번호를 입력하세요.");
			orderForm.orderPostCode.focus();
			return false;
			
		} else {
	         oPay.open({
	          "merchantUserKey": "test", //가맹점 사용자 식별키 *merchantUserKey(가맹점의 사용자키) 파라미터는 개인 아이디와 같은 개인정보 데이터를 제외한 사용자 식별키값으로 전달해 주시면 됩니다.
	          "merchantPayKey": "1", //가맹점 주문 번호 *가맹점에서 사용중인 주문번호 또는 결제번호를 전달해 주시면 됩니다.
	          "productName": $('[name=productName]')[0].value,
	          "totalPayAmount": $('#totalScore').val(),
	          "taxScopeAmount": $('#totalScore').val(),
	          "taxExScopeAmount": "0",
	          "returnUrl": "basic_orderAllSuccess.do" //결제완료시 띄울 페이지
	        });
	    }
    }); //

</script>



	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>