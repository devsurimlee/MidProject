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
	<form id="frm" name="frm" action="">
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
								<tr onclick="">
									<td><input type="hidden" value="${dto.amount_id}" >
										<input type="hidden" value="${dto.p_id}"> <input
										type="text" value="${dto.p_name }" readonly="readonly"></td>
									<td><input type="text" value="${dto.amount_size}" readonly="readonly"> 
									 </td>
									<td><input type="text" value="${dto.amount_color}" readonly="readonly"></td>
									<td><input type="text" value="${dto.amount_count}" onchange="changed()">
									<button type="button"    class="btn1">△</button>
									</td>
									<td><input type="checkbox" readonly="readonly"> </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>
		<input type="submit" value="수정">
		
	</form>
	<script type="text/javascript">
$(function() {
	$(".btn1").on("click",function(){
		$(this).prev().val(+110);
		$(this).next().check();
	})
})


</script>
	
</body>


</html>