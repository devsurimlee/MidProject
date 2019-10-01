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
							<b> 회원이 되신 것을 축하드립니다. </b>
						</h4>
					</div>
				</div>
				<br /> <br />
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<jsp:forward page="loginForm.jsp"></jsp:forward>
			</div>
		</div>
</div>
</body>
</html>