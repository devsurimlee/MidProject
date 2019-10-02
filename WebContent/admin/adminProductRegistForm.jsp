<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function p_name_Check() {
		var chkP_name = $("p_name");
		if (chkP_name.value == "") {
			alert("아이디를 입력하세요");
			chkId.focus();
			return false;
		} else {
			window.open("AdminProductPnameCheck.do?key=" + chkP_name.value, "",
					width = "600", height = "400");
		}
	}
</script>
</head>

<body>
	<form role="form" id="frm" name="frm" action="admin_productRegist.do"
		method="post">
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
					<table>
						<tr>
							<th width="140" align="right">상품명 *</th>
							<td width="200"><input type="text" id="p_name" name="p_name"
								class="form-control" /></td>
							<td width="120"><input type="button"
								onclick="p_name_Check()"></td>
						</tr>

						<tr>
							<th>판매가 *</th>
							<td colspan="2"><input type="text" id="p_price"
								name="p_price" class="form-control" /></td>
						</tr>

						<tr>
							<th>상품요약설명</th>
							<td colspan="2"><input type="text" id="#" name="#"
								class="form-control" /></td>
						</tr>

						<tr>
							<th>상세설명</th>
							<td colspan="2"><textarea class="form-control" id="p_detail"
									name="p_detail"> </textarea></td>
						</tr>

						<tr>
							<th>이미지추가</th>
							<td colspan="2"><input type="text" id="#" name="#"
								class="form-control" /></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td colspan="2"><input type="text" id="p_category"
								name="p_category" class="form-control" /></td>
						</tr>

					</table>

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
					<table>
						<tr>
							<th>진열 상태 *</th>
							<td><input type="radio" id="p_show_state"
								name="p_show_state" value="진열"><label> 사용함</label> <input
								type="radio" id="p_show_state" name="p_show_state" value="비진열"
								checked="checked"><label> 사용안함</label></td>
						</tr>
						<tr>
							<th>판매상태</th>
							<td><input type="radio" id="amount" name="amount"
								value="use"><label> 사용함</label> <input type="radio"
								id="amount" name="amount" value="disuse" checked="checked"><label>
									사용안함</label></td>
						</tr>
						<!-- 판매상태 수정이 필요함. -->

					</table>
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
					<table>
						<tr>
							<th>배송비 *</th>
							<td><input type="text" /></td>
							<!-- 판매상태 수정이 필요함. -->
						</tr>

					</table>
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
					<table>
						<tr>
							<th>상품 옵션*</th>

							<!-- 														<td></td> -->
							<!-- 														<td></td> -->

							<td><input type="radio" id="productOption"
								name="productOption" value="use"><label> 사용함</label> <input
								type="radio" id="productOption" name="productOption"
								value="disuse" checked="checked"><label> 사용안함</label></td>
							<td><table>
									<tr>
										<td><label>색상</label></td>
										<td><input type="text" id="p_color" name="p_color"></td>
									</tr>
									<tr>
										<td><label>사이즈</label></td>
										<td><input type="text" id="p_size" name="p_size"></td>
									</tr>
									<tr>
										<td><label>각각 갯수</label></td>
										<td><input type="text" id="amount_count" name="amount_count"></td>
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
								<button type="submit" class="btn btn-primary btn-block">등록</button>
							</td>
						</tr>
					</table>


				</div>




			</div>



		</div>
	</form>
</body>

</html>