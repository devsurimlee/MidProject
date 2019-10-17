<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<form id="frm" name="frm" action="adminAmountAdd.do" method="post">
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table"></i> 재고리스트
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>상품명</th>
								<th>상품사이즈</th>
								<th>상품색상</th>
								<th>상품갯수</th>
								<th>수정</th>


							</tr>
						</thead>
						<tbody>
							<c:if test="${amountList.isEmpty() }">
								<tr>
									<td colspan="6">빈테이블</td>
								</tr>

							</c:if>
							<c:forEach items="${amountList }" var="dto">
								<tr>
									<td><input type="hidden" id="amount_id" name="amount_id" value="${dto.amount_id}" >
										<input type="hidden" value="${dto.p_id}"> <input
										type="text" value="${dto.p_name }" readonly="readonly"></td>
									<td>${dto.amount_size}
									 </td>
									<td>${dto.amount_color}</td>
									<td><input type="text" id="amount_count" name="amount_count" value="${dto.amount_count}">
									<button type="button" class="btn1">△</button>
									</td>
									<td><input type="checkbox" class="checkbox" id="chnageIndex" name="changeIndex" onclick="return false" value="${dto.amount_id}"> </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>
		<button onclick="addAmount()">재고수정</button>
		
	</form>
	<script type="text/javascript">
	function addAmount() {
		$('#frm').submit();
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
$(function() {
	$("#dataTable").on("click",".btn1",function(){
		var value= $(this).prev().val();

		var addvalue = (Number(value)+10);

		$(this).prev().val(addvalue);
		
		$(this).prev().trigger("change");
		
	})
	
	
	$("#dataTable").on("change","[name='amount_count']",function(){
		var trparent = $(this).parent().parent();
		trparent.find('.checkbox').attr("checked",true);
		
		
	})
})

// function checksubmit() {
// 	var checked =$("")
	
// }

</script>
	
</body>


</html>