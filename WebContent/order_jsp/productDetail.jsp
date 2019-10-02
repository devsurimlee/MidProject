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
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-5">
					<img src="image/thumbnail/${param.key }.jpg" width="400"/>
				</div>
				<div class="col-md-7">
					<div style="height: 200px;">
						<table>
						<thead><h1>${dto.p_name }</h1></thead>
						<tbody>
							<tr>
								<th>가격: </th><td>${dto.p_price }</td>
							</tr>
							<tr>
								<th>등급할인: </th>
							</tr>
							<tr>
								<th>색상:</th><td>${dto.p_color }</td>
							</tr>
							<tr>
								<th>사이즈</th><td>${dto.p_size }</td>
							</tr>
						</tbody>
						</table>
					</div>
					<div id = "btn" name = "btn">
						<table>
							<thead></thead>
							<tbody>
								<tr>
									<td width="200"><button type="button" class="btn btn-md btn-primary btn-block">CART</button></td>
									<td width="200"><button type="button" class="btn btn-md btn-primary btn-block">WISHLIST</button></td>
								<tr>
									<td colspan ="2"><button type="button" class="btn btn-md btn-primary btn-block">BUY NOW</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div><!-- col md 7 끝 -->
			</div>
			<div class="row">
				<div class="col-md-12">
					${dto.p_detail }<br/>
					<img src="image/clothesDetail/${param.key }.jpg"/>
				</div><!--  -->
			</div>
		</div>
	</div>
</div>


</body>
</html>