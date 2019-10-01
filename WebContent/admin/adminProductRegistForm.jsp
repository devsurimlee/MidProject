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
							<b> 상품기본정보 </b>
						</h4>
					</div>
				</div>
				<br /> <br />
			</div>
		</div>

		<div class="row">
			<div class="col-md-3"></div>

			<div class="col-md-6">
				<form role="form" id="frm" name="frm" action="basic_join.do"
					method="post">
					<table>
						<tr>
							<th width="140" align="right">상품명 *</th>
							<td width="200"><input type="text" id="p_id" name="p_id"
								class="form-control" /></td>
							<td width="120"><input type="button" onclick="pidCheck()"
								value="중복확인"></td>
						</tr>

						<tr>
							<th>판매가 *</th>
							<td colspan="2"><input type="text" id="text" name="text"
								class="form-control" /></td>
						</tr>

						<tr>
							<th>상품요약설명</th>
							<td colspan="2"><input type="text" id="name" name="name"
								class="form-control" /></td>
						</tr>

						<tr>
							<th>상세설명</th>
							<td colspan="2"><textarea class="form-control"> </textarea></td>
						</tr>

						<tr>
							<th>이미지추가</th>
							<td colspan="2"><input type="text" id="email" name="email"
								class="form-control" /></td>
						</tr>

					</table>
				</form>

			</div>




		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<br />
					<div class="panel-heading text-center">
						<h4>
							<b> 쇼핑몰 진열 설정 </b>
						</h4>
					</div>
				</div>
				<br /> <br />
			</div>
		</div>
		<div class="row">
			<div class="col-md-3"></div>

			<div class="col-md-6">
				<form role="form" id="frm" name="frm" action="basic_join.do"
					method="post">
					<table>
						<tr>
							<th>진열 상태 *</th>
							<td><input type="radio" id="productShowState"
								name="productShowState" value="use"><label> 사용함</label>
								<input type="radio" id="productShowState"
								name="productShowState" value="disuse" checked="checked"><label>
									사용안함</label></td>
						</tr>
						<tr>
							<th>판매상태</th>
							<td><input type="radio" id="productOption"
								name="acountNumber" value="use"><label> 사용함</label> <input
								type="radio" id="productOption" name="acountNumber"
								value="disuse" checked="checked"><label> 사용안함</label></td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<br />
					<div class="panel-heading text-center">
						<h4>
							<b> 배송 </b>
						</h4>
					</div>
				</div>
				<br /> <br />
			</div>
		</div>
		<div class="row">
			<div class="col-md-3"></div>

			<div class="col-md-6">
				<form role="form" id="frm" name="frm" action="basic_join.do"
					method="post">
					<table>
						<tr>
							<th>배송비 *</th>
							<td><input type="text" /></td>
						</tr>

					</table>
				</form>
			</div>
		</div>



		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<br />
					<div class="panel-heading text-center">
						<h4>
							<b> 옵션 설정 </b>
						</h4>
					</div>
				</div>
				<br /> <br />
			</div>
		</div>
		<div class="row">
			<div class="col-md-3"></div>

			<div class="col-md-6">
				<form role="form" id="frm" name="frm" action="basic_join.do"
					method="post">
					<table>
						<tr>
							<th>상품 옵션*</th>

							<!-- 							<td></td> -->
							<!-- 							<td></td> -->

							<td><input type="radio" id="productOption"
								name="productOption" value="use"><label> 사용함</label> <input
								type="radio" id="productOption" name="productOption"
								value="disuse" checked="checked"><label> 사용안함</label></td>
							<td><table>
									<tr>
										<td><label>색상</label></td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<td><label>사이즈</label></td>
										<td><input type="text"></td>
									</tr>

								</table></td>
						</tr>
						<tr>


						</tr>
						<tr>
							<th>재고 관리*</th>
							<td><input type="radio" id="amountOption"
								name="amountOption" value="use"><label> 사용함</label> <input
								type="radio" id="amountOption" name="amountOption"
								value="disuse" checked="checked"><label> 사용안함</label></td>
						</tr>
					</table>



					<div style="height: 11px;">&nbsp;</div>
					<table>
						<tr>
							<td width="230">
								<!-- <button type="submit" onclick="checkForm()" class="btn btn-primary btn-block"> JOIN </button> -->
								<button type="submit" class="btn btn-primary btn-block">
									JOIN</button>
							</td>
							<td width="230"><button type="button"
									onclick="location.href='basic_login.do'"
									class="btn btn-primary btn-block">GO BACK</button></td>
						</tr>
					</table>

				</form>

			</div>




		</div>



	</div>

</body>

</html>