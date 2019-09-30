<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#foo').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#imgInp").change(function() {
		readURL(this);
	});
</script>

</head>
<body>

	<div class="content-body">

		<div class="container-fluid">


			<div class="row justify-content-center">
				<div class="col-lg-12">

					<div class="card">
						<label class="col-lg-4 col-form-label" for="val-username"
							onclick=""> 상품 기본 정보</label>

						<div class="card-body">
							<div class="form-validation" id="BasicInfo">
								<form class="form-valide" action="#" method="post">
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="val-username">상품명
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="val-username"
												name="val-username" placeholder="플라워 미니 스커트 등...">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="val-email">판매가
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="val-email"
												name="val-email">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="val-password">상품
											요약 설명 <span class="text-danger"></span>
										</label>
										<div class="col-lg-6">
											<input type="password" class="form-control" id="val-password"
												name="val-password">
										</div>
									</div>

									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="val-suggestions">상세설명
											<span class="text-danger"></span>
										</label>
										<div class="col-lg-6">
											<textarea class="form-control" id="val-suggestions"
												name="val-suggestions" rows="5"></textarea>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="val-suggestions">이미지
											추가 <span class="text-danger"></span>
										</label>


										<div class="col-lg-6">
											<input type='file' id="imgInp" /> <img id="foo" src="#" />
										</div>
									</div>


								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<label class="col-lg-4 col-form-label" for="val-username"
							onclick=""> 쇼핑몰 진열 설정</label>
						<div class="card-body">
							<div class="form-validation">
								<form class="form-valide" action="#" method="post">
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="val-username">진열상태
											<span class="text-danger">*</span>
										</label>
										<div>
											<input type="radio" id="productShowState"
												name="productShowState" value="use"><label>
												사용함</label> <input type="radio" id="productShowState"
												name="productShowState" value="disuse" checked="checked"><label>
												사용안함</label>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="val-email">판매상태
											<span class="text-danger">*</span>
										</label>
										<div>
											<input type="radio" id="productOption" name="acountNumber"
												value="use"><label> 사용함</label> <input type="radio"
												id="productOption" name="acountNumber" value="disuse"
												checked="checked"><label> 사용안함</label>
										</div>
									</div>


								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<label class="col-lg-4 col-form-label" for="val-username"
							onclick=""> 옵션 설정</label>
						<div class="card-body">
							<div class="form-validation">
								<form class="form-valide" action="#" method="post">
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="val-username">상품옵션
											<span class="text-danger">*</span>
										</label>
										<div>
											<input type="radio" id="productOption" name="productOption"
												value="use"><label> 사용함</label> <input type="radio"
												id="productOption" name="productOption" value="disuse"
												checked="checked"><label> 사용안함</label>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="val-username">옵션설정
											<span class="text-danger">*</span>
										</label>
										<div>
											<input type="radio" id="productOption" name="productOption"
												value="use"><label> 사용함</label> <input type="radio"
												id="productOption" name="productOption" value="disuse"
												checked="checked"><label> 사용안함</label>
										</div>


									</div>
									<div class="form-group row">
										<label class="col-lg-4 col-form-label" for="val-email">재고관리
											<span class="text-danger">*</span>
										</label>
										<div>
											<input type="radio" id="amountOption" name="amountOption"
												value="use"><label> 사용함</label> <input type="radio"
												id="amountOption" name="amountOption" value="disuse"
												checked="checked"><label> 사용안함</label>
										</div>
									</div>


								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- #/ container -->
	</div>

</body>
</html>