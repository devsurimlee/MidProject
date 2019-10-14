<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head><title>OrderList</title>
<script>
	function getKey(orderId){
		location.href = 'admin_orderReadForm.do?orderId='+orderId;
	}
</script>
</head>
<body>
	<div align="center">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> 주문 내역 전체 보기 </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
		
		<div class="row">
			<table class="table">
				<tr align="center">
					<th scope="col" width="50"> 주문번호 </th>
					<th scope="col" width="80"> 주문날짜 </th>
					<th scope="col" width="80"> 출고날짜 </th>
					<th scope="col" width="70"> 수신자명 </th>
					<th scope="col" width="80"> 우편번호 </th>
					<th scope="col" width="300"> 주소 </th>
					<th scope="col" width="200"> 상세주소 </th>
					<th scope="col" width="100"> 전화번호 </th>
					<th scope="col" width="100"> 주문총액 </th>
					<th scope="col" width="100"> 배송상태 </th>
				</tr>
				<c:forEach var="i" items="${orderList }">
					<tr onclick="getKey(${i.orderId})">
						<td align="center"><b>${i.orderId }</b></td>
						<td align="center">${i.orderDate }</td>
						<td align="center">${i.orderDeliveredDate }</td>
						<td align="center">${i.orderName }</td>
						<td align="center">${i.orderPostCode }</td>
						<td>${i.orderAddress1 }</td>
						<td>${i.orderAddress2 }</td>
						<td align="center">${i.orderPhoneNum }</td>
						<td align="center">${i.orderTotalPrice }</td>
						<td align="center">${i.orderDeliverState }</td>
					</tr>
				</c:forEach>
				<!-- 페이징 -->
					<tr><td colspan="11" align="center"><font size="5">
					<c:forEach begin="1" end="${pageCnt}" varStatus="st">
						<c:if test="${param.p != st.count}">
						<a href="admin_orderListForm.do?p=${st.count}">${st.count}</a>
						</c:if> 
						<c:if test="${param.p == st.count}">
							${st.count}
						</c:if>
					</c:forEach>
					</font></td></tr>
			</table>
		</div>
	</div>
</body>
</html>