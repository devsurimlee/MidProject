<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	<!-- ${getId} : forgotPw에서 받아온 이 회원의 아이디임 -->
	var conPw = 0;
	var chPw = 0;
	function resetPw() {
		var form = document.resetPwfrm;
		
		// 필요한 정보가 다 입력되었는지 확인
		if (form.password1.value == "") {
			alert("재설정할 비밀번호를 입력하세요.");
			form.password1.focus();
			return false;
		}
		
		if (conPw == 0) {
			alert("비밀번호 조건을 확인해 주세요.");
			form.password1.focus();
			return false;
		}

		if (chPw == 0) {
			alert("비밀번호 재확인을 해 주세요.");
			form.password2.focus();
			return false;
		}
		
		document.resetPwfrm.submit();
	}
	
	// 비밀번호 조건 확인: 숫자, 특수문자 혼합하여 6-8자리
	// 밑에다 합쳐놨음 지금 안 씀: 비밀번호 조건 만족 안 할 때 재확인 완료 후 조건 만족하면 재확인이 제대로 안 되는 문제가 있음
	function pwCondition() {
		var first = $("#password1").val();
		
		var pattern1 = /[0-9]/;
		var pattern2 = /[~!@#$%^&*()_+|<>?:{}]/;

		// 비밀번호 조건 체크
		if (first.length >= 6 && first.length <= 8) { // 길이 체크
			if (pattern1.test(first) && pattern2.test(first)) { // 숫자, 특수문자 혼합
				conPw = 1;
				$("#conditionPw").text("");
			} else {
				conPw = 0;
				$("#conditionPw").text("");
				$("#conditionPw").append("<font size=\"2\" color=\"red\"> *숫자, 특수문자를 혼합하여 6-8자리 </font>");
			}
		} else {
			conPw = 0;
			$("#conditionPw").text("");
			$("#conditionPw").append("<font size=\"2\" color=\"red\"> *숫자, 특수문자를 혼합하여 6-8자리 </font>");
		}
	}
	
	// 비밀번호 조건 확인: 숫자, 특수문자 혼합하여 6-8자리 // 비밀번호 재확인
	function pwCheck() {
		var first = $("#password1").val();
		var second = $("#password2").val();
		
		var pattern1 = /[0-9]/;
		var pattern2 = /[~!@#$%^&*()_+|<>?:{}]/;

		// 비밀번호 조건 체크
		if (first.length >= 6 && first.length <= 8) { // 길이 체크
			if (pattern1.test(first) && pattern2.test(first)) { // 숫자, 특수문자 혼합
				conPw = 1;
				$("#conditionPw").text("");
			} else {
				conPw = 0;
				$("#conditionPw").text("");
				$("#conditionPw").append("<font size=\"2\" color=\"red\"> *숫자, 특수문자를 혼합하여 6-8자리 </font>");
			}
		} else {
			conPw = 0;
			$("#conditionPw").text("");
			$("#conditionPw").append("<font size=\"2\" color=\"red\"> *숫자, 특수문자를 혼합하여 6-8자리 </font>");
		}

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
</head>
<body>
	<div align="center">
	
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> 비밀번호 재설정 </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-3"></div>

			<div class="col-md-6">
				<h6> 저희 쇼핑몰은 보안상의 이유로 기존 비밀번호를 알려드릴 수 없습니다.<br>비밀번호를 다시 설정해 주세요. </h6><br />
				<form role="form" id="resetPwfrm" name="resetPwfrm" action="basic_resetPw.do">
					<input type="hidden" id="getId" name="getId" value="${getId }">
					<table>
						<tr>
							<th height="30" width="150"> New Password </th>
							<td width="290"><input type="password" id="password1" name="mPw" class="form-control form-control-sm"
								onkeyup="pwCheck()" /></td>
						</tr>
						<tr>
							<td height="30"></td>
							<td id="conditionPw"><font size="2">*비밀번호는 숫자, 특수문자를 혼합하여 6-8자리</font></td>
						</tr>

						<tr>
							<th height="30"> Confirm Password </th>
							<td><input type="password" id="password2" class="form-control form-control-sm" 
								onkeyup="pwCheck()" /></td>
						</tr>

						<tr>
							<td height="30"></td>
							<td id="confirmPw"><font size="2">*비밀번호 재확인을 해 주세요.</font></td>
						</tr>
						<tr>
							<td colspan="2" height="60"><button type="button" onclick="resetPw()" 
														class="btn btn-md btn-primary btn-block"> RESET PASSWORD </button></td>
						</tr>
						<tr>
							<td colspan="2"><button type="button" onclick="location.href='basic_forgotPwForm.do'"
											class="btn btn-primary btn-block"> GO BACK </button></td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>