<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head><title>부서목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function getKey(orderId){
		location.href = 'admin_orderReadForm.do?orderId='+orderId;
	}
	
	function clickPage(p){
		document.frm.p.value = p;
		document.frm.submit();
	}
	
	$(function(){
		if("${param.status }"=='전체'){
			$('#btn1').addClass('btn-info');
			$('#btn1').removeClass('btn-outline-info');
		} 
		else if("${param.status }"=='입금완료'){
			$('#btn2').addClass('btn-info');
			$('#btn2').removeClass('btn-outline-info');
		} 
		else if("${param.status }"=='배송준비중'){
			$('#btn3').addClass('btn-info');
			$('#btn3').removeClass('btn-outline-info');
		} 
		else if("${param.status }"=='배송완료'){
			$('#btn4').addClass('btn-info');
			$('#btn4').removeClass('btn-outline-info');
		}
	})
</script>
</head>
<body>
<form action="admin_deliverListForm.do" name="frm">
	<input type="hidden" name="p" value="1">
	<input type="hidden" name="status" value="${param.status }">
</form>
	<div align="center">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> 배송 관리 </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
		
		<div class="row">
		<div class="col-md-12">
			<button id="btn1" type="button" class="btn btn-outline-info btn-lg" onclick="location.href='admin_deliverListForm.do?status=전체'"> &nbsp;&nbsp;&nbsp;&nbsp;전체&nbsp;&nbsp;&nbsp;&nbsp; </button>&nbsp;&nbsp;
			<button id="btn2" type="button" class="btn btn-outline-info btn-lg" onclick="location.href='admin_deliverListForm.do?status=입금완료'"> 입금 완료 </button>&nbsp;&nbsp;
			<button id="btn3" type="button" class="btn btn-outline-info btn-lg" onclick="location.href='admin_deliverListForm.do?status=배송준비중'"> 배송준비중 </button>&nbsp;&nbsp;
			<button id="btn4" type="button" class="btn btn-outline-info btn-lg" onclick="location.href='admin_deliverListForm.do?status=배송완료'"> 배송 완료 </button>
			<br /><br />
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
						<a href="#" onclick="clickPage(${st.count})">${st.count}</a>
						</c:if> 
						<c:if test="${param.p == st.count}">
							${st.count}
						</c:if>
					</c:forEach>
					</font></td></tr>
			</table>
		</div>
	</div>
	</div>
</body>
</html>