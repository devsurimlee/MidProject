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
							<th>총구매금액</th>
							<th>삭제버튼</th>

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
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'"
									onmouseover="setCursor(this,'pointer')">${dto.mId}</td>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'"
									onmouseover="setCursor(this,'pointer')">${dto.mName }</td>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'"
									onmouseover="setCursor(this,'pointer')">${dto.mEmail }</td>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'"
									onmouseover="setCursor(this,'pointer')">${dto.mPhone }</td>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'"
									onmouseover="setCursor(this,'pointer')">${dto.mAddress1 }</td>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'"
									onmouseover="setCursor(this,'pointer')">${dto.mAddress2 }</td>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'"
									onmouseover="setCursor(this,'pointer')">${dto.gGrade }</td>
								<td
									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.mId}'"
									onmouseover="setCursor(this,'pointer')">${dto.sumOrder}</td>
<!-- 								<td -->
<%-- 									onclick="location.href='adminMemberUpdateFormCommand.do?key=${dto.sumOrder }" --%>
<!-- 									onmouseover="setCursor(this,'pointer')"></td> -->
								<td><input type="button"
									onclick="deleteMember('${dto.mId}')" value="삭제"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		function deleteMember(mId) {
			var confrimDel = confirm("유저를 삭제하시겟습니까?")
			if (confrimDel) {
				location.href = 'adminMemberDeleteCommand.do?key=' + mId;
			} else {
				alert("취소되었습니다.");
			}
		}
		function setCursor(str, str2) {
			str.style.cursor = str2;
		}
	</script>
</body>

</html>