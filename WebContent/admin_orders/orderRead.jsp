<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> 상세주문내역 </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
				
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div>
					<table class="table">
						<tr>
							<th scope="col" width="100"> 주문번호 </th>
							<th scope="col" width="100"> 상품명 </th>
							<th scope="col" width="100"> 상품 사이즈 </th>
							<th scope="col" width="100"> 상품 색상 </th>
							<th scope="col" width="100"> 주문 수량 </th>
							<th scope="col" width="100"> 가격 </th>
						</tr>
						<c:forEach var="i" items="${read }">
							<tr>
								<th scope="row">${i.orderId }</th>
								<td>${i.pName }</td>
								<td>${i.aSize }</td>
								<td>${i.aColor }</td>
								<td>${i.orderProductCount }</td>
								<td>${i.pPrice }</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="2"></td>
							<td colspan="2" align="center">
							<button type="button" onclick="location.href='admin_orderListForm.do'" class="btn btn-md btn-outline-info btn-block"> LIST </button></td>
							<td colspan="2"></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>