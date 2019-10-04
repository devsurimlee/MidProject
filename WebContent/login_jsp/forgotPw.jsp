<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if('${message}' != ''){
		alert('${message}');
	}
	function resetPw() {
		var form = document.forgotPwfrm;
		// 필요한 정보가 다 입력되었는지 확인
		if(form.fid.value == ""){
			alert("아이디를 입력하세요.");
			document.forgotIdfrm.name.focus();
			return false;
		}
		
		if(form.fname.value == ""){
			alert("이름을 입력하세요.");
			document.forgotIdfrm.name.focus();
			return false;
		}
		
		if(form.femail1.value == ""){
			alert("이메일을 입력하세요.");
			document.forgotIdfrm.email1.focus();
			return false;
		}
		
		//이메일 한 컬럼에 넣기 위해 합침
		var m = form.femail1.value + "@" + form.femail2.value;
		form.mEmail.value = m;
		
		document.forgotPwfrm.submit();
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
				<h6> 해당 아이디 및 회원정보에 등록된 이름과 이메일을 입력하신 후<br> 비밀번호 재설정을 해 주세요. </h6><br />
				<form role="form" id="forgotPwfrm" name="forgotPwfrm" action="basic_forgotPw.do">
					<input type="hidden" id="email" name="mEmail">
					<table>
						<tr>
							<th width="120" align="right">ID</th>
							<td width="200" colspan="3"><input type="text" id="fid"	name="mId" class="form-control form-control-sm"
														value="${param.mId }" /></td>
						</tr>
						<tr>
							<th height="50">Name</th>
							<td colspan="5"><input type="text" id="fname" name="mName"
											class="form-control form-control-sm" value="${param.mName }" /></td>
						</tr>

						<tr>
							<th height="50">Email</th>
							<td align="center"><input type="text" id="femail1" name="email1" 
												class="form-control form-control-sm" value="${param.email1 }" /></td>
							<td>@</td>
							<td><select id="femail2" name="email2" class="btn btn-secondary btn-sm dropdown-toggle">
									<option value="gmail.com" selected>gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option></select></td>
						</tr>
						<tr>
							<td colspan="4" height="60"><button type="button" onclick="resetPw()" 
														class="btn btn-md btn-primary btn-block"> RESET PASSWORD </button></td>
						</tr>
						<tr>
							<td colspan="4"><button type="button" onclick="location.href='basic_loginForm.do'"
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