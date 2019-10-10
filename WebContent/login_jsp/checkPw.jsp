<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
if('${passwordMessage}' != ''){
	alert('${passwordMessage}');
}
	function pwButton(){
		var form = document.pwfrm;
		var pattern1 = /[0-9]/;
		
		if(form.pw.value == ""){
			alert("비밀번호를 입력하세요.");
			form.pw.focus();
			return false;
		}
		form.submit();
	}
</script>
</head>
<body>
	<div class="col-md-12">
		<div class="panel panel-default"><br />
			<div class="panel-heading text-center">
				<h4><b> 비밀번호 변경 </b></h4>
			</div>
		</div><br /><br />
	</div>
	<div class="row">
		<div class="col-md-3"></div>

		<div class="col-md-6" align="center">
			<form role="form" id="pwfrm" name="pwfrm" action="basic_checkPw.do">
				<input type="hidden" id=qbId name=qbId value="${qbId }">
				<table>
					<tr><td align="center" height="50" colspan="2"><b> 현재 비밀번호를 입력해 주세요. </b></td></tr>
					<tr>
						<th width="120" height="50"> PASSWORD </th>
						<td><input type="password" class="form-control" id="pw" name="pw" /></td>
					</tr>
					<tr>
						<td colspan="2"><button type="button" onclick="pwButton()" class="btn btn-md btn-primary btn-block"> CHECK </button></td>
					</tr>
					<tr>
						<td colspan="2"><button type="button" onclick="location.href='basic_mypageForm.do'" class="btn btn-md btn-primary btn-block"> MY PAGE </button></td>
					</tr>
				</table>
			</form>
		</div>

		<div class="col-md-3"></div>
	</div>
</body>
</html>