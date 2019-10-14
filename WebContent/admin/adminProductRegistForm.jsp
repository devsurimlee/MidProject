<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="admin/js/imageUpload.js"></script>
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
	<form role="form" id="frm" name="frm" method="post"
		action="admin_productRegist.do" enctype="multipart/form-data">
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
							<td width="120">
								<!-- 							<input type="button" onclick="p_name_Check()"> -->
							</td>
						</tr>

						<tr>
							<th>판매가 *</th>
							<td colspan="2"><input type="text" id="p_price"
								name="p_price" class="form-control" /></td>
						</tr>
						<tr>
							<th>상세설명</th>
							<td colspan="2"><textarea class="form-control" id="p_detail"
									name="p_detail"> </textarea></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td colspan="2">
								<!-- 							<input type="text" id="p_category" --> <!-- 								name="p_category" class="form-control" /> -->
								<select id="p_category" name="p_category">
									<option value="top" selected>top</option>
									<option value="bottom">bottom</option>
									<option value="dress">dress</option>
									<option value="outer">outer</option>
							</select>


							</td>
						</tr>
						<tr>
							<th>썸네일</th>
							<td colspan="2"><a href="javascript:"
								onclick="fileUploadAction();" class="my_button"></a> <!-- 								<div id="sumnail"></div> -->
						</tr>
						<tr>
							<th>썸네일 사진</th>
							<td colspan="2"><input type="file" name="input_imgs"
								id="input_imgs" class="form-control" multiple></td>
						</tr>
						<tr>
							<th>추가사진</th>
							<td colspan="2"><input type="file" name="uploadFile"
								id="uploadFile" class="form-control" multiple>
								<div id="sumnail"></div>
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

							<td><table>
									<tr>
										<td><label>색상</label></td>
										<td><select id="p_color" name="p_color">
												<option value="white" selected>white</option>
												<option value="red">red</option>
												<option value="blue">blue</option>
												<option value="black">black</option>
												<option value="white,red">white,red</option>
												<option value="white,blue">white,blue</option>
												<option value="white,black">white,black</option>
												<option value="red,blue">red,blue</option>
												<option value="red,black">red,black</option>
												<option value="blue,black">blue,black</option>
												<option value="white,red,blue">white,red,blue</option>
												<option value="white,red,black">white,red,black</option>
												<option value="red,blue,black">red,blue,black</option>
												<option value="white,red,blue,black">white,red,blue,black</option>

										</select> <!-- 										<input type="text" id="p_color" name="p_color"></td> -->
									</tr>
									<tr>
										<td><label>사이즈</label></td>
										<td><select id="p_size" name="p_size">
												<option value="free" selected>free</option>
												<option value="S">M</option>
												<option value="M">S</option>
												<option value="R">R</option>
												<option value="S,M">S,M</option>
												<option value="S,R">S,R</option>
												<option value="M,R">M,R</option>
												<option value="S,M,R">S,M,R</option>

										</select> <!-- 										<input type="text" id="p_size" name="p_size"> -->

										</td>
									</tr>
									<tr>
										<td><label>각각 갯수</label></td>
										<td>
										<select id="amount_count" name="amount_count">
												<option value="10" selected>10</option>
												<option value="20" selected>20</option>
												<option value="30" selected>30</option>
												<option value="40" selected>40</option>
												<option value="50" selected>50</option>
												<option value="60" selected>60</option>
												<option value="70" selected>70</option>
												<option value="80" selected>80</option>
												<option value="90" selected>90</option>
												<option value="100" selected>100</option>
										</select>
<!-- 										<input type="text" id="amount_count" -->
<!-- 											name="amount_count"> -->
											
											</td>


									</tr>

								</table></td>
						</tr>
						<tr>


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
