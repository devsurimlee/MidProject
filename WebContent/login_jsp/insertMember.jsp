<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function checkForm() {
		var form = document.frm;

		if (form.id.value == "") {
			alert("아이디를 입력하세요.");
			form.id.focus();
			return false;
		}

		if (form.id.readOnly != true) {
			alert("중복체크를 해주세요.");
			form.id.focus();
			return false;
		}

		if (form.pw.value == "") {
			alert("비밀번호를 입력하세요.");
			form.pw.focus();
			return false;
		}

		if (form.name.value == "") {
			alert("이름을 입력하세요.");
			form.name.focus();
			return false;
		}

		form.submit();
	}

	function idCheck() {
		var chkId = document.frm.id;
		if (chkId.value == "") {
			alert("아이디를 입력하세요.");
			chkId.focus();
			return false;
		}

		/* $.ajax({
			url : 'IdCheck.do',
			dataType : {
				id : document.frm.id.value
			},
			success : function(result) {
				$('#myModal').on('shown.bs.modal', function() {
					$('#contents').html()
				})
			}
		}); */

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
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> JOIN US </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>

		<div class="row">
			<!-- 회원가입 폼 -->
			<div class="col-md-3"></div>

			<div class="col-md-6">
				<form role="form" id="frm" name="frm" action="basic_join.do"
					method="post">
					<table>
						<tr>
							<th width="140" align="right">ID</th>
							<td width="200"><input type="text" id="id" name="id"
								type="email" class="form-control" /></td>
							<td width="120"><input type="button" onclick="idCheck()"
								value="중복확인"></td>
						</tr>

						<tr>
							<th>Password</th>
							<td colspan="2"><input type="password" id="password"
								name="password" class="form-control" /></td>
						</tr>

						<tr>
							<th>Name</th>
							<td colspan="2"><input type="text" id="name" name="name"
								class="form-control" /></td>
						</tr>

						<tr>
							<th>Phone</th>
							<td colspan="2"><input type="text" id="phone" name="phone"
								class="form-control" /></td>
						</tr>

						<tr>
							<th>Email</th>
							<td colspan="2"><input type="text" id="email" name="email"
								class="form-control" /></td>
						</tr>

						<tr>
							<th>Postcode</th>
							<td><input type="text" id="postcode" name="postcode"
								class="form-control" /></td>
							<td><input type="button" onclick="orderDaumPostcode()"
								value="우편번호 찾기"></td>
						</tr>

						<tr>
							<th>Address</th>
							<td colspan="2"><input type="text" id="address1"
								name="address1" class="form-control" /></td>
						</tr>

						<tr>
							<th>Address Detail</th>
							<td colspan="2"><input type="text" id="address2"
								name="address2" class="form-control" /></td>
						</tr>
					</table>
					<div style="height: 11px;">&nbsp;</div>
					<table>
						<tr>
							<td width="230">
								<!-- <button type="submit" onclick="checkForm()" class="btn btn-primary btn-block"> JOIN </button> -->
								<button type="submit" class="btn btn-primary btn-block">
									JOIN</button>
							</td>
							<td width="230"><button type="button"
									onclick="location.href='basic_login.do'"
									class="btn btn-primary btn-block">GO BACK</button></td>
						</tr>
					</table>

				</form>

			</div>


			<div class="col-md-3"></div>

		</div>
	</div>

	<!-- <div class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"> ID 중복 </h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p id="contents"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal"> Try Again </button>
				</div>
			</div>
		</div>
	</div> -->

</body>
</html>