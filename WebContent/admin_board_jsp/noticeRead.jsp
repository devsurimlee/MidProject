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
%>
<script>
if('${deleteMessage}' != ''){
	alert('${deleteMessage}');
}
	function deleteNotice(){
		var nbId = ${content.nbId };
		var result = confirm("확인을 누르시면 공지글이 삭제됩니다.");
        if(result == true) {
        	location.href = 'admin_noticeDelete.do?id='+nbId;
        } else {
        	false;
        }
	}
	
	function updateNotice(){
		var nbId = ${content.nbId};
		location.href = 'admin_noticeUpdateForm.do?id='+nbId;
	}
</script>
</head>
<body>
	<div align="center">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> NOTICE </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
				
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div>
					<table class="table">
						<tr>
							<th width="100"> TITLE </th>
							<td width="900"> ${content.nbTitle } </td>
						</tr>
						<tr>
							<th width="100"> NAME </th>
							<td> 관리자 </td>
						</tr>
						<tr>
							<th> DATE </th>
							<td> ${content.nbDate } </td>
						</tr>
						<tr>
							<td colspan="2" align="center"> ${content.nbContents } </td>
						</tr>
					</table>
					<table>
						<tr>
							<td width="100">
								<c:if test="${grant == 'admin' }">
									<button type="button" onclick="updateNotice()" class="btn btn-outline-primary"> UPDATE </button>
								</c:if></td>
							<td width="800">
								<c:if test="${grant == 'admin' }">
									<button type="button" onclick="deleteNotice()" class="btn btn-outline-primary"> DELETE </button>
								</c:if></td>
							<td width="200" align="right">
								<button type="button" onclick="location.href='admin_noticeListForm.do'" class="btn btn-outline-primary"> LIST </button>
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