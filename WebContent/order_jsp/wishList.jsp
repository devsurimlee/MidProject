<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link
	href="${pageContext.request.contextPath }/mainCSS/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/mainCSS/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/product.css">

<script>
		
	function deleteWishList(e, pId) {
		var figure = $(e.target).parent().parent()

 		$.ajax( {
			url : 'wishListDelete.do',
			data : {
				deleteCheck : pId
			},
			dataType: 'json',
			success : function() {
				 alert("상품이 삭제되었습니다");
				 figure.remove();
				 
					if($('figure').length == 0) {
						$('ul').remove();
						$('#forAjax').append("<h3>위시리스트가 비어있어요~~ 상품을 찾으러 가볼까요?</h3>");
					}
				 
			}
		}); 
		
	};
	
	
	function deleteAllWishList() {
		
		$.ajax( {
			url : 'wishListDelete.do',
			data : {
				deleteAll : 'deleteAll'
			},
			dataType: 'json',
			success : function() {
				 alert("상품이 모두 삭제되었습니다");
				 $('figure').remove();
				 $('button').remove();
				 $('#forAjax').append("<h3>위시리스트가 비어있어요~~ 상품을 찾으러 가볼까요?</h3>");
			}
		});
		
	}
	
</script>

<style>
#center {
	position: absolute;
	left: 42%;
}

#middle {
	position: absolute;
	left: 20%;
}

#forAjax {
	position: absolute;
	left: 20%;
}

ul {
   list-style:none;
   padding-left:300px;
   padding-right:300px;
}

</style>

</head>
<body>

	<div id="center">
		<h1>WISH LIST</h1>
	</div>
	<br>
	<br>
	<br>
	<br>

	<!-- 사진 슬라이드 밑에 상품 진열 -->
	<c:forEach items="${optionList }" var="dto">
		<figure class="snip1384">
			<img src="image/thumbnail/product${dto.p_id }.jpg" alt="sample83" width="400" height="400" />
			<figcaption>
				<h3>${dto.p_name }</h3>
				<p>${dto.p_color }</p>
				<p>${dto.p_size }</p>
				<p>${dto.p_detail }</p>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br> <i class="ion-ios-arrow-right"></i>
<%-- 				<input type="button" id="orderBtn" value="구매" onclick="location='basic_orderSingleForm.do?key=${dto.p_id }'">
 --%>				<input type="button" id="deleteBtn" value="삭제" onclick="deleteWishList(event, '${dto.p_id }')">
				<input type="button" id="showBtn" value="상품보러가기" onclick="location='basic_productDetail.do?key=${dto.p_id }'">
			</figcaption>
		</figure>
				
	</c:forEach>
	<c:if test="${!empty optionList }" >
	<ul>
		<li><button id="deleteAllBtn" name="deleteAllBtn" class="btn btn-md btn-primary btn-block" onclick ="deleteAllWishList()" style="width:300px">위시리스트 비우기</button>
		</li>
	</ul>
	</c:if>
	
	<div id="forAjax"></div>
	<c:if test="${empty optionList }">
		<div id="middle"><h3>위시리스트가 비어있어요~~ 상품을 찾으러 가볼까요?</h3></div>
	</c:if>
	
</body>
</html>