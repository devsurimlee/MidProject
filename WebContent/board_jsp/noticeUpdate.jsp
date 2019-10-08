<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center">
						<h4><b> NOTICE UPDATE </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
				
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div>
					<form role="form" id="updatefrm" name="updatefrm" action="basic_noticeUpdate.do">
						<input type="hidden" id="id" name="id" value="${content.nbId }">
						<table class="table">
							<tr>
								<th width="100"> TITLE </th>
								<td width="900"><input type="text" value="${content.nbTitle }" id="title" name="title" size="100"> </td>
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
								<td colspan="2" align="center"> <textarea class="form-control" id="contents" name="contents" rows="18" >${content.nbContents }</textarea></td>
							</tr>
						</table>
						<table>
							<tr>
								<td width="100"><button type="submit" onclick="location.href='basic_noticeUpdate.do'" class="btn btn-outline-primary"> UPDATE </button></td>
								<td width="500"></td>
								<td width="200" align="right">
									<button type="button" onclick="location.href='basic_noticeListForm.do'" class="btn btn-outline-primary"> LIST </button>
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