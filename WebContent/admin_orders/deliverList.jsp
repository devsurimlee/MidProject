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
		var array = new Array();
		var no=$('.order');
		var st;
		if("${param.status }" == '배송준비중') {
			st = $('.status1');
		} else if("${param.status }" == '입금완료'){
			st = $('.status2');
		}
		
		for(var i=0; i<no.length; i++){
			var dto = new Object();
			var id = no.get(i).innerHTML;
			var status = st.get(i).options[st.get(i).selectedIndex].value;
			dto.orderId = id;
			dto.orderDeliverState = status;
			array.push(dto);
		}
		
		$.ajax({
			url : 'changeDeliverStatus.do',
			dataType : 'json',
			type: 'POST',
			data: {list: JSON.stringify(array)}, //Array를 JSON string형태로 변환
			success : function(result) {
				if(result == 1){
					for(var i=0; i<no.length; i++){
						if(status != '배송준비중'){
						console.log("현상태"+status);
						console.log(array[i].orderDeliverState);
						}
					}
					location.reload();
				}
			}
		});
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
<style>
.tr:hover{background-color: lightcyan; cursor: pointer}
</style>
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
			<form role="form" id="searchfrm" name="searchfrm" action="admin_deliverListForm.do" method="post">
				<input type="hidden" name="p" value="1">
				<input type="hidden" name="status" value="${param.status }">
				<table>
					<tr><td><select id="selectKey" name="selectKey" class="btn btn-outline-warning btn-sm dropdown-toggle">
							<option	value="o_id" selected>주문번호</option>
							<option value="m_id">회원ID</option>
							<option value="o_phone">전화번호</option></select></td>
					<td width="300"><input type="text" id='keyword' name='keyword' class="form-control"></td>
					<td><button id='searchBtn' name='searchBtn' onclick='searchBtn' class="btn btn-outline-warning btn-sm">검색</button></td>
				</table><br />
			</form>
			<table class="table">
				<tr id='tr' align="center">
					<th scope="col" width="80"> 주문번호 </th>
					<th scope="col" width="80"> 주문날짜 </th>
					<th scope="col" width="80"> 출고날짜 </th>
					<th scope="col" width="70"> 회원ID </th>
					<th scope="col" width="70"> 수신자명 </th>
					<th scope="col" width="80"> 우편번호 </th>
					<th scope="col" width="300"> 주소 </th>
					<th scope="col" width="200"> 상세주소</th>
					<th scope="col" width="100"> 전화번호 </th>
					<th scope="col" width="100"> 주문총액</th>
					<th scope="col" width="100" id="th"> 배송상태</th>
				</tr>
				<c:if test="${empty orderList}">
					<tr><td colspan="11" align="center"> 해당 주문 목록이 없습니다. </td></tr>
				</c:if>
				<c:forEach var="i" items="${orderList }">
					<tr class="tr">
						<th class="order" align="center" onclick="getKey(${i.orderId})">${i.orderId }</th>
						<td align="center" onclick="getKey(${i.orderId})">${i.orderDate }</td>
						<td align="center" onclick="getKey(${i.orderId})">${i.orderDeliveredDate }</td>
						<td align="center" onclick="getKey(${i.orderId})">${i.mId }</td>
						<td align="center" onclick="getKey(${i.orderId})">${i.orderName }</td>
						<td align="center" onclick="getKey(${i.orderId})">${i.orderPostCode }</td>
						<td onclick="getKey(${i.orderId})">${i.orderAddress1 }</td>
						<td onclick="getKey(${i.orderId})">${i.orderAddress2 }</td>
						<td align="center" onclick="getKey(${i.orderId})">${i.orderPhoneNum }</td>
						<td align="center" onclick="getKey(${i.orderId})">${i.orderTotalPrice }</td>
						<c:if test="${i.orderDeliverState == '배송준비중' && param.status == '배송준비중' }">
							<td align="center"><select id="status1" name="status1"	class="btn btn-secondary btn-sm dropdown-toggle status1">
								<option value="입금완료">입금완료</option>
								<option	value="배송준비중" selected>배송준비중</option>
								<option value="배송완료">배송완료</option></select></td>
						</c:if>
						<c:if test="${i.orderDeliverState == '입금완료' && param.status == '입금완료' }">
							<td align="center"><select id="status2" name="status2"	class="btn btn-secondary btn-sm dropdown-toggle status2">
								<option value="입금완료" selected>입금완료</option>
								<option	value="배송준비중">배송준비중</option>
								<option value="배송완료">배송완료</option></select></td>
						</c:if>
						<c:if test="${param.status != '배송준비중' && param.status != '입금완료' }">
							<td align="center" onclick="getKey(${i.orderId})">${i.orderDeliverState }</td>
						</c:if>
					</tr>
				</c:forEach>
				<c:if test="${param.status == '배송준비중' || param.status == '입금완료' }">
					<tr><td colspan="10"></td>
					<td align="center"><button type="button" class="btn btn-outline-secondary btn-sm" onclick="changeDStatus()"> 배송상태변경 </button></td></tr>
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