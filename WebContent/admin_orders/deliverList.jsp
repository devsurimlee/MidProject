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
	
	function changeDStatus(){
		var length=$('.order').length;
		var array = new Array();
		var dto = new Object();
		
		for(var i=0; i<length; i++){
			dto = new Object();
			dto.orderId = ${orderList[i].orderId };
			dto.orderDeliverState = ${orderList[i].orderDeliverState };
			console.log(dto.orderId);
			array.push(dto);
		}
		
		$.ajax({
			url : 'changeDeliverStatus.do',
			dataType : 'json',
			data: {list: JSON.stringify(array)}, //Array를 JSON string형태로 변환
			success : function(result) {
				
			}
		});
		//location.href='admin_deliverListForm.do?status=배송준비중';
		
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
				<tr id='tr'>
					<th scope="col" width="100"> 주문번호 </th>
					<th scope="col" width="100"> 주문날짜 </th>
					<th scope="col" width="100"> 출고날짜 </th>
					<th scope="col" width="100"> 주문 총액</th>
					<th scope="col" width="100"> 회원ID </th>
					<th scope="col" width="100"> 수신자명 </th>
					<th scope="col" width="100"> 우편번호 </th>
					<th scope="col" width="250"> 주소 </th>
					<th scope="col" width="250"> 상세주소</th>
					<th scope="col" width="200"> 전화번호 </th>
					<th scope="col" width="100" id="th"> 배송상태</th>
				</tr>
				<c:if test="${empty orderList}">
					<tr><td colspan="11" align="center"> 해당 주문 목록이 없습니다. </td></tr>
				</c:if>
				<c:forEach var="i" items="${orderList }">
					<tr>
						<th scope="row" class="order">${i.orderId }</th>
						<td>${i.orderDate }</td>
						<td>${i.orderDeliveredDate }</td>
						<td>${i.orderTotalPrice }</td>
						<td>${i.mId }</td>
						<td>${i.orderName }</td>
						<td>${i.orderPostCode }</td>
						<td>${i.orderAddress1 }</td>
						<td>${i.orderAddress2 }</td>
						<td>${i.orderPhoneNum }</td>
						<c:if test="${i.orderDeliverState == '배송준비중' && param.status == '배송준비중' }">
							<td><select name="dStatus"	class="btn btn-secondary btn-sm dropdown-toggle dStatus">
								<option value="입금완료">입금완료</option>
								<option	value="배송준비중" selected>배송준비중</option>
								<option value="배송완료">배송완료</option></select></td>
						</c:if>
						<c:if test="${param.status != '배송준비중' }">
							<td>${i.orderDeliverState }</td>
						</c:if>
					</tr>
				</c:forEach>
				<c:if test="${param.status == '배송준비중' }">
					<tr><td colspan="10"></td>
					<td><button class="btn btn-outline-secondary btn-sm" onclick="changeDStatus()"> 배송상태변경 </button></td></tr>
				</c:if>
			</table>
				<!-- 페이징 -->
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <li class="page-item">
				    	
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    	<c:forEach begin="1" end="${pageCnt}" varStatus="st">
				    <li class="page-item"><a class="page-link" href="#" onclick="clickPage(${st.count})">${st.count}</a></li>
				    </c:forEach>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
		</div>
	</div>
	</div>
</body>
</html>