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
			<i class="fas fa-table"></i> 유저리스트
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>유저아이디</th>
							<th>유저네임</th>
							<th>이메일</th>
							<th>폰번호</th>
							<th>주소</th>
							<th>주소2</th>
							<th>등급</th>
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
							<tr>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'">
									${dto.mId}</td>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'">

									${dto.mName }</td>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'">

									${dto.mEmail }</td>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'">

									${dto.mPhone }</td>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'">

									${dto.mAddress1 }</td>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'">

									${dto.mAddress2 }</td>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'">

									${dto.gGrade }</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>
</body>
</html>