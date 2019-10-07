<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="copyright"
	content="Copyright(c) Simplex Internet Inc.All Rights Reserved." />
<title>Cafe24-Echosting Admin</title>
<!-- Google Tag Manager -->

<!-- End Google Tag Manager -->
<link rel="stylesheet" type="text/css"
	href="//img.echosting.cafe24.com/css/ec/mode/influencer/common.css"
	media="all" charset="utf-8" />



</head>
<body id="popup" size="1200, 800" class="ECInfluencer">

	<div id="wrap">
		<div class="headingArea">
			<div class="mTitle">
				<h1>상품 수정</h1>
				<span class="cManual eSmartMode" code="PT.PE"></span>
			</div>
		</div>


		<div class="mToggleBar eToggle selected ec-product-register-toggle">
			<h2>기본 정보</h2>
			<div class="ctrl">
				<span><button type="button">
						<em>열기</em>
					</button></span>
			</div>
		</div>

		<div class="toggleArea">
			<div class="mBoard typeWrite">
				<table border="1" summary="">
					<caption>상품 기본 정보</caption>
					<colgroup>
						<col style="width: 190px;" />
						<col style="width: 308px;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">상품명 <strong class="icoRequired">필수</strong></th>
							<td colspan="2">
								<div class="overlapTip">
									<input type="text" name="product_name" required="required"
										id="product_name" placeholder="예시) 플라워 미니 원피스"
										class="fText eHasModifyProductAuth eMarketChecker"
										style="width: 500px;" fw-label="상품명" fw-filter="isFill"
										value="${product.p_name }" maxcount="250" /> <input
										type="hidden" id="mp_prd_product_code" value="P000000M">
									<div class="tip" style="display: none;">
										<span class="icoReference">참고</span> 입력하신 상품명과 동일한 상품명이 있습니다.
										<button type="button" class="close eClose"
											id="ec-product-register-basic-duplicate">닫기</button>
										<span class="edge"></span>
									</div>
								</div> <span class="txtByte" title="현재글자수/최대글자수">[ <strong>0</strong>
									/ 250 ]
							</span>
							</td>
						</tr>
						<tr>
							<th scope="row">판매가 <strong class="icoRequired">필수</strong>
							</th>
							<td colspan="2"><input type="hidden" name="product_tax_type"
								value="A"> <input type="text"
								class="fText right ePrdPrice eHasModifyProductAuth eMarketChecker ec-product-register-form-basic-price"
								name="product_price" style="width: 150px;"
								value="${product.p_price }" fw-label="판매가" fw-filter="isFill"
								required="required" /> 원</td>
						</tr>
						<tr>
							<th scope="row">상품 상세설명</th>
							<td colspan="2"><textarea rows="3" cols="70">
								${product.p_detail }
								</textarea></td>
						</tr>

						<tr>
							<th scope="row">이미지</th>
							<td><span class="txtStrong">대표이미지</span> <!--참고: 이미지 등록 전-->
								<div class="mThumb gLarge gDouble"
									id="ec-product-register-image-empty" style="display: none;">
									<div class="btnAdd"
										id="ec-product-register-detail-image-upload">등록</div>
								</div> <!-- 참고: 이미지 등록 후 -->
								<div class="mThumb gLarge gDouble"
									id="ec-product-register-image-exist">
									<div class="thumb">
										<img src="./image/thumbnail/product2.jpg" alt=""
											id="ec-product-register-image" />
									</div>
									<div class="button">
										<button type="button" class="btnEdit"
											id="ec-product-register-image-modify">
											<span class="icoEdit"></span>변경
										</button>
										<button type="button" class="btnDelete"
											id="ec-product-register-image-delete">
											<span class="icoDelete"></span>삭제
										</button>
									</div>
								</div> <!-- //참고 --> <input type="hidden" name="img_type" value="A" />
								<input type="hidden" name="detailImage" class="eMarketChecker"
								id="ec-product-register-detail-image" /> <!--<input type="hidden" name="listImage" id="ec-product-register-list-image" />
                    <input type="hidden" name="mainImage" id="ec-product-register-main-image" />
                    <input type="hidden" name="tinyImage" id="ec-product-register-tiny-image" />-->
								<input type="hidden" name="old_detailImage"
								class="eMarketChecker" id="ec-product-register-old-detail-image"
								value="201910/840fd4e8c3d95f86d6e896762312c8f8.gif" /> <input
								type="hidden" name="old_listImage" class="eMarketChecker"
								id="ec-product-register-old-list-image"
								value="201910/967ad024eb30c5d223d86901a069c58a.gif" /> <input
								type="hidden" name="old_mainImage" class="eMarketChecker"
								id="ec-product-register-old-main-image"
								value="201910/3d07213e58e29090a86599da1e478516.gif" /> <input
								type="hidden" name="old_tinyImage" class="eMarketChecker"
								id="ec-product-register-old-tiny-image"
								value="201910/f16b0da4540f19bab1785f0a1981a446.gif" />

								<ul class="txtInfo">
									<li>권장사이즈 : 500px * 500px</li>
								</ul></td>
							<td><span class="txtStrong">추가이미지</span><span
								class="txtByte" title="현재글자수/최대글자수">[ <strong
									id="ec_product-register-addimage-count">3</strong> / 20 ]
							</span>
								<div class="mThumbs eImgSort"
									id="ec-product-register-addimage-list">
									<input type="hidden" value="" name="add_image[]">
									<ul id="extraImage">
										<li>
											<div
												class="mThumb gSmall ec-product-regiter-addimage-sortable">
												<div class="thumb">
													<img
														src="//neomart.cafe24.com/web/product/extra/big/201910/1a5d3c01778e04a04974c1d1d94db5a1.jpg"
														alt="" class="ec-product-register-add-image-tag"> <input
														type="hidden"
														value="201910/1a5d3c01778e04a04974c1d1d94db5a1.jpg"
														name="add_image[]">
												</div>
												<div class="button">
													<button type="button"
														class="btnEdit ec-product-register-addimage-modify">
														<span class="icoEdit"></span>변경
													</button>
													<button type="button"
														class="btnDelete ec-product-register-addimage-delete">
														<span class="icoDelete"></span>삭제
													</button>
												</div>
											</div>
										</li>
										<li>
											<div
												class="mThumb gSmall ec-product-regiter-addimage-sortable">
												<div class="thumb">
													<img
														src="//neomart.cafe24.com/web/product/extra/big/201910/9c99e1ab89b4e06c7b35d3f92af54ea5.jpg"
														alt="" class="ec-product-register-add-image-tag"> <input
														type="hidden"
														value="201910/9c99e1ab89b4e06c7b35d3f92af54ea5.jpg"
														name="add_image[]">
												</div>
												<div class="button">
													<button type="button"
														class="btnEdit ec-product-register-addimage-modify">
														<span class="icoEdit"></span>변경
													</button>
													<button type="button"
														class="btnDelete ec-product-register-addimage-delete">
														<span class="icoDelete"></span>삭제
													</button>
												</div>
											</div>
										</li>
										<li>
											<div
												class="mThumb gSmall ec-product-regiter-addimage-sortable">
												<div class="thumb">
													<img
														src="//neomart.cafe24.com/web/product/extra/big/201910/04941cb12f387c78212989dfa0b635a7.jpg"
														alt="" class="ec-product-register-add-image-tag"> <input
														type="hidden"
														value="201910/04941cb12f387c78212989dfa0b635a7.jpg"
														name="add_image[]">
												</div>
												<div class="button">
													<button type="button"
														class="btnEdit ec-product-register-addimage-modify">
														<span class="icoEdit"></span>변경
													</button>
													<button type="button"
														class="btnDelete ec-product-register-addimage-delete">
														<span class="icoDelete"></span>삭제
													</button>
												</div>
											</div>
										</li>

										<li id="ec-product-register-addimage-upload">
											<div class="mThumb gSmall">
												<div class="btnAdd">등록</div>
											</div>
										</li>
									</ul>
								</div>

								<ul class="txtInfo">
									<li>권장이미지 : <span class="size" id="zImagSizeInfo">500px
											* 500px</span> / 1M 이하 / gif, png, jpg(jpeg) / 20개까지 추가 가능
									</li>
								</ul>
								<ul class="mThumbList">

								</ul></td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
		<!-- //기본정보 -->


		<div class="mToggleBar eToggle selected ec-product-register-toggle">
			<h2>쇼핑몰 진열설정</h2>
			<div class="ctrl">
				<span><button type="button">
						<em>열기</em>
					</button></span>
			</div>
		</div>
		<div class="toggleArea">
			<div class="mBoard typeWrite">
				<table border="1" summary="">
					<caption>쇼핑몰 진열설정</caption>
					<colgroup>
						<col style="width: 190px;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">진열상태</th>
							<td><label class="fLabel">진열함 <input type="radio"
									class="fCheck eMarketChecker" name="is_display[1]" value="T"
									checked=checked /> <span class="checkMark"></span>
							</label> <label class="fLabel">진열안함 <input type="radio"
									class="fCheck eMarketChecker" name="is_display[1]" value="F" />
									<span class="checkMark"></span>
							</label></td>
						</tr>
						<tr>
							<th scope="row">판매상태
								<div class="cTip eSmartMode" code="PT.PE.100"></div>
							</th>
							<td><label class="fLabel">판매함 <input type="radio"
									class="fCheck eMarketChecker" name="selling_status[1]"
									value="T" checked=checked /> <span class="checkMark"></span>
							</label> <label class="fLabel">판매안함 <input type="radio"
									class="fCheck eMarketChecker" name="selling_status[1]"
									value="F" /> <span class="checkMark"></span>
							</label></td>
						</tr>


					</tbody>
				</table>
			</div>
		</div>


		<div class="mToggleBar eToggle ec-product-register-toggle selected ">
			<h2>옵션설정</h2>
			<div class="ctrl">
				<label class="gLabel" style="display: none"><input
					type="checkbox" name="aToggleValue[item]" value="T"
					data-uncheck="F" /> 항상열기</label> <span><button type="button">
						<em>열기</em>
					</button></span>
			</div>
		</div>
		<div class="toggleArea">
			<div class="mBoard typeWrite">
				<table border="1" summary="">
					<caption>옵션설정</caption>
					<colgroup>
						<col style="width: 190px;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">상품옵션</th>
							<td><label class="fLabel">사용함 <input type="radio"
									class="fCheck eMarketChecker" value="T" id="eOptionUseT"
									name="has_option" /> <span class="checkMark"></span>
							</label> <label class="fLabel">사용안함 <input type="radio"
									class="fCheck" value="F" name="has_option" checked="checked" />
									<span class="checkMark"></span>
							</label> <input type="hidden" name="option_type" class="fChk" value="T" />
								<input type="hidden" name="item_listing_type" class="fChk"
								value="S" /> <input type="hidden" name="is_option_setting"
								class="fChk" value="F" /> <input type="hidden"
								name="mp_del_item_code" value=""> <input type="hidden"
								name="item_reset_flag" value=""> <input type="hidden"
								name="is_option_setting" value="F"> <input type="hidden"
								name="sOptionDelimiterData" value=""></td>
						</tr>
						<tr id="ec-product-register-item-use-area" style="display: none;">
							<th scope="row">옵션설정
								<div class="cTip eSmartMode" code="PT.PE.170"></div>
							</th>
							<td><select style="width: 270px" name="option_set_code">
									<option value="">- 옵션 템플릿을 선택해주세요 -</option>
									<option value="S000000A">색상/사이즈</option>
							</select> <a href="#none" class="btnNormal"
								id="ec-product-register-template-popup" title="새창 열림">템플릿관리<em
									class="icoLink"></em></a>
								<div class="mBoard gSingle">
									<table border="1" summary="">
										<caption>옵션세트</caption>
										<colgroup>
											<col style="width: 350px" />
											<col style="width: auto" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col">옵션명</th>
												<th scope="col">옵션값</th>
											</tr>
										</thead>
										<tbody id="eManualOptionTbody">
											<tr id="eManualOptionHeadTemplate" style="display: none;">
												<td><input type="text" value="" required="required"
													placeholder="예시) 색상" class="fText eManualOptionName"
													style="width: 100%;" /> <input type="hidden" class="fChk"
													name="is_necessary[#NUM#]" value="T"> <input
													type="hidden" class="ec-product-register-item-option-style"
													value="S" /> <input type="hidden"
													class="ec-product-register-item-option-link-image" value="" />
													<input type="hidden"
													class="ec-product-register-item-option-option_code"
													value="" /></td>
												<td class="eBubbleArea" id="eOptionBubbleArea_[#NUM#]">

												</td>
											</tr>

										</tbody>
									</table>
								</div>

								<div>
									<div class="mBoardArea gSingle">
										<div class="mBoard typeHead">
											<table border="1" summary="">
												<caption>옵션품목</caption>
												<colgroup>
													<col style="width: auto;" />
													<col style="width: 130px" />
													<col style="width: 300px;" />
													<col style="width: 135px;" />
													<col style="width: 117px;" />
												</colgroup>
												<tbody>
													<tr>
														<th scope="col">옵션 (품목코드)</th>
														<th scope="col">추가금액</th>
														<th scope="col">재고관리</th>
														<th scope="col">재고수량</th>
														<th scope="col">삭제</th>
													</tr>
												</tbody>
											</table>
										</div>
										<div
											class="mBoard typeBody gClearHeight eMarketItem eMarketChecker"
											id="ec-product-register-item-list-height">
											<table border="1" summary="">
												<caption>옵션품목</caption>
												<colgroup>
													<col style="width: auto;" />
													<col style="width: 130px" />
													<col style="width: 300px;" />
													<col style="width: 135px;" />
													<col style="width: 100px;" />
												</colgroup>
												<tbody id="ec-product-register-item-list">
													<tr class="positive" id="ec-product-form-item-batch">
														<td class="right"><strong class="txtStrong">일괄
																적용</strong></td>
														<td><input type="text"
															class="fText right eMarketIgnore" value="0"
															style="width: 100%;"
															id="ec-product-register-item-batch-price" /></td>
														<td><select class="fSelect eMarketIgnore"
															style="width: 100%;" id="ec-product-register-item-batch">
																<option value="O" selected="selected">재고수량 관리안함</option>
																<option value="F">재고수량 소진 시 품절 표시함</option>
																<option value="T">재고수량 소진 시 품절 표시안함</option>
														</select></td>
														<td class="center"><span
															id="ec-product-register-item-batch-stocknumber-none">-</span><input
															id="ec-product-register-item-batch-stocknumber"
															type="text" class="fText right eMarketIgnore"
															style="width: 100%; display: none;" value="0" /></td>
														<td><a href="#none" class="btnNormal"
															id="ec-product-register-item-batch-apply">일괄 적용</a></td>
													</tr>
													<tr id="ec-product-register-item-row-template"
														style="display: none;">
														<td><span
															class="ec-product-register-item-list-optionname"></span>
														</td>
														<td><input type="text"
															class="fText right ec-product-register-item-list-price"
															value="0" style="width: 100%;"
															name="mp_stock_price_value[1][]" /> <input type="hidden"
															class="ec-product-register-item-name" value=""
															name="mp_option_name[]" /> <input type="hidden"
															class="ec-product-register-item-value" value=""
															name="mp_option_value[]" /> <input type="hidden"
															class="ec-product-register-item-code" value=""
															name="mp_prd_item_code[]" /> <input type="hidden"
															class="ec-product-register-item-necessary"
															name="mp_is_mandatory[]" /> <input type="hidden"
															class="ec-product-register-item-subcode"
															name="mp_product_sub_code[]" /> <input type="hidden"
															name="mp_item_image[]" /> <input type="hidden"
															name="mp_use_manage_stock[]" value="F"> <input
															type="hidden" name="mp_use_soldout[]" value="F">
														</td>
														<td><select
															class="fSelect ec-product-register-item-list-usestock"
															style="width: 100%;">
																<option value="O">재고수량 관리안함</option>
																<option value="F">재고수량 소진 시 품절 표시함</option>
																<option value="T">재고수량 소진 시 품절 표시안함</option>
														</select></td>
														<td class="center"><span
															class="ec-product-register-item-list-stock-none" style="">-</span><input
															type="text"
															class="fText right ec-product-register-item-list-stock"
															name="mp_stock_number[]"
															style="width: 100%; display: none;" value="0" /></td>
														<td><a href="#none"
															class="btnNormal ec-product-register-item-list-delete"><em
																class="icoDel"></em> 삭제</a></td>
													</tr>


												</tbody>
											</table>
											<p class="empty" id="ec-product-register-item-list-empty">품목
												정보가 없습니다.</p>
										</div>
									</div>
									<div class="mResizer theme1"
										id="ec-product-register-item-list-height-button">
										<span>선택 높이 영역 조절</span>
									</div>
								</div></td>
						</tr>

						<tr id="ec-product-register-item-none-option-stock">
							<th scope="row">재고관리
								<div class="cTip eSmartMode" code="PT.PE.580"></div>
							</th>
							<td><input type="hidden" name="sp_stock_type" value="A">
								<input type="hidden" name="sp_sold_out_stock_type" value="A">
								<input type="hidden" name="sp_stock_number" value="0" />
								<div class="mForm">
									<label class="fLabel">사용함 <input type="radio"
										class="fCheck eMarketChecker" name="sp_use_manage_stock"
										value="T" /> <span class="checkMark"></span>
									</label> <label class="fLabel">사용안함 <input type="radio"
										class="fCheck" name="sp_use_manage_stock" checked="checked"
										value="F" /> <span class="checkMark"></span>
									</label>
									<c:if test="">
										<div id="amountShow">
											<table>

												<tr>
													<td hidden="true">아이디</td>
													<td>색상</td>
													<td>크기</td>
													<td>재고갯수</td>
												</tr>

												<c:forEach items="${amountList }" var="amount">
													<tr>
														<td hidden="true"><input type="text" value="${amount.amount_id}"> </td>
														<td><input type="text" value="${amount.amount_color}"> </td>
														<td><input type="text" value="${amount.amount_size}"> </td>
														<td><input type="text" value="${amount.amount_count}"> </td>
													</tr>
												</c:forEach>


											</table>
										</div>
									</c:if>

									<div class="addForm" id="ec-product-register-single-stock-info">
										<input type="text" class="fText right eMarketChecker"
											name="sp_stock_number" style="width: 105px;" value="0"
											placeholder="재고수량입력" /> <label class="fLabel gSingleSide">재고수량
											소진 시 품절 표시함 <input type="checkbox"
											class="fCheck eMarketChecker" name="sp_use_soldout"
											data-uncheck="F" value="T" /> <span class="checkMark"></span>
										</label>
									</div>
								</div></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
		<div class="mToggleBar eToggle ec-product-register-toggle selected ">
			<h2>배송정보</h2>
			<div class="ctrl">
				<label class="gLabel" style="display: none"><input
					type="checkbox" name="aToggleValue[delivery]" value="T"
					data-uncheck="F" /> 항상열기</label> <span><button type="button">
						<em>열기</em>
					</button></span>
			</div>
		</div>

		<div class="toggleArea">
			<input type="hidden" name="delivery_cost_prepaid" value="B">
			<input type="hidden" name="delivery_scope" value="A"> <input
				type="hidden" name="delivery_place" value="전국지역"> <input
				type="hidden" name="delivery_start" value="3"> <input
				type="hidden" name="delivery_end" value="7"> <input
				type="hidden" id="hscode" value=""> <input type="hidden"
				id="clearance_category_code" value="">
			<div class="mBoard typeWrite">
				<table border="1" summary="">
					<caption>배송정보</caption>
					<colgroup>
						<col style="width: 190px;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>

						<tr class="ec-deilivery-indivisual-shipping-area">
							<th scope="row">배송비</th>
							<td>
								<div class="gIcoShop">
									<span class="icoShop" title="쇼핑몰별">쇼핑몰별</span>
									<div class="mForm">
										<input type="text">

									</div>
								</div>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>


		<div id="footer" align="right">
			<a href="#none" class="btnSubmit" id="ec-product-register-submit">상품수정</a>
		</div>



		<iframe id="ec-product-register-image-upload-frame"
			name="ec-product-register-image-upload-frame" style="display: none;"></iframe>

		<div class="layerArea dialog"></div>
	</div>













	<script type="text/javascript"
		src="//neomart.cafe24.com/admin/js/jslb_ajax.js" charset="utf-8"></script>
	<script type="text/javascript"
		src="//neomart.cafe24.com/ind-script/i18n.php?lang=ko_KR&domain=admin&v=1909251080"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="//img.echosting.cafe24.com/js/ec/mode/influencer_suio.min.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="//img.echosting.cafe24.com/js/ec/mode/influencer_ui.js"
		charset="utf-8"></script>

	<!-- 	<script type="text/javascript" -->
	<!-- 		src="/ind-script/optimizer.php?filename=tZWxUsMwDIYfoFl5Dl85BvYuLCzcwe7YiqPWtoxspy1Pj0sD10KhDU0uQxJL3y_9js4RLTkQ81sWDUsHa-KVYIiUWYFYRoHze18t4434Ky9jkGollq8ZeNvf5tVduY7IwGQKfKQfA6NPzflEqR164WWHRiYkLxz4PJNq93wp_QA2LEjD6XwZgngsUfF0ACpy7rcCFmvxvLd-iCwyM3i1FbGlMCv-FFzBq_5t1hA7ma7tZCyZnNAOnItgs0EfRSctapmI-0D1tXC1IGwSeB1_CheFQD7CdBXaMlswoYNWem2nLNABY7OdTr9Bm0bo35KSFsSKBo3wy56Hb21BlYhswnD-BAGNu_KBoUNYX5xfXMNHGGI8D5U1nVUqp45v0GT-77xm_DSasVI0js4atYE0hpKjHEdpKRInWdth56vM5cNAxLdhWJ3rXaXyHxmERbCgUk2bwWQJO4zDmkQnDZwy97_91SyN6Tf4HQ&type=js&k=22113a66c8b39920c550f46c974506fbdd8a6d56&t=1566930464"></script> -->
	<!-- 	<script type="text/javascript" -->
	<!-- 		src="/ind-script/optimizer.php?filename=pZTbbsMgDIZfILd7DrS9wbRpd5OmTdWuCTipU8DMQA9vP7KlTSu1UgNXGIv_kw_YYk0WxOMTi46lhR3xRjAESqxAJPRSbcTwk4APwpvUowvZO3mahI1m8l62BpohPIgTzDP1mScMtmL1T_k8UocgXtYUwAn1d5Qrnwe5v1TfnYSSBpyWfEwli5ujb1FAHbG9LpDeiw8mnVS8UPjJBxpbisu0igyxWqOfrSqAwbA4AmvJlWU81krAPuYqC4xgM6tFBxUwtLIHVFUBlcvnXzi9uo15Jw1XGdPZtDKgWvTzvr7fVt6Q1LNVrc_DkJaN8uvBycgAZzvBU8CI5Mo4ejIqagn7HELiGkTIuyCU7pZxsjyqDbCD3fm1IqBxXsp-6VYa1DISzxb52_25KxoNBrdju8sRVrrUSRVzn6rqoqoSQddRhZyhzxv0VgJ8pjzVPj_9BQ&type=js&k=fced050bc25761d67404884ca2c579bd18b49513&t=1569349272"></script> -->
	<!-- 	<script type="text/javascript"> -->

	<!-- </script> -->
</body>

<script type="text/javascript">
	var d = document.getElementById("amountShow");
	d.style.display= "none";
</script>
</html>


