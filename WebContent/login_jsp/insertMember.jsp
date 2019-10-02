<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 회원가입 체크 -->
<script type="text/javascript">
	if('${message}' != ''){
		alert('${message}');
	}
	
	var chPw = 0;
	function checkForm() {
		var form = document.joinfrm;

		// 필요한 정보를 다 넣었는지 확인
		if (form.joinid.value == "") {
			alert("아이디를 입력하세요.");
			form.joinid.focus();
			return false;
		}

		if (form.joinid.readOnly != true) {
			alert("아이디 중복체크를 해 주세요.");
			form.joinid.focus();
			return false;
		}

		if (form.password1.value == "") {
			alert("비밀번호를 입력하세요.");
			form.password1.focus();
			return false;
		}

		if (chPw == 0) {
			alert("비밀번호 재확인을 해 주세요.");
			form.password2.focus();
			return false;
		}

		if (form.name.value == "") {
			alert("이름을 입력하세요.");
			form.name.focus();
			return false;
		}

		if (form.phone2.value == "" || form.phone3.value == "") {
			alert("전화번호를 입력하세요.");
			form.phone2.focus();
			return false;
		}

		if (isNaN(form.phone2.value) == true
				|| isNaN(form.phone3.value) == true) {
			alert("전화번호는 숫자만 입력해 주세요.");
			form.phone2.focus();
			return false;
		}

		if (form.email1.value == "") {
			alert("이메일을 입력하세요.");
			form.eamil1.focus();
			return false;
		}

		if (form.postcode.value == "") {
			alert("주소를 입력하세요.");
			form.address2.focus();
			return false;
		}

		if (form.address2.value == "") {
			alert("상세 주소를 입력하세요.");
			form.address2.focus();
			return false;
		}

		// 휴대폰 번호 한 컬럼에 넣으려고 합침
		var ph = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
		form.mPhone.value = ph;

		// 이메일 한 컬럼에 넣기 위해 합침
		var m = form.email1.value + "@" + form.email2.value;
		form.mEmail.value = m;

		form.submit();
	}

	// 중복되는 아이디인지 체크
	function idCheck() {
		var chkId = document.joinfrm.joinid;
		if (chkId.value == "") {
			alert("아이디를 입력하세요.");
			chkId.focus();
			return false;
		}

		$.ajax({
			url : 'idCheck.do',
			data : {
				id : document.joinfrm.joinid.value
			},
			dataType : 'json',
			success : function(result) {
				if (result.flag == true) { // 아이디 사용 가능할 때
					alert(document.joinfrm.joinid.value + "는 사용 가능한 ID입니다.");
					document.joinfrm.joinid.readOnly = true;
					document.joinfrm.password1.focus();
				} else { // 아이디 사용 불가능 할 때
					alert("사용할 수 없는 ID입니다.");
				}
			}
		});
	}

	// 아이디 조건 확인: 영문자, 숫자 혼합하여 6-8자리
	function idCondition() {
		var pattern1 = /[a-zA-Z]/;
		var pattern2 = /[0-9]/;

		var id = document.joinfrm.joinid;

		if (pattern1.test(id.value) && pattern2.test(id.value)) { // 길이 체크
			if (id.value.length >= 6 && id.value.length <= 8) { // 영문, 숫자 체크
				$("#confirmId").text("");
				document.joinfrm.idButton.disabled = false;
			} else {
				document.joinfrm.idButton.disabled = true;
				$("#confirmId").text("");
				$("#confirmId").append("<font size=\"2\" color=\"red\"> *영문자, 숫자를 혼합하여 6-8자리 </font>");
			}
		} else {
			document.joinfrm.idButton.disabled = true;
			$("#confirmId").text("");
			$("#confirmId").append("<font size=\"2\" color=\"red\"> *영문자, 숫자를 혼합하여 6-8자리 </font>");
		}
	}

	// 비밀번호 조건 확인: 숫자, 특수문자 혼합하여 6-8자리
	function pwCondition() {
		var pattern1 = /[0-9]/;
		var pattern2 = /[~!@#$%^&*()_+|<>?:{}]/;

		var first = document.joinfrm.password1;

		// 비밀번호 조건 체크
		if (first.value.length >= 6 && first.value.length <= 8) { // 길이 체크
			if (pattern1.test(first.value) && pattern2.test(first.value)) { // 숫자, 특수문자 혼합
				$("#conditionPw").text("");
			} else {
				$("#conditionPw").text("");
				$("#conditionPw").append("<font size=\"2\" color=\"red\"> *숫자, 특수문자를 혼합하여 6-8자리 </font>");
			}
		} else {
			$("#conditionPw").text("");
			$("#conditionPw").append("<font size=\"2\" color=\"red\"> *숫자, 특수문자를 혼합하여 6-8자리 </font>");
		}
	}

	// 비밀번호 재확인
	function pwCheck() {
		var first = $("#password1").val();
		var second = $("#password2").val();

		// 비밀번호 재확인 체크
		if (first == second) {
			chPw = 1;
			$("#confirmPw").text("");
			$("#confirmPw").append("<font size=\"2\" color=\"blue\"> *비밀번호 재확인 완료 </font>");
		} else {
			chPw = 0;
			$("#confirmPw").text("");
			$("#confirmPw").append("<font size=\"2\" color=\"red\"> *재확인 비밀번호가 일치하지 않습니다. </font>");
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
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<br />
					<div class="panel-heading text-center">
						<h4>
							<b> JOIN US </b>
						</h4>
					</div>
				</div>
				<br /> <br />
			</div>
		</div>

		<div class="row">
			<div class="col-md-3"></div>

			<div class="col-md-6">
				<!-- 회원가입 폼 -->
				<form role="form" id="joinfrm" name="joinfrm" action="basic_join.do"
					method="post">
					<input type="hidden" id="phone" name="mPhone"> <input
						type="hidden" id="email" name="mEmail">
					<table>
						<tr>
							<th width="120" align="right">ID</th>
							<td width="200" colspan="3"><input type="text" id="joinid"
								name="mId" class="form-control form-control-sm"
								onkeyup="idCondition()" value="${param.mId }" /></td>
							<td width="120" colspan="2" align="center"><input disabled
								id="idButton" type="button"
								class="btn btn-sm btn-outline-primary" onclick="idCheck()"
								value="중복확인" /></td>
						</tr>

						<tr>
							<td height="30"></td>
							<td colspan="5" id="confirmId"><font size="2">*아이디는
									영문자, 숫자를 혼합하여 6-8자리 </font></td>
						</tr>

						<tr>
							<th>Password</th>
							<td colspan="5"><input type="password" id="password1"
								name="mPw" class="form-control form-control-sm"
								onkeyup="pwCondition()" /></td>
						</tr>

						<tr>
							<td></td>
							<td colspan="5" id="conditionPw"><font size="2">*비밀번호는
									숫자, 특수문자를 혼합하여 6-8자리</font></td>
						</tr>

						<tr>
							<td></td>
							<td colspan="5"><input type="password" id="password2"
								class="form-control form-control-sm" onkeyup="pwCheck()" /></td>
						</tr>

						<tr>
							<td></td>
							<td colspan="5" id="confirmPw"><font size="2">*비밀번호
									재확인을 해 주세요.</font></td>
						</tr>

						<tr>
							<th height="50">Name</th>
							<td colspan="5"><input type="text" id="name" name="mName"
								class="form-control form-control-sm" value="${param.mName }" /></td>
						</tr>

						<tr>
							<th height="50">Phone</th>
							<td align="center" width="40"><select id="phone1"
								class="btn btn-secondary btn-sm dropdown-toggle"><option
										value="010" selected>010</option>
									<option value="011">011</option>
									<option value="012">012</option></select></td>
							<td width="10">─</td>
							<td width="100"><input type="text" id="phone2" name="phone2"
								class="form-control form-control-sm" value="${param.phone2 }" /></td>
							<td width="10">─</td>
							<td width="100"><input type="text" id="phone3" name="phone3" value="${param.phone3 }"
								class="form-control form-control-sm" /></td>

						</tr>

						<tr>
							<th height="50">Email</th>
							<td colspan="3" align="center"><input type="text"
								id="email1" name="email1" class="form-control form-control-sm" value="${param.email1 }" /></td>
							<td>@</td>
							<td><select id="email2" name="email2"
								class="btn btn-secondary btn-sm dropdown-toggle"><option
										value="gmail.com" selected>gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option></select></td>
						</tr>

						<tr>
							<th height="50">Postcode</th>
							<td colspan="3"><input type="text" id="postcode"
								name="mPostcode" class="form-control form-control-sm" value="${param.mPostcode }" /></td>
							<td colspan="2" align="center"><input type="button"
								onclick="orderDaumPostcode()"
								class="btn btn-sm btn-outline-primary" value="우편번호 찾기"></td>
						</tr>

						<tr>
							<th height="50">Address</th>
							<td colspan="5"><input type="text" id="address1" value="${param.mAddress1 }"
								name="mAddress1" class="form-control form-control-sm" /></td>
						</tr>

						<tr>
							<th height="50">Address Detail</th>
							<td colspan="5"><input type="text" id="address2" value="${param.mAddress2 }"
								name="mAddress2" class="form-control form-control-sm" /></td>
						</tr>

						<tr>
							<td width="220" colspan="3" height="80"><button
									type="button" onclick="checkForm()"
									class="btn btn-primary btn-block">JOIN</button></td>
							<td width="220" colspan="3"><button type="button"
									onclick="location.href='basic_login.do'"
									class="btn btn-primary btn-block">GO BACK</button></td>
						</tr>
					</table>
				</form>
			</div>


			<div class="col-md-3"></div>
		</div>
	</div>

</body>
</html>