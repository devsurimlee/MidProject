<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function closeWindow() {
		opener.document.frm.id.readOnly = true;
		opener.document.frm.pw.focus();
		window.close();
	}
</script>
</head>
<body>
	<div align="center">
		<h1>${param.id}&nbsp;사용가능한 아이디 입니다.</h1>
		<input type="button" onclick="closeWindow()" value="확인">
	</div>


</body>
</html>