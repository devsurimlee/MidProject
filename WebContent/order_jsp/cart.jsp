<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>

<div style="text-align:center"><h1>CART</h1></div>

${id }님 장바구니~~
	
	<c:if test="${cartList != null}">
		<form>
		<c:forEach items="${OptionList }" var="dto">
			<figure class="snip1384">
<%-- 			 <img src="image/thumbnail/product${dto.p_id }.jpg" alt="sample83" width="400" height="400"/> --%>
			<figcaption>
				<h3>${dto.cartId }</h3>
				<p>${dto.mId }</p>
				<p>${dto.amountId }</p>
				<p>${dto.orderProductCount }</p>
				<i class="ion-ios-arrow-right"></i>
			</figcaption>
<%-- 			 <a href="basic_productDetail.do?key=${dto.p_id }"></a> --%>
		</figure>
		</c:forEach>
		</form>
	</c:if>




</body>
</html>