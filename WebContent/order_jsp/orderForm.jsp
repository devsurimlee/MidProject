<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Bootstrap 4, from LayoutIt!</title>

<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<link href="../mainCSS/bootstrap.min.css" rel="stylesheet">
<link href="../mainCSS/style.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">

				<!--SHIPPING METHOD-->
				<div class="panel panel-default">
					<br />
					<div class="panel-heading text-center">
						<h4>ORDER LIST</h4>
					</div>
					<div class="panel-body">
						<table class="table borderless">
							<thead>
								<tr>
									<td><strong>주문상품</strong></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</thead>
							<tbody>
								<!-- foreach ($order->lineItems as $line) or some such thing here -->
								<tr>
									<td class="col-md-3">
										<div class="media">
											<a class="thumbnail pull-left" href="#"> <img
												class="media-object" src="http://lorempixel.com/460/250/"
												style="width: 72px; height: 72px;">
											</a>
											<div class="media-body">
												<h5 class="media-heading">Product Name</h5>
												<h5 class="media-heading">Product Code</h5>
											</div>
										</div>
									</td>
									<td class="text-center">1</td>
									<td class="text-right"><span>25,000</span><span>원</span></td>
									<td class="text-right"><button type="button"
											class="btn btn-danger">삭제</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!--SHIPPING METHOD END-->

			</div>
		</div>
				
		<div class="row">
			<!-- 주문폼 시작 -->
			<div class="col-md-8">
					<div class="panel-heading text-center">
						<h4>주문자 정보</h4>
					</div>
					<table>
						<tr>
							<td colspan="2"><input type="checkbox" id="sendInfoCheck" name="sendInfoCheck">주문자 정보와 배송지 정보가 같음</td></tr>
						<tr>
							<th width="80">이름</th>
							<td><input type="text" id="orderName" name="orderName"></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" size="5" id="orderPhoneNum1" name="orderPhoneNum1">-<input type="text" size="5">-
							<input type="text" size="5" id="orderPhoneNum2" name="orderPhoneNum2"></td>
						</tr>
						
						<tr>
							<th>주소</th>
							<td><input type="text" size="10"> <input type="button" value="우편번호 찾기" id="orderPostBtn" name="orderPostBtn"></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" value="주소" id="orderAddress1" name="orderAddress1">-
							<input type="text" value="상세주소" id="orderAddress2" name="orderAddress2"></td>
						</tr>
						
						<tr>
							<th>배송메모</th>
							<td><input type="text" size="50" id="orderMemo" name="orderMemo"></td>
						</tr>
					</table><br/><br/>
					
					<table>
						<div class="panel-heading text-center">
							<h4>배송지 정보</h4>
						</div>
						
						<tr>
							<th width="80">이름</th>
							<td><input type="text" id="sendName" name="sendName"></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" size="5" id="sendPhoneNum1" name="sendPhoneNum1">-<input type="text" size="5">-
							<input type="text" size="5" id="sendPhoneNum2" name="sendPhoneNum2"></td>
						</tr>
						
						<tr>
							<th>주소</th>
							<td><input type="text" size="10"> <input type="button" value="우편번호 찾기" id="sendPostBtn" name="sendPostBtn"></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" value="주소" id="sendAddress1" name="sendAddress1">-
							<input type="text" value="상세주소" id="sendAddress2" name="sendAddress2"></td>
						</tr>
						
						<tr>
							<th>배송메모</th>
							<td><input type="text" size="50" id="sendMemo" name="sendMemo"></td>
						</tr>
					</table>

			</div>
			<!-- 주문폼 끝 -->
			
			<!-- 총금액 시작 -->
			<div class="col-md-4">
				<br />
				<!--REVIEW ORDER-->
				<div class="panel panel-default">
					<div class="panel-heading text-center">
						<h4>결제금액</h4>
						<br />
					</div>
					<div class="panel-body">
						<div class="col-md-12">
							<strong>상품합계</strong> <br />
							<div class="pull-right">
								<span>25,000</span><span>원</span>
							</div>
						</div>

						<div class="col-md-12">
							<small>배송비</small>
							<div class="pull-right">
								<span>+2,500</span><span>원</span>
							</div>
							<hr>
						</div>
						<div class="col-md-12">
							<strong>총결제금액</strong>
							<div class="pull-right">
								<span>27,500</span><span>원</span>
							</div>
							<hr>
						</div>

						<button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='orderSuccess.do'">Checkout</button>

					</div>

				</div>
				<!--REVIEW ORDER END-->
			</div>
			<!-- 총금액 끝 -->
			
		</div>
	</div>



	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>