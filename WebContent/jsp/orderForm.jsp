<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap 4, from LayoutIt!</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="../mainCSS/bootstrap.min.css" rel="stylesheet">
    <link href="../mainCSS/style.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  </head>
  
  <body>

    <div class="container-fluid" >
	<div class="row" >

		
		<!-- 중앙 그리드 -->
		<div class="col-md-12" id="div-center" name="div-center">
		
		 <!--SHIPPING METHOD-->
                    <div class="panel panel-default">
                    	<br/>
                        <div class="panel-heading text-center"><h4>ORDER LIST</h4></div>
                        <div class="panel-body">
                           <table class="table borderless">
    						<thead>
                                <tr>
        							<td><strong>ORDER ITEMES</strong></td>
        							<td></td>
        							<td></td>
        							<td></td>
        							<td></td>
                                </tr>
    						</thead>
    						<tbody>
    							<!-- foreach ($order->lineItems as $line) or some such thing here -->
    							<tr>
    								<td class="col-md-3">
    								    <div class="media">
    								         <a class="thumbnail pull-left" href="#"> <img class="media-object" src="http://lorempixel.com/460/250/" style="width: 72px; height: 72px;"> </a>
    								         <div class="media-body">
    								             <h5 class="media-heading"> Product Name</h5>
    								             <h5 class="media-heading"> Product Code</h5>
    								         </div>
    								    </div>
    								</td>
    								<td class="text-center">1</td>
    								<td class="text-right">25,000원</td>
    								<td class="text-right"><button type="button" class="btn btn-danger">Remove</button></td>
    							</tr>
    						</tbody>
    					</table> 
                        </div>
                    </div>
                    <!--SHIPPING METHOD END-->
                    
                    <!--REVIEW ORDER-->
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">
                            <h4>TOTAL PRICE</h4>
                        </div>
                        <div class="panel-body">
                        
                                <div class="col-md-12">
                                    <small>상품합계</small>
                                    <div class="pull-right"><span>25,000</span><span>원</span></div>
                                </div>

                                <div class="col-md-12">
                                    <small>배송료</small>
                                    <div class="pull-right"><span>+2,500</span><span>원</span></div>
                                    <hr>
                                </div>
                                <div class="col-md-12">
                                    <strong>Order Total</strong>
                                    <div class="pull-right"><span>27,500</span><span>원</span></div>
                                    <hr>
                                </div>
                                
                                
                                
          <!-- 주문서폼 시작 -->                      
		<div class="form-card">
            <div class='form-group'>
              <div class='col-xs-12 form-group'>
                <label class="control-label locked" for="name-input-field">Name</label>
                <input id="name" name="name" class="form-control" type="text" required="">
              </div>
            </div>
            <div class='form-group'>
              <div class='col-xs-12 form-group'>
                <label class="control-label locked" for="phone-input-field">Phone Number</label>
                <input id="phone_number" name="phone_number" type="text" placeholder="08xxxxxxxxxx" class="form-control locked" required="">
              </div>
            </div>
            <div class="form-group locked">
                <div class='col-xs-12 form-group'>
                    <label class="control-label locked" for="email-input-field">Email</label>
                    <input id="email" name="email" type="text" placeholder="email@email.com" class="form-control locked" required="">
                </div>
            </div>
            <div class="form-group locked">
                <div class='col-xs-12 form-group'>
                    <label class="control-label locked" for="desc-input-field">Description</label>
                    <textarea name="desc" id="desc" cols="0" rows="3" class="form-control locked"></textarea>
                </div>
            </div>
            <div class="form-group locked">
                <div class='col-xs-12 form-group'>
                    <label class="control-label locked" for="desc-input-field">Address</label>
                    <textarea name="address" id="address" cols="0" rows="3" class="form-control locked"></textarea>
                </div>
            </div>
        </div>
         <!-- 주문서폼 끝 -->                      
                                
                                
                                
                                
                                <!-- 체크아웃 버튼 -->
                                <button type="button" class="btn btn-primary btn-lg btn-block">Checkout</button>
                                
                        </div>
                    </div>
                    <!--REVIEW ORDER END-->
		
		</div>
		<!-- 중앙 그리드 끝 -->
	
	</div>
</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>