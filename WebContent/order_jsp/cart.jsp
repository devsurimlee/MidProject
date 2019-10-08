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
</head>
<body>
	<!--SHIPPING METHOD-->
	<div class="panel panel-default">
		<br />
		<div class="panel-heading text-center">
			<h1>CART</h1>
		</div>
		<div class="panel-body">
			<table class="table borderless">
				<thead>
					<tr>
						<td><strong>ITEM LIST</strong></td>
					</tr>
				</thead>
				<c:forEach items="${OptionList }" var="dto">
				<tbody>
					<tr>
						<td>
							<div class="media">
								<a class="thumbnail pull-left" href="#"> <img
									class="media-object"
									src="image/clothesDetail/amount${dto.amountId }.jpg"
									style="width: 72px; height: 72px;">
								</a>
								<div class="media-body">
									<h5 class="media-heading">${dto.p_name }</h5>
									<h5 class="media-heading">${dto.p_id }</h5>
								</div>
							</div>
						</td>
						<td><h5>
								색상: <span>${dto.amount_color }</span>
							</h5></td>
						<td><h5>
								사이즈: <span>${dto.amount_size }</span>
							</h5></td>
						<td><h5>
								수량: <span>${dto.a_count }</span>
							</h5></td>
						<td><h5>
								가격: <span>${dto.p_price }</span><span>원</span>
							</h5></td>
					</tr>
				</tbody>
				</c:forEach>
			</table>


		</div>
	</div>
	<!--SHIPPING METHOD END-->



</body>
</html>