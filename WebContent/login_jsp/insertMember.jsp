<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

		if (form.id.readOnly != true) {
			alert("중복체크를 해주세요.");
			form.id.focus();
			return false;
		}

		if (form.pw.value == "") {
			alert("비밀번호를 입력하세요.");
			form.pw.focus();
			return false;
		}

		if (form.name.value == "") {
			alert("이름을 입력하세요.");
			form.name.focus();
			return false;
		}

		form.submit();
	}

	function idCheck() {
		var chkId = document.frm.id;
		if (chkId.value == "") {
			alert("아이디를 입력하세요.");
			chkId.focus();
			return false;
		}
		window.open("idCheck.do?id=" + chkId.value, "",	"width=600, height=400");
	}
</script>
</head>
<body>
	<div align="center">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<h3><b> JOIN US </b></h3>
					<form role="form" id="frm" name="frm" action="basic_join.do" method="post">
						
						<div class="form-inline">
							<label for="exampleInputEmail1"> ID </label>
							<input type="text" id="id" name="id" type="email" class="form-control"/>
							<input type="button" onclick="idCheck()" value="중복확인">
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1"> Password </label>
							<input type="password" id="password" name="password" class="form-control"/>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1"> Name </label>
							<input type="text" id="name" name="name" class="form-control"/>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1"> Phone </label>
							<input type="text" id="phone" name="phone" class="form-control"/>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1"> Email </label>
							<input type="text" id="email" name="email" class="form-control"/>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1"> Postcode </label>
							<input type="text" id="postcode" name="postcode" class="form-control"/>
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1"> Address </label>
							<input type="text" id="address" name="address" class="form-control"/>
						</div>
						
						<button type="submit" onclick="checkForm()" class="btn btn-primary btn-block"> JOIN </button>
						<button type="button" onclick="location.href='basic_login.do'" class="btn btn-primary btn-block"> GO BACK </button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>