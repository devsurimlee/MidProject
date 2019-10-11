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
			<h3><a href="basic_bestItemList.do" style="color:black">BEST ITEM</a></h3>
			<h3><a href="basic_topList.do" style="color:black">TOP</a></h3>
			<h3><a href="basic_bottomList.do" style="color:black">BOTTOM</a></h3>
			<h3><a href="basic_dressList.do" style="color:black">DRESS</a></h3>
			<h3><a href="basic_outerList.do" style="color:black">OUTER</a></h3>
			<br />
			
			<br />
			<h3><a href="basic_noticeListForm.do"> 공지 게시판 </a></h3>
			<h3><a href="basic_qnaListForm.do?title=상품문의"> 문의 게시판 </a></h3>
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
			 <H3><a href="basic_cartView.do"> CART </a></H3>
			 <H3><a href="basic_myOrderList.do"> ORDER </a></H3>
			 <H3><a href="basic_wishListView.do"> WISHLIST </a></H3>
			 <c:if test="${grant == 'admin' }"> <!-- 관리자용 -->
			 	<H3><a href="admin_Index.do"> ADMIN </a></H3>
			 </c:if>
			 
			<address>
				 <strong>(주)예담쇼핑몰</strong><br>대구광역시 중구 국채보상로 537<br>(수동, 5층)<br> <abbr title="Phone">P:</abbr> 053-356-****
			</address>
		</div>
		
	</div>
	</div>



</body>
</html>