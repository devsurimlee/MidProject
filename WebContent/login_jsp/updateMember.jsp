<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	if('${updateMessage}' != ''){
		alert('${updateMessage}');
	}
	window.onload = function(){
		var m = "${list.mEmail}";
		var email = m.split('@');
		$("#email1").val(email[0]);
		$("#email2").val(email[1]);
		console.log(email[0]);
		console.log(email[1]);
	
		// 휴대폰 번호 잘라서 넣기
		var p = "${list.mPhone}";
		var phone = p.split('-');
		$("#phone1").val(phone[0]);
		$("#phone2").val(phone[1]);
		$("#phone3").val(phone[2]);
		console.log(phone[0]);
		console.log(phone[1]);
		console.log(phone[2]);
	}
	
	function updateForm(){
		var form = document.updatefrm;

		// 휴대폰 번호 한 컬럼에 넣으려고 합침
		var ph = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
		form.mPhone.value = ph;

		// 이메일 한 컬럼에 넣기 위해 합침
		var m = form.email1.value + "@" + form.email2.value;
		form.mEmail.value = m;
		
		var result = confirm("회원 정보를 변경하시겠습니까?");
        if(result == true) {
        	form.submit();
        } else {
        	false;
        }
	}
</script>
<!-- 다음주소 API -->
<script>
	function orderDaumPostcode() {
		new daum.Postcode({
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
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
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
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address1").value = addr + extraAddr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("address2").focus();
			}
		}).open();
	}
</script>
</head>
<body>
	<div align="center">
		<!-- 헤드 -->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> 회원 정보 수정 </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
		
		<!-- 내용 -->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form role="form" id="updatefrm" name="updatefrm" action="basic_updateMember.do" method="post">
					<input type="hidden" id="phone" name="mPhone">
					<input type="hidden" id="email" name="mEmail">
					<table>
						<tr>
							<th width="120" align="right" height="50">ID</th>
							<td width="200" colspan="3"><input type="text" id="joinid" name="mId" class="form-control form-control-sm"
														onkeyup="idCondition()" value="${list.mId }" readonly="readonly"/></td>
						</tr>

						<tr>
							<th height="50">Name</th>
							<td colspan="5"><input type="text" id="name" name="mName" class="form-control form-control-sm"
											value="${list.mName }" readonly="readonly" /></td>
						</tr>

						<tr>
							<th height="50">Phone</th>
							<td align="center" width="40"><select id="phone1" class="btn btn-secondary btn-sm dropdown-toggle">
															<option value="010" selected>010</option>
															<option value="011">011</option>
															<option value="012">012</option></select></td>
							<td width="10">─</td>
							<td width="100"><input type="text" id="phone2" name="phone2" class="form-control form-control-sm" 
											/></td>
							<td width="10">─</td>
							<td width="100"><input type="text" id="phone3" name="phone3" class="form-control form-control-sm"
											/></td>
						</tr>

						<tr>
							<th height="50">Email</th>
							<td colspan="3" align="center"><input type="text" id="email1" name="email1" 
															class="form-control form-control-sm"/></td>
							<td>@</td>
							<td><select id="email2" name="email2" class="btn btn-secondary btn-sm dropdown-toggle">
									<option	value="gmail.com" selected>gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option></select></td>
						</tr>

						<tr>
							<th height="50">Postcode</th>
							<td colspan="3"><input type="text" id="postcode"
								name="mPostcode" class="form-control form-control-sm" value="${list.mPostcode }" /></td>
							<td colspan="2" align="center"><input type="button"	onclick="orderDaumPostcode()"
															class="btn btn-sm btn-outline-primary" value="우편번호 찾기"></td>
						</tr>

						<tr>
							<th height="50">Address</th>
							<td colspan="5"><input type="text" id="address1" value="${list.mAddress1 }"
											name="mAddress1" class="form-control form-control-sm" /></td>
						</tr>

						<tr>
							<th height="50">Address Detail</th>
							<td colspan="5"><input type="text" id="address2" value="${list.mAddress2 }"
											name="mAddress2" class="form-control form-control-sm" /></td>
						</tr>

						<tr>
							<td width="220" colspan="3" height="80"><button type="button" onclick="updateForm()"
																	class="btn btn-primary btn-block">UPDATE</button></td>
							<td width="220" colspan="3"><button type="button" onclick="location.href='basic_mypageForm.do'"
															class="btn btn-primary btn-block">GO BACK</button></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>