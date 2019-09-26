<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap 4, from LayoutIt!</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="mainCSS/bootstrap.min.css" rel="stylesheet">
    <link href="mainCSS/style.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- 중앙 div에 페이지 불러옴 -->
<script>
$(document).ready(function(){

    $("#div1").load("jsp/example.jsp");

});
</script>
  </head>
  
  
  <body>

    <div class="container-fluid" >
	<div class="row" >
		<!-- 왼쪽 그리드 -->
		<div class="col-md-2" id="div-left" name="div-left" style="background-color:#E0ECF8">
			<br /><br />
			<br />
			<br />
			<h3><a href="#" style="color:black";>BEST ITEM</a></h3>
			<h3><a href="#" style="color:black";>TOP</a></h3>
			<h3><a href="#" style="color:black";>BOTTOM</a></h3>
			<h3><a href="#" style="color:black";>DRESS</a></h3>
			<h3><a href="#" style="color:black";>OUTER</a></h3>

			
		</div>
		
		<!-- 중앙 그리드 -->
		<div class="col-md-8" id="div-center" name="div-center">
			<div class="carousel slide" id="carousel-299453">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-299453" class="active">
					</li>
					<li data-slide-to="1" data-target="#carousel-299453">
					</li>
					<li data-slide-to="2" data-target="#carousel-299453">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" alt="Carousel Bootstrap First" src="image/main_sample1.jpg">
						<div class="carousel-caption">
							<h4>
								First Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second" src="image/main_sample2.jpg">
						<div class="carousel-caption">
							<h4>
								Second Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Third" src="image/main_sample3.jpg">
						<div class="carousel-caption">
							<h4>
								Third Thumbnail label
							</h4>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
						</div>
					</div>
				</div> <a class="carousel-control-prev" href="#carousel-299453" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-299453" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
			</div> <!-- 슬라이드 끝 -->
			<br /><br />
				<div id="div1" style="border: none;  "></div>
			<br /><br />
		</div>
		<!-- 오른쪽 그리드 -->
		<div class="col-md-2" id="div-right" name="div-right"style="background-color:#E0ECF8">
			 <br /><br /><br /><br />
			 <h3>LOGIN</h3>
			 <H3>MY PAGE</H3>
			 <H3>CART</H3>
			 <H3>ORDER</H3>
			 <H3>WISHLIST</H3>
			 
			 
			<address>
				 <strong>Twitter, Inc.</strong><br> 795 Folsom Ave, Suite 600<br> San Francisco, CA 94107<br> <abbr title="Phone">P:</abbr> (123) 456-7890
			</address>
		</div>
	</div>
</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>