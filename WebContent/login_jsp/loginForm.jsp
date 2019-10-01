<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default"><br />
							<div class="panel-heading text-center">
								<h4><b> LOGIN </b></h4>
							</div>
						</div><br /><br />
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-3"></div>

					<div class="col-md-6">
						<form role="form" id="frm" name="frm" action="basic_loginCheck.do">
							<table>
								<tr>
									<th width="100"> ID </th>
									<td width="240"><input type="text" class="form-control"  id="id" name="id" /></td>
								</tr>
								<tr>
									<th> Password </th>
									<td><input type="password" class="form-control" id="pw" name="pw" /></td>
								</tr>
							</table>
							<div style="height: 11px;">&nbsp;</div>
							<table>
								<tr>
									<td colspan="2"><button type="submit" onclick="checkForm()" class="btn btn-md btn-primary btn-block"> LOGIN </button></td>
								</tr>
								<tr>
									<td colspan="2"><button type="button" onclick="location.href='basic_insertMember.do'" class="btn btn-md btn-primary btn-block"> JOIN </button></td>
								</tr>
								<tr>
									<td width="170"><button type="button" onclick="location.href='########.do'" class="btn btn-md btn-primary btn-block"> 아이디 찾기 </button></td>
									<td width="170"><button type="button" onclick="location.href='########.do'" class="btn btn-md btn-primary btn-block"> 비밀번호 찾기 </button></td>
								</tr>
							</table>
						</form>
					</div>
					
					<div class="col-md-3"></div>
				</div>
		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty id }">
			<h1>${id }님이미 로그인 하셨습니다</h1>
			<form id="frm1" name="frm1" action="basic_logout.do" method="post">
				<input type="submit" value="logout">
			</form>
		</c:if>
	</div>
	<p>
</body>
</html>