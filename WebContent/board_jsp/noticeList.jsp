<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	<link rel="shortcut icon" type="image/png" href="/media/images/favicon.png">
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="http://www.datatables.net/rss.xml">
	<link rel="stylesheet" type="text/css" href="/media/css/site-examples.css?_=8ffc0b31bc8d9ff82fbb94689dd1d7ff">
	
	</style>
	<script type="text/javascript" src="/media/js/site.js?_=df7cd4213eec7fc146048acf402cae00"></script>
	<script type="text/javascript" src="/media/js/dynamic.php?comments-page=examples%2Fstyling%2Fbootstrap4.html" async></script>
	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" language="javascript" src="../resources/demo.js"></script>
	<script type="text/javascript" class="init">
	
	$(document).ready(function() {
		$('#example').DataTable(){
			"lengthChange" : false,
			"filter" : true,
			"ordering" : true,
			"order" : [[0, "desc"]];
		};
	} );

	function getKey(nbId){
		location.href = 'basic_noticeReadForm.do?id='+nbId;
	}

</script>
</head>
<body>
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>No</th>
                <th>Title</th>
                <th>Contents</th>
                <th>Date</th>
                <th>Hit</th>
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
					<td align="center">${dto.nbTitle } </td>
					<td align="center">${dto.nbContents } </td>
					<td align="center">${dto.nbDate } </td>
					<td align="center">${dto.nbHit } </td>
				</tr>
			</c:forEach>
            
        <tfoot></tfoot>
    </table>
</body>
</html>