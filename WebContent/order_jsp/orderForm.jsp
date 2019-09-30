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

<script type="text/javascript">
$(function(){
	$(checkBox).change(function(){
		if($(checkBox).is(":checked")){
			$("#sendForm").hide();
		} else {
			$("#sendForm").show();
		}
	});
});

</script>


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
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("userExtraAddress").value = extraAddr;

						} else {
							document.getElementById("userExtraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('userPostcode').value = data.zonecode;
						document.getElementById("userAddress").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("userDetailAddress").focus();
					}
				}).open();
	}

	function sendDaumPostcode() {
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
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sendExtraAddress").value = extraAddr;

						} else {
							document.getElementById("sendExtraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sendPostcode').value = data.zonecode;
						document.getElementById("sendAddress").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sendDetailAddress").focus();
					}
				}).open();
	}
</script>
<!-- 다음주소API 스크립트 끝 -->




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
								<tr>
									<td class="col-md-3">
										<div class="media">
											<a class="thumbnail pull-left" href="#"> <img
												class="media-object" src="http://lorempixel.com/460/250/"
												style="width: 72px; height: 72px;">
											</a>
											<div class="media-body">
												<h5 class="media-heading">Product Name</h5>
												<h5 class="media-heading">Product Code</h5>
											</div>
										</div>
									</td>
									<td class="text-center">1</td>
									<td class="text-right"><span>25,000</span><span>원</span></td>
								</tr>
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
				<div class="panel-heading text-center">
					<h4>주문자 정보</h4>
				</div>
				<div>
					<input type="checkbox" id="checkBox" name="checkBox">주문자정보가 배송지 정보와 같음
				</div>
				<table>
					<tr>
						<th width="80">이름</th>
						<td><input type="text" id="userName" name="userName"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" size="5" id="userPhoneNum1"
							name="userPhoneNum1">-<input type="text" size="5"
							id="userPhoneNum2" name="userPhoneNum2">-<input
							type="text" size="5" id="userPhoneNum3" name="userPhoneNum3"></td>
					</tr>

					<tr>
						<th>주소</th>
						<td><input type="text" id="userPostcode" name="userPostcode"
							placeholder="우편번호">&nbsp;<input type="button"
							onclick="userDaumPostcode()" value="우편번호 찾기"></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="text" id="userAddress" name="userAddress"
							placeholder="주소" size="30">&nbsp;<input type="text"
							id="userExtraAddress" name="userExtraAddress" placeholder=""
							size="10" readonly></td>
					</tr>

					<tr>
						<th></th>
						<td><input type="text" id="userDetailAddress"
							name="userDetailAddress" placeholder="상세주소" size="30"></td>
					</tr>
					<tr>
						<th>배송메모</th>
						<td><input type="text" id="userMemo" name="userMemo"
							size="50"></td>
					</tr>
				</table>

				<br />

				<form id="sendForm" name="sendForm" method="post">
					<div class="panel-heading text-center">
						<h4>배송지 정보</h4>
					</div>
					<table>
						<tr>
							<th width="80">이름</th>
							<td><input type="text" id="sendName" name="sendName"></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" size="5" id="sendPhoneNum1"
								name="sendPhoneNum1">-<input type="text" size="5"
								id="sendPhoneNum2" name="sendPhoneNum2">-<input
								type="text" size="5" id="sendPhoneNum3" name="sendPhoneNum3"></td>
						</tr>

						<tr>
							<th>주소</th>
							<td><input type="text" id="sendPostcode" name="sendPostcode"
								placeholder="우편번호">&nbsp;<input type="button"
								onclick="sendDaumPostcode()" value="우편번호 찾기"></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" id="sendAddress" name="sendAddress"
								placeholder="주소" size="30">&nbsp;<input type="text"
								id="sendExtraAddress" name="sendExtraAddress" placeholder=""
								size="10" readonly></td>
						</tr>

						<tr>
							<th></th>
							<td><input type="text" id="sendDetailAddress"
								name="sendDetailAddress" placeholder="상세주소" size="30"></td>
						</tr>
						<tr>
							<th>배송메모</th>
							<td><input type="text" id="sendMemo" name="sendMemo"
								size="50"></td>
						</tr>
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
								<span>25,000</span><span>원</span>
							</div>
						</div>

						<div class="col-md-12">
							<small>배송비</small>
							<div class="pull-right">
								<span>+2,500</span><span>원</span>
							</div>
							<hr>
						</div>
						<div class="col-md-12">
							<strong>총결제금액</strong>
							<div class="pull-right">
								<span>27,500</span><span>원</span>
							</div>
							<hr>
						</div>

						<button type="button" class="btn btn-primary btn-lg btn-block"
							onclick="location.href='basic_orderSuccess.do'">Checkout</button>

					</div>

				</div>
				<!--REVIEW ORDER END-->
			</div>
			<!-- 총금액 끝 -->

		</div>
	</div>



	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>