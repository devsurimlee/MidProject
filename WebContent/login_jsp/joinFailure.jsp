<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<br />
					<div class="panel-heading text-center">
						<h4>
							<b> 회원가입에 실패하셨습니다. 다시 시도해 주세요. </b>
						</h4>
					</div>
				</div>
				<br /> <br />
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<jsp:forward page="insertMember.jsp"></jsp:forward>
			</div>
		</div>
</div>
	
</body>
</html>