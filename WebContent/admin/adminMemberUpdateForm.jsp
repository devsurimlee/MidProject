<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	if ('${message}' != '') {
		alert('${message}');
	}

	var conPw = 0;
	var chPw = 0;
	function checkForm() {
		var form = document.frm;

		if (form.mphone2.value == "" || form.mphone3.value == "") {
			alert("전화번호를 입력하세요.");
			form.phone2.focus();
			return false;
		}

		if (isNaN(form.mphone2.value) == true
				|| isNaN(form.mphone3.value) == true) {
			alert("전화번호는 숫자만 입력해 주세요.");
			form.phone2.focus();
			return false;
		}

		if (form.memail1.value == "") {
			alert("이메일을 입력하세요.");
			form.eamil1.focus();
			return false;
		}

		if (form.mpostcode.value == "") {
			alert("주소를 입력하세요.");
			form.address2.focus();
			return false;
		}

		if (form.maddress2.value == "") {
			alert("상세 주소를 입력하세요.");
			form.address2.focus();
			return false;
		}

		// 휴대폰 번호 한 컬럼에 넣으려고 합침
		var mphone = form.mphone1.value + "-" + form.mphone2.value + "-"
				+ form.mphone3.value;
		form.mPhone.value = mphone;

		// 이메일 한 컬럼에 넣기 위해 합침
		var memail = form.memail1.value + "@" + form.memail2.value;
		form.mEmail.value = memail;

		form.submit();
	}


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
				document.getElementById('mpostcode').value = data.zonecode;
				document.getElementById("maddress1").value = addr + extraAddr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("maddress2").focus();
			}
		}).open();
	}

</script>

<!-- 다음주소 API -->
<script>

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
							<b> 회원 수정 </b>
						</h4>
					</div>
				</div>
				<br /> <br />
			</div>
		</div>

		<div class="row">
			<div class="col-md-3"></div>

			<div class="col-md-6">
				<!-- 회원수정 폼 -->
				<form role="form" id="frm" name="frm"
					action="adminMemberUpdateCommand.do" method="post">
					<input type="hidden" id="phone" name="mPhone"> <input
						type="hidden" id="email" name="mEmail">
					<table>
						<tr>
							<th width="120" align="right">ID</th>
							<td width="320" colspan="5"><input type="text" id="mId"
								name="mId" class="form-control form-control-sm"
								value="${dto.mId }" readonly="readonly" /></td>
							
						</tr>

						<tr>
							<th height="50">Name</th>
							<td colspan="5"><input type="text" id="mName" name="mName"
								readonly="readonly" class="form-control form-control-sm"
								value="${dto.mName }" /></td>
						</tr>

						<tr>
							<th height="50">Phone</th>
							<td align="center" width="40">
							<select id="mphone1"
								class="btn btn-secondary btn-sm dropdown-toggle"><option
										value="010" <c:if test="${splitPhone[0] eq '010' }">selected</c:if>>010</option>
									<option value="011" <c:if test="${splitPhone[0] eq '011' }">selected</c:if>>011</option>
									<option value="012" <c:if test="${splitPhone[0] eq '012' }">selected</c:if>>012</option></select></td>
									
									
							<td width="10">─</td>
							<td width="100"><input type="text" id="mphone2" name="mphone2"
								class="form-control form-control-sm" value="${splitPhone[1] }" /></td>
							<td width="10">─</td>
							<td width="100"><input type="text" id="mphone3" name="mphone3" value="${splitPhone[2] }"
								class="form-control form-control-sm" /></td>
								

						</tr>


						<tr>
							<th height="50">Email</th>
							<td colspan="3" align="center"><input type="text"
								id="email1" name="memail1" class="form-control form-control-sm"
								value="${splitEmail[0] }" /></td>
							<td>@</td>
							<td><select id="email2" name="memail2"
								class="btn btn-secondary btn-sm dropdown-toggle"><option
										value="gmail.com" <c:if test="${splitEmail[1] eq 'gmail.com' }">selected</c:if>>gmail.com</option>
									<option value="naver.com" <c:if test="${splitEmail[1] eq 'naver.com' }">selected</c:if>>naver.com</option>
									<option value="daum.net" <c:if test="${splitEmail[1] eq 'daum.net' }">selected</c:if>>daum.net</option></select></td>
							<!-- 이메일 잘라서 넣어줘야함. -->
						</tr>

						<tr>
							<th height="50">Postcode</th>
							<td colspan="3"><input type="text" id="mpostcode"
								name="mpostcode" class="form-control form-control-sm"
								value="${dto.mPostcode }" /></td>
							<td colspan="2" align="center"><input type="button"
								onclick="orderDaumPostcode()"
								class="btn btn-sm btn-outline-primary" value="우편번호 찾기"></td>
						</tr>

						<tr>
							<th height="50">Address</th>
							<td colspan="5"><input type="text" id="maddress1"
								value="${dto.mAddress1 }" name="maddress1"
								class="form-control form-control-sm" /></td>
						</tr>

						<tr>
							<th height="50">Address Detail</th>
							<td colspan="5"><input type="text" id="maddress2"
								value="${dto.mAddress2 }" name="maddress2"
								class="form-control form-control-sm" /></td>
						</tr>

						<tr>
							<th height="50">User Grade</th>
							<td colspan="5">
							<select id="gGrade" name="gGrade"
								class="btn btn-secondary btn-sm dropdown-toggle"><option
										value="green" <c:if test="${dto.gGrade eq 'green' }">selected</c:if>>green</option>
									<option value="silver" <c:if test="${dto.gGrade eq 'silver' }">selected</c:if>>silver</option>
									<option value="gold" <c:if test="${dto.gGrade eq 'gold' }">selected</c:if>>gold</option>
									<option value="null" <c:if test="${dto.gGrade eq 'null' }">selected</c:if>>null</option>
									<option value="admin" <c:if test="${dto.gGrade eq 'admin' }">selected</c:if>>admin</option></select>
							
						</tr>
						<tr>
							<td width="220" colspan="3" height="80"><button
									type="button" onclick="checkForm()"
									class="btn btn-primary btn-block">수정</button></td>
							<td width="220" colspan="3"><button type="button"
									onclick="location.href='adminMemberListFormCommand.do'"
									class="btn btn-primary btn-block">뒤로가기</button></td>
						</tr>
					</table>
				</form>
			</div>


			<div class="col-md-3"></div>
		</div>
	</div>

</body>
</html>