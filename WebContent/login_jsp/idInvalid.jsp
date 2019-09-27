<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function isDateSend() {
		opener.document.frm.id.value = "";
		opener.document.frm.id.focus();
		window.close();
	}
</script>
</head>
<body>
	<div align="center">
		<h1>${param.id}은(는)이미 사용 중인 아이디 입니다.</h1>
		<input type="button" onclick="isDateSend()" value="확인">
	</div>
</body>
</html>