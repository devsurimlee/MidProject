<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		// 오늘 날짜
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		if(dd<10) { dd='0'+dd } 
		if(mm<10) { mm='0'+mm } 
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
					<div align="center" style="border:2px solid gold;">
						<table class="table">
							<tr><td colspan="6" align="center"><b> 고객이 남긴 문의글 </b></td></tr>
							<tr>
								<th width="50"> TITLE </th>
								<td width=""> ${content.qbTitle } </td>
								<th width="50"> NAME </th>
								<td> ${content.mName } </td>
								<th width="50"> DATE </th>
								<td> ${content.qbDate } </td>
							</tr>
							<tr>
								<td colspan="6" align="center"> ${content.qbContents } </td>
							</tr>
						</table>
					</div><br />
					<form role="form" id="insertfrm" name="insertfrm" action="admin_qnaAnswer.do">
						<input type="hidden" id="qbPw" name="qbPw" value=${content.qbPw }>
						<input type="hidden" id="qbOrigin" name="qbOrigin" value=${content.qbId }>
						<table class="table">
							<tr><td colspan="6" align="center"><b> 답변 남기기 </b></td></tr>
							<tr>
								<th width="100"> TITLE </th>
								<td width="900" colspan="2"> 답변입니다ʕ·͡ᴥ·ʔﾉ </td>
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
								<td colspan="3" align="center"> <textarea class="form-control" id="qbContents" name="qbContents" rows="10" ></textarea></td>
							</tr>
						</table>
						<table>
							<tr>
								<td width="100"><button type="submit" class="btn btn-outline-primary"> WRITE </button></td>
								<td width="500"></td>
								<td width="200" align="right">
									<button type="button" onclick="location.href='admin_qnaListForm.do?title=상품문의'" class="btn btn-outline-primary"> LIST </button>
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