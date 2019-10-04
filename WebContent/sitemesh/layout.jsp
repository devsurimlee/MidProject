<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>예담 쇼핑몰입니다.</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="mainCSS/bootstrap.min.css" rel="stylesheet">
    <link href="mainCSS/style.css" rel="stylesheet">

	<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/scripts.js"></script>
	<decorator:head/>
	
<%
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String grant = request.getParameter("grant");
%>
	
</head>

<body style="height:100vh;">
	
	
	<div class="container-fluid" >
	<div class="row" >
	
		<!-- 왼쪽 그리드 -->
		<div class="col-md-2" id="div-left" name="div-left" style="background-color:#E0ECF8">
			<br /><br />
			<br />
			<br />
			<h3><a href="#" style="color:black">BEST ITEM</a></h3>
			<h3><a href="#" style="color:black">TOP</a></h3>
			<h3><a href="#" style="color:black">BOTTOM</a></h3>
			<h3><a href="#" style="color:black">DRESS</a></h3>
			<h3><a href="#" style="color:black">OUTER</a></h3>
			<br />
			
			<!-- 아이디 파라미터 넘겨줌 -->
			<form id="frm" name="frm" action="basic_orderForm.do">
			<input type="text" id ="id" name="id" value="${id }">
			<h3><a onclick="document.frm.submit()">Order</a></h3>
			</form>
			
			<br />
			<h3><a href="basic_index.do">홈으로</a></h3>
			
			
		</div>
		
		<!-- 중앙 그리드 -->
		<div class="col-md-8 justify-content-md-center align-items-center" id="div-center" name="div-center" style="min-height: 965px">
			<br /><br />
			<decorator:body/>
		</div>
		
		<!-- 오른쪽 그리드 -->
		<div class="col-md-2" id="div-right" name="div-right"style="background-color:#E0ECF8">
			 <br /><br /><br /><br />
			 <c:if test="${empty id }">
				<h3><a href="basic_loginForm.do"> LOGIN </a></h3>
			 </c:if>
			 <c:if test="${not empty id }">
				 <h3><a href="basic_logoutForm.do"> LOGOUT </a></h3>
			 </c:if>
			 <H3><a href="basic_mypageForm.do"> MY PAGE </a></H3>
			 <H3><a href="#"> CART </a></H3>
			 <H3><a href="#"> ORDER </a></H3>
			 <H3><a href="#"> WISHLIST </a></H3>
			 <c:if test="${grant == 'admin' }"> <!-- 관리자용 -->
			 	<H3><a href="admin_Index.do"> ADMIN </a></H3>
			 </c:if>
			 
			<address>
				 <strong>Twitter, Inc.</strong><br> 795 Folsom Ave, Suite 600<br> San Francisco, CA 94107<br> <abbr title="Phone">P:</abbr> (123) 456-7890
			</address>
		</div>
		
	</div>
	</div>



</body>
</html>