<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head><title>부서목록</title>
<script>
	function getKey(orderId){
		location.href = 'basic_myOrderReadForm.do?orderId='+orderId;
	}
</script>
</head>
<body>

<c:if>

		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> MY ORDERS LIST </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
		
		<div class="row">
			<table class="table">
				<tr>
					<th scope="col" width="100"> 주문번호 </th>
					<th scope="col" width="100"> 주문날짜 </th>
					<th scope="col" width="100"> 출고날짜 </th>
					<th scope="col" width="100"> 주문 총액</th>
					<th scope="col" width="100"> 회원ID </th>
					<th scope="col" width="100"> 수신자명 </th>
					<th scope="col" width="150"> 수신 우편번호 </th>
					<th scope="col" width="250"> 수신 주소 </th>
					<th scope="col" width="250"> 수신 상세주소</th>
					<th scope="col" width="200"> 수신자 전화번호 </th>
					<th scope="col" width="100"> 배송상태</th>
				</tr>
				<c:forEach var="i" items="${orderList }">
					<tr onclick="getKey(${i.orderId})">
						<th scope="row">${i.orderId }</th>
						<td>${i.orderDate }</td>
						<td>${i.orderDeliveredDate }</td>
						<td>${i.orderTotalPrice }</td>
						<td>${i.mId }</td>
						<td>${i.orderName }</td>
						<td>${i.orderPostCode }</td>
						<td>${i.orderAddress1 }</td>
						<td>${i.orderAddress2 }</td>
						<td>${i.orderPhoneNum }</td>
						<td>${i.orderDeliverState }</td>
					</tr>
				</c:forEach>
				<!-- 페이징 -->
					<tr><td colspan="11" align="center"><font size="5">
					<c:forEach begin="1" end="${pageCnt}" varStatus="st">
						<c:if test="${param.p != st.count}">
						<a href="basic_myOrderList.do?p=${st.count}">${st.count}</a>
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