<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<%
		String id = (String) session.getAttribute("id");
	%>
	<div align="center">
		<c:if test="${empty id }">
			<!-- 비로그인시 로그인폼 보임 -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h3 class="text-center"><b>LOGIN</b></h3>
						<form role="form">
							<div class="form-group">
								<label for="exampleInputEmail1"> ID </label>
								<input type="text" class="form-control"  id="id" name="id" />
							</div>
							<div class="form-group">

								<label for="exampleInputPassword1"> Password </label>
								<input type="password" class="form-control" id="pw" name="pw" />
							</div>

							<button type="submit" onclick="checkForm()" class="btn btn-md btn-primary btn-block"> LOGIN </button>
							<button type="button" onclick="location.href='basic_insertMember.do'" class="btn btn-md btn-primary btn-block"> JOIN </button>
						</form>
					</div>
				</div>
			</div>

		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty id }">
			<h1>${id }님이미 로그인 하셨습니다</h1>
			<form id="frm1" name="frm1" action="basic_logout.do" method="post">
				<input type="submit" value="logout"> &nbsp;&nbsp;&nbsp; <input
					type="reset" value="취소">
			</form>
		</c:if>
	</div>
	<p>
</body>
</html>