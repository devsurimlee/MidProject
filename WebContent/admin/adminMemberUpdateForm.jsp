<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>
	<form role="form" id="frm" name="frm" action="admin_productRegist.do"
		method="post">
		<div align="center">
			<table>
				<tr>
					<td>유저아이디</td>
					<td>유저이름</td>
					<td>이메일</td>
					<td>폰번호</td>
					<td>주소</td>
					<td>등급</td>

				</tr>
				<tr>
					<td><input type="text" id="mId" value="${dto.mId }" readonly="readonly"></td>
					<td><input type="text" id="mName" value="${dto.mName }"></td>
					<td><input type="text" id="mEmail" value="${dto.mEmail }"></td>
					<td><input type="text" id="mPhone" value="${dto.mPhone }"></td>
					<td><input type="text" id="mAddress1" value="${dto.mAddress1 }"></td>
					<td><input type="text" id="gGrade" value="${dto.gGrade }"></td>

				</tr>


			</table>

		</div>
	</form>
	<form action="">
		<input type="button" onclick="admin_memberUpdate.do?key${dto}">
	</form>
	<form action="admin_memberDelete.do">
		<input type="button" onclick="admin_memberDelete.do?key${dto.mId}">
	</form>
</body>
</html>