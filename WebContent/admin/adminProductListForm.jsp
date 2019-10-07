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
	<div class="card mb-3">
		<div class="card-header">
			<i class="fas fa-table"></i> 상품리스트
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th hidden="true">상품번호</th>
							<th>상품명</th>
							<th>가격</th>
							<th>상품사이즈</th>
							<th>상품색상</th>
							<th>분류</th>
							<!-- 							<th>재고상태</th> -->
						</tr>
					</thead>
					<tbody>
						<c:if test="${list.isEmpty() }">
							<tr>
								<td colspan="6">빈테이블</td>
							</tr>

						</c:if>

						<c:forEach items="${list }" var="dto">
							<tr
								onclick="location.href='admin_productUpdateForm.do?key=${dto.p_id}'">
								<td hidden="true">${dto.p_name }</td>
								<td>${dto.p_name }</td>
								<td>${dto.p_price }</td>
								<td>${dto.p_size }</td>
								<td>${dto.p_color }</td>
								<td>${dto.p_category }</td>

							</tr>


						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="card-footer small text-muted">
			<%-- 			<c:if test="${id != null }"> --%>
			<!-- 				<button type="button" onclick="location.href='admin_productDelete.do'">삭제	</button> -->
			<%-- 			</c:if> --%>
			Updated yesterday at 11:59 PM

		</div>
	</div>
</body>
</html>