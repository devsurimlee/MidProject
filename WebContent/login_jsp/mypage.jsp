<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	if('${updateMessage}' != ''){
		alert('${updateMessage}');
	}
</script>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		String grant = (String) session.getAttribute("grant");
	%>
	<div align="center">
		<!-- 헤드 -->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> My Page </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
		
		<!-- 내용 -->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h6> 예담 쇼핑몰을 이용해 주셔서 감사합니다! <b>"${name }"</b>님의 회원 등급은 <b>"${grant }"</b>입니다.</h6><br />
				<button type="button" onclick="location.href='basic_updateMemberForm.do'" class="btn btn-md btn-primary btn-block"> 회원정보 수정 </button>
				<button type="button" onclick="location.href='basic_updatePwForm.do'" class="btn btn-md btn-primary btn-block"> 비밀번호 변경 </button>
				<button type="button" onclick="location.href='basic_myBoardListForm.do'" class="btn btn-md btn-primary btn-block"> 내가 쓴 글 보기 </button>
				<button type="button" onclick="location.href='basic_deleteMemberForm.do'" class="btn btn-md btn-primary btn-block"> 회원 탈퇴 </button>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>