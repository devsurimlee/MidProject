<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
        request.setCharacterEncoding("UTF-8");
        String grant = request.getParameter("grant");
        String name = request.getParameter("name");
%>
<script>
if('${answerMessage}' != ''){
	alert('${answerMessage}');
}
	function deleteQna(){
		var qbId = ${content.qbId };
		var result = confirm("확인을 누르시면 문의글이 삭제됩니다.");
        if(result == true) {
        	location.href = 'admin_qnaDelete.do?id='+qbId;
        } else {
        	false;
        }
	}
	
	function answerQna(){
		var qbId = ${content.qbId };
		location.href = 'admin_qnaAnswerForm.do?id='+qbId;
	}
</script>
</head>
<body>
	<div align="center">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> Q & A </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
				
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div>
					<table class="table">
						<tr><td colspan="6" align="center"><b> 문의하신 글 </b></td></tr>
						<tr>
							<th width="100"> TITLE </th>
							<td width="900"> ${content.qbTitle } </td>
						</tr>
						<tr>
							<th width="100"> NAME </th>
							<td> ${content.mName } </td>
						</tr>
						<tr>
							<th> DATE </th>
							<td> ${content.qbDate } </td>
						</tr>
						<tr>
							<td colspan="2" align="center"> ${content.qbContents } </td>
						</tr>
					</table>
					<c:if test="${!empty answer.qbContents}">
						<div style="border:2px solid gold;">
							<table class="table">
									<tr><td colspan="6" align="center"><b> 답변 </b></td></tr>
									<tr>
										<th width="50"> TITLE </th>
										<td width=""> ${answer.qbTitle } </td>
										<th width="50"> NAME </th>
										<td> 관리자 </td>
										<th width="50"> DATE </th>
										<td> ${answer.qbDate } </td>
									</tr>
									<tr>
										<td colspan="6" align="center"> ${answer.qbContents } </td>
									</tr>
							</table>
						</div>
					</c:if><br />
					<table>
						<tr>
							<td width="100">
								<c:if test="${name == content.mName }">
									<button type="button" onclick="deleteQna()" class="btn btn-outline-primary"> DELETE </button>
								</c:if>
								<c:if test="${grant == 'admin' && empty answer.qbContents}">
									<button type="button" onclick="answerQna()" class="btn btn-outline-primary"> ANSWER </button>
								</c:if>
								</td>
							<td width="800">
							<td width="200" align="right">
								<button type="button" onclick="location.href='admin_qnaListForm.do?title=${content.qbTitle}'" class="btn btn-outline-primary"> LIST </button>
								</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>