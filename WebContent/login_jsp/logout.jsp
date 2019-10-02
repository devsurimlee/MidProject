<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload=function(){ // 페이지 띄워지자마자 실행
		var result = confirm("로그아웃 하시겠습니까?");

        if(result == true) {
        	location.href="basic_afterlogout.do";
        } else {
        	location.href="basic_index.do";
        }
	}
</script>
</head>
<body>

</body>
</html>