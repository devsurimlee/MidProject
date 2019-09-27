<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function checkForm() {
			var form = document.frm;
			if (form.id.value == "") {
				alert("아이디를 입력하세요.");
				form.id.focus();
				return false;
			}
	
			if (form.pw.value == "") {
				alert("패스워드를 입력하세요.");
				form.pw.focus();
				return false;
			}
	
			form.submit();
		}
	</script>
</head>

<body>
	<% String id = (String) session.getAttribute("id"); %>
	<div align="center">
	<c:if test="${empty id }"> <!-- 비로그인시 로그인폼 보임 -->
		<div>
			<h1>로그인 폼</h1>
		</div>
		<div>
			<form id="frm" name="frm" action="loginCheck.do" method="post">
				<table border="1">
					<tr>
						<th width="100">id</th>
						<td><input type="text" id="id" name="id" size="20"></td>
					</tr>
					<tr>
						<th>password</th>
						<td><input type="password" id="pw" name="pw" size="20"></td>
					</tr>
				</table>
				<p>
					<input type="button" onclick="checkForm()" value="로그인">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">
					<input type="button" value="회원가입" onclick="location.href='insertMember.do'">
			</form>
		</div>
	</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty id }">
			<h1>${id }님 이미 로그인 하셨습니다</h1>
			<form id="frm1" name ="frm1" action="logout.do" method="post">
				<input type="submit" value="logout"> &nbsp;&nbsp;&nbsp;
				<input type="reset" value="취소">
			</form> 
		</c:if>
	</div>
	<p>
</body>
</html>