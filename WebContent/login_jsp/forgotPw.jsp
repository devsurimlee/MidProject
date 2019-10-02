<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function resetPw() {
		
	}
	
	// 비밀번호 조건 확인: 숫자, 특수문자 혼합하여 6-8자리
	function pwCondition() {
		var pattern1 = /[0-9]/;
		var pattern2 = /[~!@#$%^&*()_+|<>?:{}]/;

		var first = document.joinfrm.password1;

		// 비밀번호 조건 체크
		if (first.value.length >= 6 && first.value.length <= 8) { // 길이 체크
			if (pattern1.test(first.value) && pattern2.test(first.value)) { // 숫자, 특수문자 혼합
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
				<h6> 비밀번호를 다시 설정해 주세요. </h6><br />
				<form role="form" id="forgotPwfrm" name="forgotPwfrm" action="###################################">
					<input type="hidden" id="email" name="mEmail">
					<table>
						<tr>
							<th height="30" width="150"> New Password </th>
							<td><input type="password" id="password1"
								name="mPw" class="form-control form-control-sm"
								onkeyup="pwCondition()" /></td>
						</tr>
						<tr>
							<td height="30"></td>
							<td id="conditionPw"><font size="2">*비밀번호는
									숫자, 특수문자를 혼합하여 6-8자리</font></td>
						</tr>

						<tr>
							<th height="30"> Confirm Password </th>
							<td><input type="password" id="password2"
								class="form-control form-control-sm" onkeyup="pwCheck()" /></td>
						</tr>

						<tr>
							<td height="30"></td>
							<td id="confirmPw"><font size="2">*비밀번호
									재확인을 해 주세요.</font></td>
						</tr>
						<tr>
							<td colspan="2" height="60"><button type="button" onclick="resetPw()" class="btn btn-md btn-primary btn-block"> RESET PASSWORD </button></td>
						</tr>
						<tr>
							<td colspan="2"><button type="button"
									onclick="location.href='basic_loginForm.do'"
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