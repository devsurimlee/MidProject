<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		
		if(dd<10) {
		    dd='0'+dd
		} 
		
		if(mm<10) {
		    mm='0'+mm
		} 
		
		today = yyyy+'-'+mm+'-'+dd;
		
		$("#td").text(today);
	})
</script>
<%
	String name = (String) session.getAttribute("name");
	String id = (String) session.getAttribute("id");
%>
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
					<form role="form" id="insertfrm" name="insertfrm" action="admin_qnaWrite.do">
						<input type="hidden" id="mId" name="mId" value=${id }>
						<table class="table">
							<tr>
								<th width="100"> TITLE </th>
								<td width="900" colspan="2"><select id="qbTitle" name="qbTitle"	class="btn btn-secondary btn-sm dropdown-toggle">
												<option	value="상품문의" selected>상품문의</option>
												<option value="배송문의">배송문의</option>
												<option value="기타문의">기타문의</option>
												<option value="입금문의">입금문의</option></select></td>
							</tr>
							<tr>
								<th> NAME </th>
								<td colspan="2"> ${name } </td>
							</tr>
							<tr>
								<th> DATE </th>
								<td id="td" colspan="2"> </td>
							</tr>
							<tr>
								<th> PASSWORD </th>
								<td id="td" width="200"><input class="form-control" type="password" id="qbPw" name="qbPw"> </td>
								<td></td>
							</tr>
							<tr>
								<td colspan="3" align="center"> <textarea class="form-control" id="qbContents" name="qbContents" rows="18" >${content.nbContents }</textarea></td>
							</tr>
						</table>
						<table>
							<tr>
								<td width="100"><button type="submit" class="btn btn-outline-primary"> WRITE </button></td>
								<td width="500"></td>
								<td width="200" align="right">
									<button type="button" onclick="location.href='admin_noticeListForm.do'" class="btn btn-outline-primary"> LIST </button>
									</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>