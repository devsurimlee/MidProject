<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>

<script>
if('${updateMessage}' != ''){
	alert('${updateMessage}');
}
	$(document).ready(function() {
		$('#example').DataTable({
			 "language": {
			        "emptyTable": "등록된 공지사항이 없습니다.",
			        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
			        "info": "현재 _START_ - _END_ / _TOTAL_건",
			        "infoEmpty": "데이터 없음",
			        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
			        "search":"",
			        "zeroRecords": "검색 결과와 일치하는 공지 사항이 없습니다.",
			        "loadingRecords": "***LOADING***",
			        "processing":     "잠시만 기다려 주세요.",
			        "paginate": {
			            "next": ">>",
			            "previous": "<<"
			        }},
			"lengthChange" : false,
			"filter" : true,
			"ordering" : true,
			"info" : false,
			"order" : [[0, "desc"]]
		});
	} );

	function getKey(nbId){
		location.href = 'admin_noticeReadForm.do?id='+nbId;
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
			<div class="col-md-1"></div>

			<div class="col-md-10">
				<table id="example" class="table table-bordered table-hover" style="width:100%">
			        <thead>
			            <tr>
			                <th width="60">NO</th>
			                <th width="500">TITLE</th>
			                <th width="100">DATE</th>
			                <th width="60">VIEW</th>
			            </tr>
			        </thead>
			        
			        <tbody>
						<!-- db의 글목록을 가져와서 뿌려주는 곳~ -->
						<c:if test="${list.isEmpty()}">
							<tr>
								<td colspan="5"> 등록된 공지사항이 없습니다. </td>
							</tr>	
						</c:if>
						<c:forEach items="${list }" var="dto">
							<tr onclick="getKey(${dto.nbId})">
								<td align="center">${dto.nbId } </td>
								<td>${dto.nbTitle } </td>
								<td align="center">${dto.nbDate } </td>
								<td align="center">${dto.nbHit } </td>
							</tr>
						</c:forEach>
			            
			        <tfoot></tfoot>
			    </table>
			    <c:if test="${grant == 'admin' }">
			    	<button type="button" onclick="location.href='admin_noticeWriteForm.do'" class="btn btn-outline-primary"> WRITE </button>
			    </c:if>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</body>
</html>