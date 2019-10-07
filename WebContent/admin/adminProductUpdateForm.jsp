<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="copyright"
	content="Copyright(c) Simplex Internet Inc.All Rights Reserved." />
<title>Cafe24-Echosting Admin</title>
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-K3JXM7C');</script>
<!-- End Google Tag Manager -->
<link rel="stylesheet" type="text/css"
	href="//img.echosting.cafe24.com/css/ec/mode/influencer/common.css"
	media="all" charset="utf-8" />

<link rel="stylesheet" type="text/css"
	href="/ind-script/optimizer.php?filename=rZRRTgQhDIYP4Lx6DqL3MDHeoFM6s3WAYoEd9fQyM4luXNesI09ASz_-Pw01B_Fk7u7VRJVRwRuI0Tyq2ILZPFGSokgGU1ourMFB1Bt6jZKKUlczt-YMoqeFZDnLkqMj0_yHirr0ki8UXKeTM_lvgKFW0yw6fb1ZOAJO5vmlkL6Z6MrIIdXoytuiXeEO5czwfli9z-_Qu3bERI4wN0UCVs-WJbQjliwoPjrK7WT2JeeGGi2Dk7FdXxxb0ma42uHUzipkioxTQ33rB6WUemjo-UCe_jUIPIQyAObLM-s6jiXHx0XVTmsIjoIF_dzccBh2w8SJbu0LNJ8ef_H4IJZ-NFjnm_fbN_oA&type=css&k=ba69c4827c5ce69af7c4f2914923b80502844ddc&t=1566930465" />
<script type="text/javascript">function getMultiShopUrl(sUrl)
        {
           if (SHOP.isMultiShop() === false) {
               return sUrl;
           } else if (/^\/((?:disp|exec)\/admin|admin\/php)(\/shop\d+)\//.test(sUrl) === true) {
               return sUrl;
           } else {
               return sUrl.replace(/\/((?:disp|exec)\/admin|admin\/php)(\/shop\d+)?\//, "/$1/shop" + EC_SDE_SHOP_NUM + "/");
           }
        }
var EC_SDE_SHOP_NUM = 1;var SHOP = {getLanguage : function() { return "ko_KR"; },getCurrency : function() { return "KRW"; },getFlagCode : function() { return "KR"; },isMultiShop : function() { return false; },isDefaultShop : function() { return true; },isDefaultLanguageShop : function(sLanguageCode) { return SHOP.isDefaultShop() && SHOP.isLanguageShop(sLanguageCode); },isKR : function() { return true; },isUS : function() { return false; },isJP : function() { return false; },isCN : function() { return false; },isTW : function() { return false; },isES : function() { return false; },isPT : function() { return false; },isVN : function() { return false; },isLanguageShop : function(sLanguageCode) { return sLanguageCode === "ko_KR"; },getDefaultShopNo : function() { return 1; },getProductVer : function() { return 2; },isSDE : function() { return true; },isMode : function() {return true; },isExperienceMall : function() { return true; },getAdminID : function() {return 'neomart'},getMallID : function() {return 'neomart'}};var EC_COMMON_UTIL = {convertSslForString : function(sString) { return sString.replace(/http:/gi, '');},convertSslForHtml : function(sHtml) { return sHtml.replace(/((?:src|href)\s*=\s*['"])http:(\/\/(?:[a-z0-9\-_\.]+)\/)/ig, '$1$2');},getProtocol : function() { return 'https'; },moveSsl : function() { if (EC_COMMON_UTIL.getProtocol() === 'http') { var oLocation = jQuery(window.location); var sUrl = 'https://' + oLocation.attr('host') + oLocation.attr('pathname') + oLocation.attr('search'); window.location.replace(sUrl); } }};
            var EC_ROOT_DOMAIN = "cafe24.com";
            var EC_GLOBAL_INFO = (function() {
                var oData = {"base_domain":"neomart.cafe24.com","root_domain":"cafe24.com","is_global":false,"country_code":"KR","language_code":"ko_KR"};
                
                return {
                    getBaseDomain: function() {
                        return oData['base_domain'];
                    },

                    getRootDomain: function() {
                        return oData['root_domain'];
                    },

                    isGlobal: function() {
                        return oData['is_global'];
                    },

                    getCountryCode: function() {
                        return oData['country_code'];
                    },

                    getLanguageCode: function() {
                        return oData['language_code'];
                    }
                };
            })();</script>
</head>
<body id="popup" size="1200, 800" class="ECInfluencer">

	<div id="wrap">
		<!-- Google Tag Manager (noscript) -->
		<noscript>
			<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-K3JXM7C"
				height="0" width="0" style="display: none; visibility: hidden"></iframe>
		</noscript>
		<!-- End Google Tag Manager (noscript) -->
		<div class="headingArea">
			<div class="mTitle">
				<h1>상품 수정</h1>
				<span class="cManual eSmartMode" code="PT.PE"></span>
			</div>
		</div>

		<form name="ec-influencer-product-register"
			id="ec-influencer-product-register" method="POST"
			action="/exec/admin/shop1/product/ProductModify">
			<input type="hidden" name="product_no" value="12"> <input
				type="hidden" name="sModifyOpenTime" value="2019-10-04 17:48:05">
			<input type="hidden" name="mode_register" value="T"> <input
				type="hidden" name="previewProduct" id="previewProduct" value="F" />
			<input type="hidden" id="previewProductNo" name="previewProductNo"
				value="" /> <input type="hidden" name="is_linker" value="" /> <input
				type="hidden" name="bMarketMatch" value="F" /> <input type="hidden"
				name="bMarketSend" class="eMarketRegister" value="F" /> <input
				type="hidden" name="bSendRtq" class="eMarketRtq" value="N" />

			<!-- 참고: 기본정보 -->
			<style>
.mThumbs.eImgSort .highlight {
	margin: 0 0 0 20px;
	width: 100px;
	height: 120px
}
</style>
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
											value="ㅂㅇㅁㄴㅇㅂ" maxcount="250" /> <input type="hidden"
											id="mp_prd_product_code" value="P000000M">
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
								<td colspan="2"><input type="hidden"
									name="product_tax_type" value="A"> <input type="text"
									class="fText right ePrdPrice eHasModifyProductAuth eMarketChecker ec-product-register-form-basic-price"
									name="product_price" style="width: 150px;" value="20000"
									fw-label="판매가" fw-filter="isFill" required="required" /> 원</td>
							</tr>
							<tr>
								<th scope="row">상품 요약설명</th>
								<td colspan="2"><input type="text" name="summary_desc"
									class="fText eMarketChecker" style="width: 80%;" value=""
									maxcount="255" /> <span class="txtByte" title="현재글자수/최대글자수">[
										<strong>0</strong> / 255 ]
								</span></td>
							</tr>
							<tr>
								<th scope="row">상품 상세설명 <input type="hidden"
									id="mobile_img_width_value" value="320">

								</th>
								<td colspan="2">
									<div class="mTab typeSub">
										<ul>
											<li class="selected" id="eTabEdiBot"><a
												href="#tabCont1_1" id="ediBotTab">에디봇 작성</a></li>
											<li class="" id="eTabNnedit"><a href="#tabCont1_2"
												id="nnedit">직접 작성</a></li>
										</ul>
									</div>
									<div id="tabCont1_1" class="tabCont" style="display: block;">
										<div id="edibotGuides">
											<div class="edibotContentNew">
												<p>
													템플릿 선택하고 이미지만 넣으면 <strong>3분 만에 제작 완료!</strong><br>블로그처럼
													쉽고 빠르게 콘텐츠를 제작해보세요.
												</p>
												<a href="#" class="edibot-open edibotMaking">에디봇으로 작성</a>
												<div class="dynatree-loading" id="edibot_install_loading"
													style="display: none;">
													<img src="//img.echosting.cafe24.com/suio/ico_loading.gif"
														alt="로딩중">
												</div>
											</div>
										</div>
										<div id="gEdibot" class="edibotArea" style="display: none;">
											<input type="hidden" name="use_edibot" id="use_edibot"
												value="T"> <input type="hidden" name="edibot_code"
												id="edibot_code" value="N191004_1617_03303F6C_296B37B5">
											<div class="gSingle left">
												<a href="javascript:;" class="btnCtrl edibotMaking"
													title="새창 열림" target="_blank"><span>수정하기</span></a>
											</div>
											<div id="product_description_EDIBOT"
												class="mBox typeBorder gScroll gNoMargin"
												style="height: 276px;"></div>
											<div class="mResizer theme1"
												id="eContorlHeightEdibotReviewBtn">
												<span>선택 높이 영역 조절</span>
											</div>
										</div>
									</div>

									<div id="tabCont1_2" class="tabCont" style="display: none;">
										<div class="gEditor">

											<script type="text/javascript"
												src="//editor.cafe24.com/js/nneditor.js?runtime=3.3.3?c=ko"></script>
											<script type="text/javascript">
                NN.Config.instanceID = "product_description";
                NN.Config.value = "<div class=\"edibot-product-detail\" style=\"width:1000px;margin:0 auto;\"><div type=\"application/json\" class=\"-edibot-metadata\" data-version=\"2.0.0\" data-api=\"1.0.0\" data-created=\"2019-10-04 16:19:19\" data-projectid=\"N191004_1617\" data-groupid=\"g000001\" data-sessionid=\"1\" data-classid=\"shirts\" data-shopno=\"1\" data-shoplang=\"ko_KR\"><!--{\"api\":\"1.0.0\",\"classid\":\"shirts\",\"groupid\":\"g000001\",\"mallid\":\"neomart\",\"projectid\":\"N191004_1617\",\"sessionid\":1,\"version\":\"2.0.0\",\"shopno\":1,\"shoplang\":\"ko_KR\",\"created\":\"2019-10-04 16:19:19\"}--></div>\n<style>.edibot-product-detail *{ font-family:inherit; font-size:inherit; }</style>\n<div><div style=\"width:100%;height:100%;position:relative;font-family:&quot;Malgun Gothic&quot;,sans-serif;font-size:28px;color:#444444;font-style:normal;font-weight:400;text-align:center;line-height:1.5;letter-spacing:0;word-spacing:0;opacity:1;\"><div>#상품명을 입력하세요.</div></div></div><div style=\"display: block;content: \' \';height:10px;\"></div>\n<div><div style=\"width:100%;height:100%;position:relative;font-family:&quot;Malgun Gothic&quot;,sans-serif;font-size:16px;color:#444444;font-style:normal;font-weight:400;text-align:center;line-height:1.5;letter-spacing:0;word-spacing:0;opacity:1;\"><div>언제 어디서나 편안한 착용감이 매력적인 데일리 아이템</div></div></div><div style=\"display: block;content: \' \';height:40px;\"></div>\n<div style=\"position:relative;\"><img src=\"/web/upload/NNEditor/20191004/aa63c8122b6041c25b734cbc50c59027.jpg\" style=\"display: block; max-width:100%\"></div><div style=\"display: block;content: \' \';height:50px\"></div>\n<div style=\"position:relative;\"><img src=\"/web/upload/NNEditor/20191004/c5698775dc4f4fd2da472dec961a6ba7.jpg\" style=\"display: block; max-width:100%\"></div><div style=\"display: block;content: \' \';height:50px\"></div>\n<div style=\"position:relative;\"><img src=\"/web/upload/NNEditor/20191004/82e1d647f3360cb034e3177e2175cc1f.jpg\" style=\"display: block; max-width:100%\"></div><div style=\"display: block;content: \' \';height:50px\"></div>\n<div style=\"position:relative;\"><img src=\"/web/upload/NNEditor/20191004/c11ea7579f4e0947f9ef41f1b462441e.jpg\" style=\"display: block; max-width:100%\"></div><div style=\"display: block;content: \' \';height:50px\"></div>\n<div style=\"position:relative;\"><img src=\"/web/upload/NNEditor/20191004/83d7eae5460f92797ac401beb53d51ed.jpg\" style=\"display: block; max-width:100%\"></div><div style=\"display: block;content: \' \';height:50px\"></div>\n<div style=\"position:relative;\"><img src=\"/web/upload/NNEditor/20191004/8685c1114a7866386c16f4e593ca9331.jpg\" style=\"display: block; max-width:100%\"></div><div style=\"display: block;content: \' \';height:50px\"></div>\n<div><div style=\"width:100%;height:100%;position:relative;font-family:&quot;Malgun Gothic&quot;,sans-serif;font-size:28px;color:#444444;font-style:normal;font-weight:400;text-align:center;line-height:1.5;letter-spacing:0;word-spacing:0;opacity:1;\"><div>Detail View</div></div></div><div style=\"display: block;content: \' \';height:10px;\"></div>\n<div><div style=\"width:100%;height:100%;position:relative;font-family:&quot;Malgun Gothic&quot;,sans-serif;font-size:14px;color:#444444;font-style:normal;font-weight:regular;text-align:center;line-height:1.6;letter-spacing:0;word-spacing:0;opacity:1;text-decoration-skip-ink:none;\"><div>디테일 이미지가 실제 제품 색상과 가장 흡사합니다.</div><div>색상은 모니터에 따라 차이가 있을 수 있습니다.</div></div></div><div style=\"display: block;content: \' \';height:50px;\"></div>\n<div style=\"position:relative;\"><img src=\"/web/upload/NNEditor/20191004/7cf414825a04d18635dd3f4ee200fd5e.jpg\" style=\"display: block; max-width:100%\"></div><div style=\"display: block;content: \' \';height:50px\"></div>\n<div style=\"position:relative;\"><img src=\"/web/upload/NNEditor/20191004/7048fed56716953e940f3c07fce76682.jpg\" style=\"display: block; max-width:100%\"></div><div style=\"display: block;content: \' \';height:50px\"></div>\n<div style=\"position:relative;\"><img src=\"/web/upload/NNEditor/20191004/7707653a0a397c1bfb15a21182a38bb8.jpg\" style=\"display: block; max-width:100%\"></div><div style=\"display: block;content: \' \';height:50px\"></div>\n</div>";
                
                
                var EDITORWRAPPER = { execFtp : function(oReq) { PRODUCTEDITOR.execFtp(oReq); }, execUploader : function(oReq) { PRODUCTEDITOR.execUploader(oReq); } };var NNCONFIG_PATH = '/ind-script/nnEditor/';var NNCONFIG_UPLOADURL = '/web/upload/NNEditor/';var NNCONFIG_UPLOADPATH = '/home/ec_users/neomart/public_html/web/upload/NNEditor/';
            var FTPIMAGESBUTTON={
                'uploader':{'param':this,'position':'8,2','cssText':'background-image:url(/ec-img/editor/ko_KR/btn_file_uploader.gif); background-repeat: no-repeat; background-position:0px 2px; width:68px;','method':EDITORWRAPPER.execUploader},
                'images':{
                    'param':this,
                    'position':'8,1',
                    'cssText':'background-image:url(/ec-img/editor/images.gif); background-repeat: no-repeat; background-position:3px 3px; width:20px;',
                    'method':function(evt) {
                        this.layer.empty({
                            '__TITLE__': '이미지 여러장 삽입',
                            'width': '250',
                            'e2': evt,
                            'callback' : function() {
                                NN.Utils.g('_contents_id_nullLayerPage').innerHTML = '<fieldset><legend>이미지 여러장 삽입</legend><input type="hidden" id="img_editor" value=""><table height="100%" width="240" order="0"><tbody><tr><td><div id="previewImageUploadEditor" style="text-align:center; border:1px solid #D7D7D7; width:240px; height:240px; overflow-y:scroll; overflow-x:hidden;" previewSize="225x225"></div></td></tr><tr><td style="text-align:center; padding:2px;"><div id="nameImageUploadEditor"></div></td></tr><tr><td style="text-align:center;"><span><div id="btnImageUploadEditor" style="display: none; background-image:url(/ec-img/editor/ko_KR/btn_find_file.gif); background-repeat: no-repeat; width: 80px; height:25px; margin: auto; cursor: Pointer;"></span></td></tr></tbody></table></fieldset><div class="actionPanel" style="margin:10px;"><div style="text-align: center;"><input type="button" value="입력" id="_insert" onclick="" class="nneditor-insert" /><input type="button" value="닫기" id="_close" class="nneditor-cancel" /></div></div>';
                                var evtClose = function() {
                                    // remove-events
                                    removeEvent(NN.Utils.g('_insert'), 'click', this.Events.evtImages, true);
                                    removeEvent(NN.Utils.g('_close'), 'click', this.Events.evtClose, true);

                                    var element = document.getElementById('_target_id_nullLayerPage');
                                    element.innerHTML = '';
                                    this.exec.close();
                                }.bind2Event(this);

                                NN.Utils.g($('div[id*="nneditorClose"]').attr('id')).onclick = evtClose;

                                var evtImages = function() {
                                    var s = this.oSelection;
                                    if (NN.Browser.MSIE && s.lastRange) s.focus();
                                    this.save.saveHistory(true);

                                    $.each($('#img_editor').val().split(','), function(k, v) {
                                        if (v != '') {
                                            s.pasteContent('<img alt="" src="'+v+'">');
                                        }
                                        s.pasteContent('<P>&nbsp;');
                                    });

                                    // remove-events
                                    removeEvent(NN.Utils.g('_insert'), 'click', this.Events.evtImages, true);
                                    removeEvent(NN.Utils.g('_close'), 'click', this.Events.evtClose, true);

                                    var element = document.getElementById('_target_id_nullLayerPage');
                                    element.innerHTML = '';
                                    this.exec.close();
                                }.bind2Event(this);

                                this.oEvent.add(NN.Utils.g('_insert'), 'click', evtImages, 'static'); evtImages = null;
                                this.oEvent.add(NN.Utils.g('_close'), 'click', evtClose, 'static'); evtClose = null;
                        }.bind2(this)
                    });
                    PREVIEW.init('btnImageUploadEditor', 'nameImageUploadEditor', 'previewImageUploadEditor', 'img_editor', NNCONFIG_UPLOADPATH, 0);
                }
            }};NN.Config.path = NNCONFIG_PATH;NN.Config.uploadURL = NNCONFIG_UPLOADURL;NN.Config.uploadPath = NNCONFIG_UPLOADPATH;NN.Config.addToolbarBtn=FTPIMAGESBUTTON;NN.Config.rmBtn = ['full']
                

                //Editor Height
                NN.Config.height=170;

                var oNN_product_description = new NNEditor();
                oNN_product_description.build();

                if (typeof $Editor != "object") {
                    $Editor = {
                        _obj : {},

                        push : function(obj, id) {
                            this._obj[id] = obj;
                        },

                        get : function(id) {
                            return this._obj[id];
                        },

                        reset : function(id) {
                            this._obj[id].getText().value = "";
                            this._obj[id].getIFDoc().body.innerHTML = this._obj[id].Config.START_HTML;
                        },

                        contents : function(id, context) {
                            this._obj[id].getText().value = context;
                            this._obj[id].getIFDoc().body.innerHTML = this._obj[id].view.parsing(2);
                        }
                    };
                }

                $Editor.push(oNN_product_description, "product_description");
            </script>

										</div>
									</div>
								</td>
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
											<img
												src="/web/product/big/201910/840fd4e8c3d95f86d6e896762312c8f8.gif"
												alt="" id="ec-product-register-image" />
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
									class="eMarketChecker"
									id="ec-product-register-old-detail-image"
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
				<li id="ec-product-register-addimage-template"
					style="display: none;">
					<div class="mThumb gSmall">
						<div class="thumb">
							<img src="" alt="" class="ec-product-register-add-image-tag" />
							<input type="hidden" id="ec-product-register-addimage-input"
								value="">
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
							<tr>
								<th scope="row">메인 진열
									<div class="cTip eSmartMode" code="PT.PE.110"></div>
								</th>
								<td><label class="fLabel"> 추천상품 <input
										type="checkbox" name="display_group[1][]" value="2"
										class="fCheck eAddMainCate"> <span class="checkMark"></span>
								</label> <label class="fLabel"> 신상품 <input type="checkbox"
										name="display_group[1][]" value="3"
										class="fCheck eAddMainCate"> <span class="checkMark"></span>
								</label> <label class="fLabel"> 추가카테고리1 <input type="checkbox"
										name="display_group[1][]" value="4"
										class="fCheck eAddMainCate"> <span class="checkMark"></span>
								</label> <label class="fLabel"> 추가카테고리2 <input type="checkbox"
										name="display_group[1][]" value="5"
										class="fCheck eAddMainCate"> <span class="checkMark"></span>
								</label></td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
			<div class="mToggleBar eToggle ec-product-register-toggle selected ">
				<h2>판매 정보</h2>
				<div class="ctrl">
					<label class="gLabel" style="display: none"><input
						type="checkbox" name="aToggleValue[sales]" " value="T"
						data-uncheck="F" /> 항상열기</label> <span><button type="button">
							<em>열기</em>
						</button></span>
				</div>
			</div>
			<div class="toggleArea">
				<div class="mBoard typeWrite">
					<table border="1" summary="">
						<caption>판매 정보</caption>
						<colgroup>
							<col style="width: 190px;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">공급가</th>
								<td><input type="text" class="fText right eMarketChecker"
									style="width: 150px;" name="product_buy" id="product_buy"
									fw-label="공급가" value="10000" fw-filter="" /> 원</td>
							</tr>
							<tr>
								<th scope="row">소비자가</th>
								<td><input type="text" class="fText right eMarketChecker"
									style="width: 150px;" id="ec-product-register-product-custom"
									name="product_custom[1]" value="20000" fw-filter=""
									fw-label="소비자가" fw-alone='Y' /> 원</td>
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
									name="is_option_setting" value="F"> <input
									type="hidden" name="sOptionDelimiterData" value=""></td>
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
														type="hidden"
														class="ec-product-register-item-option-style" value="S" />
														<input type="hidden"
														class="ec-product-register-item-option-link-image"
														value="" /> <input type="hidden"
														class="ec-product-register-item-option-option_code"
														value="" /></td>
													<td class="eBubbleArea" id="eOptionBubbleArea_[#NUM#]">

													</td>
												</tr>

											</tbody>
										</table>
									</div>
									<div class="gridSet middle gDouble">
										<div class="grid left">
											<label class="fLabel"> 위 옵션 정보를 <input
												type="checkbox" class="fCheck" name="regist_option_set"
												value="T" /><span class="checkMark"></span></label><span
												class="gLabel"><input type="text" class="fText"
												required="required" name="option_setname"
												style="width: 200px;" placeholder="예시) 색상/사이즈" /> 으로 템플릿에
												저장합니다. 
										</div>
										<div class="grid right">
											<a href="#none" id="eManualOptionCombine" class="btnCtrl">옵션품목
												만들기</a> <a href="#none" class="btnNormal"
												id="ec-product-register-item-delete-all">품목정보 초기화</a>
										</div>
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
																	<option value="O" selected="selected">재고수량
																		관리안함</option>
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
																class="ec-product-register-item-list-stock-none"
																style="">-</span><input type="text"
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
										<div class="addForm"
											id="ec-product-register-single-stock-info">
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
							<tr>
								<th scope="row">추가입력 옵션
									<div class="cTip eSmartMode" code="PT.PE.570"></div>
								</th>
								<td>
									<div class="mForm">
										<label class="fLabel">사용함 <input type="radio"
											class="fCheck" name="add_option" value="T" /> <span
											class="checkMark"></span>
										</label> <label class="fLabel">사용안함 <input type="radio"
											class="fCheck" name="add_option" value="F" checked=checked />
											<span class="checkMark"></span>
										</label>

										<div class="addForm" id="ec-product-register-add-option-area">
											<div class="mBoard">
												<table border="1" summary="">
													<caption>옵션세트</caption>
													<colgroup>
														<col style="width: auto" />
														<col style="width: 420px" />
													</colgroup>
													<thead>
														<tr>
															<th scope="col">옵션명</th>
															<th scope="col">옵션값</th>
														</tr>
													</thead>
													<tbody id="ec-product-register-add-item-list">
														<tr id="ec-product-register-add-item-template"
															style="display: none;">
															<td><input type="text" class="fText"
																style="width: 325px;" maxcount="250" required="required"
																data-name="add_option_name[]" placeholder="옵션명을 입력해주세요." />
																<span class="txtByte" title="새창 열림">[ <strong>0</strong>
																	/ 250 ]
															</span></td>
															<td><select class="fSelect"
																data-name="add_option_necessary[]" style="width: 150px;">
																	<option value="T">필수항목</option>
																	<option value="F">선택항목</option>
															</select> <select class="fSelect" data-name="add_option_limit[]"
																style="width: 150px;">
																	<option value="1">1자</option>
																	<option value="2">2자</option>
																	<option value="3">3자</option>
																	<option value="4">4자</option>
																	<option value="5">5자</option>
																	<option value="6">6자</option>
																	<option value="7">7자</option>
																	<option value="8">8자</option>
																	<option value="9">9자</option>
																	<option value="10" selected="selected">10자</option>
																	<option value="11">11자</option>
																	<option value="12">12자</option>
																	<option value="13">13자</option>
																	<option value="14">14자</option>
																	<option value="15">15자</option>
																	<option value="16">16자</option>
																	<option value="17">17자</option>
																	<option value="18">18자</option>
																	<option value="19">19자</option>
																	<option value="20">20자</option>
																	<option value="21">21자</option>
																	<option value="22">22자</option>
																	<option value="23">23자</option>
																	<option value="24">24자</option>
																	<option value="25">25자</option>
																	<option value="26">26자</option>
																	<option value="27">27자</option>
																	<option value="28">28자</option>
																	<option value="29">29자</option>
																	<option value="30">30자</option>
																	<option value="50">50자</option>
																	<option value="100">100자</option>
																	<option value="200">200자</option>
															</select>
																<button type="button" class="btnIcon icoMinus"
																	data-css="ec-product-register-add-option-minus">삭제</button>
																<button type="button" class="btnIcon icoPlus"
																	data-css="ec-product-register-add-option-plus">추가</button>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</td>
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
							<tr>
								<th scope="row">배송비 설정
									<div class="cTip eSmartMode" code="PT.PE.210"></div>
								</th>
								<td><input type="hidden" id="eDefaultdelvtype" value="A">

									<label class="fLabel">기본설정 사용 <input type="radio"
										class="fCheck" name="use_individual_ship_config"
										id="useDeliveryInfoD" value="F" checked="checked" /> <span
										class="checkMark"></span>
								</label> <span class="gLabel"><a
										href="/admin/php/shop1/m/shipping_info_f.php"
										target="ec-blank-page-exists-menu" title="새창 열림"
										class="btnLink"><span>[보기<em class="icoLink"></em>]
										</span></a></span> <label class="fLabel euseDeliveryInfoS"
									id="displayIndividualConfig">개별설정 <input type="radio"
										class="fCheck" name="use_individual_ship_config"
										id="useDeliveryInfoS" value="T" /> <span class="checkMark"></span>
								</label></td>
							</tr>
							<tr class="ec-deilivery-indivisual-shipping-area">
								<th scope="row">배송 템플릿</th>
								<td><select class="fSelect" style="width: 285px;"
									name="delivery_templates">
										<option value="">--- 배송비 템플릿을 선택해 주세요 ---</option>
								</select> <a href="#none" class="btnNormal"
									id="ec-product-register-delivery-template-open" title="새창 열림">템플릿관리<em
										class="icoLink"></em></a></td>
							</tr>
							<tr class="ec-deilivery-indivisual-shipping-area">
								<th scope="row">배송방법</th>
								<td><select class="fSelect" style="width: 285px;"
									name="delivery_method">
										<option value="01" selected="selected">택배</option>
										<option value="02">빠른등기</option>
										<option value="03">일반등기</option>
										<option value="04">직접배송</option>
										<option value="05">퀵배송</option>
										<option value="06">기타</option>
										<option value="07">화물배송</option>
										<option value="08">매장직접수령</option>
										<option value="09">배송필요 없음</option>
								</select></td>
							</tr>
							<tr class="ec-deilivery-indivisual-shipping-area">
								<th scope="row">배송비</th>
								<td>
									<div class="gIcoShop">
										<span class="icoShop" title="쇼핑몰별">쇼핑몰별</span>
										<div class="mForm">
											<select class="fSelect" style="width: 285px;"
												id="ec-delivery-fee-type" name="delivery_fee_type">
												<option value="T" checked="checked">배송비 무료</option>
												<option value="R">고정배송비 사용</option>
												<option value="M">구매 금액에 따른 부과</option>
												<option value="D">구매 금액별 차등 배송료 사용</option>
												<option value="W">상품 무게별 차등 배송료 사용</option>
												<option value="C">상품 수량별 차등 배송료 사용</option>
												<option value="N">상품 수량에 비례하여 배송료 부과</option>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr class="ec-deilivery-indivisual-shipping-area"
								id="ec-delivery-fee-row">
								<th scope="row">배송비 상세 설정</th>
								<td id="ec-delivery-fee-contents"></td>
							</tr>

							<tr>
								<th scope="row">상품 전체중량</th>
								<td><span class="gNumber"> <input class="fText"
										name="product_weight" id="ec-product-register-weight"
										type="text" value="1.00" />
										<button type="button" class="up"
											id="ec-product-register-weight-up">
											<span>증가</span>
										</button>
										<button type="button" class="down"
											id="ec-product-register-weight-down">
											<span>감소</span>
										</button>
								</span> kg</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="gDouble addForm"
					id="ec-product-register-delyvery-template">
					<label class="fLabel"> 위 배송 정보를 <input type="checkbox"
						class="fCheck" name="register_delivery_template" value="T" /><span
						class="checkMark"></span></label><span class="gLabel"><input
						type="text" class="fText" style="width: 200px;"
						name="delivery_template_name" maxlength="250" maxcount="250"
						required="required" placeholder="예시) 기본배송비" /> 으로 템플릿에 저장합니다. </span>
				</div>


				<div class="ec-product-form-delivery-grade-form"
					style="display: none;">
					<div class="mBoard gDouble">
						<table border="1" summary=""
							class="ec-product-form-delivery-template-table">
							<caption>배송비 상세 설정</caption>
							<colgroup>
								<col style="width: 60px;" />
								<col style="width: auto;" />
								<col style="width: 25%;" />
								<col style="width: 100px;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col" class="ec-product-form-delivery-grade-column">상품
										무게 구간</th>
									<th scope="col">배송비</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>
							<tbody
								class="center ec-product-form-delivery-grade-template-body">
								<tr class="ec-product-form-delivery-grade-template"
									style="display: none;">
									<td>1</td>
									<td class="left"></td>
									<td class="right"></td>
									<td><input type="hidden" class="fText right"
										style="width: 100px;" required="required" value=""
										id="ec-product-register-delivery-input-template"> <input
										type="hidden" name="ship_buy_start"
										class="ec-product-delivery-start"> <input
										type="hidden" name="ship_buy_end"
										class="ec-product-delivery-end"> <input type="hidden"
										name="ship_fee" class="ec-product-delivery-fee"> <a
										href="#none" class="btnNormal ec-product-form-delivery-delete"><span><em
												class="icoDel"></em> 삭제</span></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="mToggleBar eToggle ec-product-register-toggle selected ">
				<h2>제작정보</h2>
				<div class="ctrl">
					<label class="gLabel" style="display: none"><input
						type="checkbox" name="aToggleValue[manufacturer]" value="T"
						data-uncheck="F" /> 항상열기</label> <span><button type="button">
							<em>열기</em>
						</button></span>
				</div>
			</div>
			<div class="toggleArea">
				<div class="mBoard typeWrite">
					<table border="1" summary="">
						<caption>제작정보</caption>
						<colgroup>
							<col style="width: 190px;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">상품소재</th>
								<td><input type="text" name="product_material"
									id="product_material" class="fText" style="width: 600px;"
									value="" /></td>
							</tr>
							<tr>
								<th scope="row">공급사</th>
								<td><select data-placeholder="- 공급사 선택 -"
									id="supplierInfoData"
									class="chzn-select-deselect eSupplier eMarketChecker"
									style="width: 350px" name="supplier_id">
										<option value="S0000000" selected="selected">자체공급</option>
								</select> <a href="#layerSupply" class="btnNormal eModal">등록</a></td>
							</tr>
							<tr>
								<th scope="row">제조사</th>
								<td><select data-placeholder="- 제조사 선택 -"
									id="manufacturerInfoData"
									class="chzn-select-deselect eManufacturer eMarketChecker"
									style="width: 350px;" name="manufacturer_code"
									id="manufacturerInfoData">
										<option value="M0000000" selected="selected">자체제작</option>
								</select> <a href="#layerMaker" class="btnNormal eModal">등록</a></td>
							</tr>
							<tr>
								<th scope="row">제조일자</th>
								<td><input type="text" id="print_date" name="print_date"
									readonly class="fText gDate eMarketChecker" value=""> <a
									href="#none" id="ec-product-register-manufacturer-makedata"
									class="btnIcon icoCal">달력보기</a></td>
							</tr>
							<tr>
								<th scope="row">원산지</th>
								<td><select class="fSelect" id="origin_level1"
									name="origin_level1">
										<option value="F" selected="selected">국내</option>
										<option value="T">국외</option>
										<option value="E">기타</option>
								</select> <span id="origin_levelF" class="hiddenOriginCode"> <select
										name="place_parent_no[F]" id="origin_levelF2" class="fSelect">
											<option value="">- 국내선택 -</option>
											<option value="009">서울특별시</option>
											<option value="008">부산광역시</option>
											<option value="006">대구광역시</option>
											<option value="011">인천광역시</option>
											<option value="005">광주광역시</option>
											<option value="007">대전광역시</option>
											<option value="010">울산광역시</option>
											<option value="017">세종특별자치시</option>
											<option value="002">경기도</option>
											<option value="001">강원도</option>
											<option value="016">충청북도</option>
											<option value="015">충청남도</option>
											<option value="013">전라북도</option>
											<option value="012">전라남도</option>
											<option value="004">경상북도</option>
											<option value="003">경상남도</option>
											<option value="014">제주특별자치도</option>
									</select> <input type="hidden" name="origin_level_code">
								</span> <span id="origin_levelT" class="hiddenOriginCode"> <select
										class="fSelect" id="origin_levelT2" name="place_parent_no[T]">
											<option value="">- 대륙선택 -</option>
											<option value="100">아시아</option>
											<option value="103">아메리카</option>
											<option value="102">유럽</option>
											<option value="104">오세아니아</option>
											<option value="101">아프리카</option>
									</select>
								</span> <span id="origin_level3" class="hiddenOriginCode"></span> <span
									id="origin_levelE" class="hiddenOriginCode"> <input
										type="text" class="fText" style="width: 200px;" name="made_in"
										value="" id="eMadeIn" maxlength="30" />
								</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div id="layerSupply" class="mLayer gMedium">
				<h2>공급사 등록</h2>
				<div class="wrap">
					<div class="mTitle">
						<h3>공급사 등록</h3>
					</div>
					<div class="mBoard gMedium">
						<table border="1" summary="">
							<caption>공급사 등록</caption>
							<tbody>
								<tr>
									<th scope="row">공급사명 <strong class="icoRequired">필수</strong></th>
									<td><input type="text" class="fText" required="required"
										placeholder="예시) 공급사명" style="width: 320px;" name="supp_name"
										id="supp_name" fw-label="공급사명" fw-filter="isFill" /></td>
								</tr>
								<tr>
									<th scope="row">정산유형</th>
									<td><label class="gLabel w90"><input type="radio"
											name="transaction_type" id="transaction_typeP" class="fChk"
											value="P" checked="checked" /> 수수료형</label><span class="gLabel"><input
											type="text" class="fText" name="commission_percent"
											id="commission_percent" value="10" style="width: 40px;" /> %</span>
										<label class="gLabel"><input type="radio"
											name="transaction_type" id="transaction_typeD" class="fChk"
											value="D" /> 매입형</label></td>
								</tr>
							</tbody>
						</table>
					</div>
					<p class="mList">
						공급사의 상세한 정보는 <a href="#none" id="eProductSalesSupplierPopup">[공급사
							관리]</a>에서 입력하실 수 있습니다.
					</p>
				</div>
				<div class="footer">
					<a href="#none" class="btnCtrl" id="eRegistSupplier"><span>등록</span></a>
					<a href="#none" class="btnNormal eClose"><span>취소</span></a>
				</div>
				<button type="button" class="btnClose eClose">닫기</button>
			</div>


			<div id="layerMaker" class="mLayer gMedium">
				<h2>제조사 등록</h2>
				<div class="wrap">
					<div class="mTitle">
						<h3>제조사 등록</h3>
					</div>
					<div class="mBoard gMedium">
						<table border="1" summary="">
							<caption>제조사 등록</caption>
							<tbody>
								<tr>
									<th scope="row">제조사명 <strong class="icoRequired">필수</strong></th>
									<td><input type="text" class="fText"
										id="manufacturer_register_name" placeholder="예시) 제조사명"
										required="required" style="width: 300px;" fw-label="제조사명"
										fw-filter="isMaxByte[200]&isFill" /></td>
								</tr>
								<tr>
									<th scope="row">대표자명 <strong class="icoRequired">필수</strong></th>
									<td><input type="text" class="fText"
										id="manufacturer_register_ceo_name" placeholder="예시) 대표자명"
										required="required" style="width: 300px;" fw-label="대표자명"
										fw-filter="isMaxByte[30]&isFill" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="footer">
					<a href="#none" class="btnCtrl" id="eRegistManufacturer"><span>등록</span></a>
					<a href="#none" class="btnNormal eClose"><span>취소</span></a>
				</div>
				<button type="button" class="btnClose eClose">닫기</button>
			</div>
			<div class="mToggleBar eToggle ec-product-register-toggle selected ">
				<h2>상품 꾸미기</h2>
				<div class="ctrl">
					<label class="gLabel" style="display: none"><input
						type="checkbox" name="aToggleValue[icon]" value="T"
						data-uncheck="F" /> 항상열기</label> <span><button type="button">
							<em>열기</em>
						</button></span>
				</div>
			</div>
			<div class="toggleArea">
				<div class="mBoard typeWrite">
					<table border="1" summary="">
						<caption>상품 꾸미기</caption>
						<colgroup>
							<col style="width: 190px;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">상품 이미지 꾸미기
									<div class="cTip eSmartMode" code="PT.PE.320"></div>
								</th>
								<td>
									<div class="gridSet middle">
										<div class="grid left">
											<label class="fLabel">항상표시 <input type="checkbox"
												class="fCheck" value="T" data-uncheck="F"
												name="use_image_icon_exposure_period" checked="checked" />
												<span class="checkMark"></span>
											</label> <span id="ec-product-register-imageicon-preiod-area">
												<input type="text" id="start_date_image_icon" readonly
												name="start_date_image_icon" value="2019-10-04"
												class="fText gDate eImageIconExposureTerm"> <a
												href="javascript:;"
												class="btnIcon icoCal startDateImageIcon"><span>달력보기</span></a>
												<select class="fSelect eImageIconExposureTerm"
												id="ImageIconStartHour" name="ImageIconStartHour">
													<option value="00" selected="selected">00</option>
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
											</select> <select class="fSelect eImageIconExposureTerm"
												id="ImageIconStartMin" name="ImageIconStartMin">
													<option value="00" selected="selected">00</option>
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
													<option value="24">24</option>
													<option value="25">25</option>
													<option value="26">26</option>
													<option value="27">27</option>
													<option value="28">28</option>
													<option value="29">29</option>
													<option value="30">30</option>
													<option value="31">31</option>
													<option value="32">32</option>
													<option value="33">33</option>
													<option value="34">34</option>
													<option value="35">35</option>
													<option value="36">36</option>
													<option value="37">37</option>
													<option value="38">38</option>
													<option value="39">39</option>
													<option value="40">40</option>
													<option value="41">41</option>
													<option value="42">42</option>
													<option value="43">43</option>
													<option value="44">44</option>
													<option value="45">45</option>
													<option value="46">46</option>
													<option value="47">47</option>
													<option value="48">48</option>
													<option value="49">49</option>
													<option value="50">50</option>
													<option value="51">51</option>
													<option value="52">52</option>
													<option value="53">53</option>
													<option value="54">54</option>
													<option value="55">55</option>
													<option value="56">56</option>
													<option value="57">57</option>
													<option value="58">58</option>
													<option value="59">59</option>
											</select> ~ <input type="text" id="end_date_image_icon" readonly
												name="end_date_image_icon" value="2019-10-04"
												class="fText gDate eImageIconExposureTerm"> <a
												href="javascript:;" class="btnIcon icoCal endDateImageIcon"><span>달력보기</span></a>
												<select class="fSelect eImageIconExposureTerm"
												id="ImageIconEndHour" name="ImageIconEndHour">
													<option value="00">00</option>
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23" selected="selected">23</option>
											</select> <select class="fSelect eImageIconExposureTerm"
												id="ImageIconEndMin" name="ImageIconEndMin">
													<option value="00">00</option>
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
													<option value="24">24</option>
													<option value="25">25</option>
													<option value="26">26</option>
													<option value="27">27</option>
													<option value="28">28</option>
													<option value="29">29</option>
													<option value="30">30</option>
													<option value="31">31</option>
													<option value="32">32</option>
													<option value="33">33</option>
													<option value="34">34</option>
													<option value="35">35</option>
													<option value="36">36</option>
													<option value="37">37</option>
													<option value="38">38</option>
													<option value="39">39</option>
													<option value="40">40</option>
													<option value="41">41</option>
													<option value="42">42</option>
													<option value="43">43</option>
													<option value="44">44</option>
													<option value="45">45</option>
													<option value="46">46</option>
													<option value="47">47</option>
													<option value="48">48</option>
													<option value="49">49</option>
													<option value="50">50</option>
													<option value="51">51</option>
													<option value="52">52</option>
													<option value="53">53</option>
													<option value="54">54</option>
													<option value="55">55</option>
													<option value="56">56</option>
													<option value="57">57</option>
													<option value="58">58</option>
													<option value="59" selected="selected">59</option>
											</select>
											</span>
										</div>
										<div class="grid right">
											<a href="#none" class="btnNormal" id="cafeImageIcon">카페24샘플<em
												class="icoLink"></em></a> <a href="#none" class="btnNormal"
												id="myimageicon">직접추가하기</a>
										</div>
									</div>
									<div class="gridSet gBox gDouble">
										<div class="grid gFlex1">
											<ul
												class="mImgSelect typeIconThumb gDefault eImageIconList showImageIcon"
												style="display: none">
												<li id="imageIconTemplates" style="display: none;"
													icon_code="" icon_name=""><label
													class="gLabel eImageThumbList"> <input
														type="checkbox" class="fChk" name="imageicon[]" value=""
														data-uncheck="" /> <span class="border"><img
															src="5" alt="" /></span> <span
														class="button eImageIconDisableSelectArea">
															<button type="button"
																class="btnEdit eImageIconModifyButton" id="">
																<span class="icoEdit"></span>변경
															</button>
															<button type="button"
																class="btnDelete eImageIconDelButton">
																<span class="icoDelete"></span>삭제
															</button>
													</span>
												</label> <select
													class="fSelect full gSingle eImageIconArea eImageIconAreaY">
														<option value="T">상단</option>
														<option value="C">중간</option>
														<option value="B">하단</option>
												</select> <select
													class="fSelect full gSingle eImageIconArea eImageIconAreaX">
														<option value="L">왼쪽</option>
														<option value="C">가운데</option>
														<option value="R">오른쪽</option>
												</select></li>
											</ul>

											<!-- 참고 : 꾸미기 이미지 없을시 -->
											<div class="mImgSelect typeIconThumb gEmpty emptyImageIcon">
												<p class="empty">등록된 꾸미기 이미지가 없습니다.</p>
											</div>
										</div>
										<div class="gridWidth w210 gCellNarrow mPrdThumbDeco">
											<span class="txtStrong">미리보기</span>
											<p class="gSingle prdImg">
												<img
													src="//img.echosting.cafe24.com/ec/product/img_thumb_sample.jpg"
													alt="" width="185" height="208" alt="" /> <span
													id="eImageIconPreview"> </span>
											</p>
										</div>

									</div>
									<ul class="txtInfo">
										<li>꾸미기 이미지는 20개까지 추가 할 수 있으며, 2개까지 동시 설정할 수 있습니다.</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">상품 아이콘 표시하기
									<div class="cTip eSmartMode" code="PT.PE.330"></div>
								</th>
								<td>
									<div class="gridSet middle">
										<div class="grid left">
											<label class="fLabel">항상표시 <input type="checkbox"
												class="fCheck" id="showIconChk"
												name="use_icon_exposure_term" value="T" data-uncheck="F"
												checked=checked /> <span class="checkMark"></span>
											</label> <span id="ec-product-register-icon-period-area"> <input
												type="text" id="pr_start_date_icon" readonly
												name="start_date"
												class="fText gDate ec-product-register-icon-period"
												value="2019-10-04" /> <a href="#none"
												class="btnIcon icoCal startDateIcon"><span>달력보기</span></a> <select
												class="fSelect ec-product-register-icon-period"
												name="startHour">
													<option value="00">00</option>
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
											</select> <select class="fSelect ec-product-register-icon-period"
												name="startMin">
													<option value="00">00</option>
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
													<option value="24">24</option>
													<option value="25">25</option>
													<option value="26">26</option>
													<option value="27">27</option>
													<option value="28">28</option>
													<option value="29">29</option>
													<option value="30">30</option>
													<option value="31">31</option>
													<option value="32">32</option>
													<option value="33">33</option>
													<option value="34">34</option>
													<option value="35">35</option>
													<option value="36">36</option>
													<option value="37">37</option>
													<option value="38">38</option>
													<option value="39">39</option>
													<option value="40">40</option>
													<option value="41">41</option>
													<option value="42">42</option>
													<option value="43">43</option>
													<option value="44">44</option>
													<option value="45">45</option>
													<option value="46">46</option>
													<option value="47">47</option>
													<option value="48">48</option>
													<option value="49">49</option>
													<option value="50">50</option>
													<option value="51">51</option>
													<option value="52">52</option>
													<option value="53">53</option>
													<option value="54">54</option>
													<option value="55">55</option>
													<option value="56">56</option>
													<option value="57">57</option>
													<option value="58">58</option>
													<option value="59">59</option>
											</select> ~ <input type="text" id="pr_end_date_icon" readonly
												name="end_date"
												class="fText gDate ec-product-register-icon-period"
												value="2019-10-04" /> <a href="javascript:;" id="end_date"
												class="btnIcon icoCal endDateIcon"><span>달력보기</span></a> <select
												class="fSelect ec-product-register-icon-period"
												name="endHour">
													<option value="00">00</option>
													<option value="01" selected='selected'>01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
											</select> <select class="fSelect ec-product-register-icon-period"
												name="endMin">
													<option value="00">00</option>
													<option value="01">01</option>
													<option value="02">02</option>
													<option value="03">03</option>
													<option value="04">04</option>
													<option value="05">05</option>
													<option value="06">06</option>
													<option value="07">07</option>
													<option value="08">08</option>
													<option value="09">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
													<option value="24">24</option>
													<option value="25">25</option>
													<option value="26">26</option>
													<option value="27">27</option>
													<option value="28">28</option>
													<option value="29">29</option>
													<option value="30">30</option>
													<option value="31">31</option>
													<option value="32">32</option>
													<option value="33">33</option>
													<option value="34">34</option>
													<option value="35">35</option>
													<option value="36">36</option>
													<option value="37">37</option>
													<option value="38">38</option>
													<option value="39">39</option>
													<option value="40">40</option>
													<option value="41">41</option>
													<option value="42">42</option>
													<option value="43">43</option>
													<option value="44">44</option>
													<option value="45">45</option>
													<option value="46">46</option>
													<option value="47">47</option>
													<option value="48">48</option>
													<option value="49">49</option>
													<option value="50">50</option>
													<option value="51">51</option>
													<option value="52">52</option>
													<option value="53">53</option>
													<option value="54">54</option>
													<option value="55">55</option>
													<option value="56">56</option>
													<option value="57">57</option>
													<option value="58">58</option>
													<option value="59">59</option>
											</select>
											</span>
										</div>
										<div class="grid right">
											<a href="#none" class="btnNormal" id="cafeicon">카페24샘플<em
												class="icoLink"></em></a> <a href="#none" class="btnNormal"
												id="myicon">직접추가하기</a>
										</div>
									</div>
									<div class="mBox typeBorder" id="ec-product-register-icon-list">
										<input type="hidden" name="sort_order" class="eIconSortOrder"
											value="" />
										<ul class="mImgSelect typeIconList eImgSort" id="iconList">
											<li id="iconTemplates" style="display: none;" icon_name="">
												<label class="gLabel"> <input type="checkbox"
													class="fChk" name="icon[]" code="" value="" data-uncheck="" />
													<span class="border"><img
														class="ec-product-register-icon-image-tag" src="" alt="" /></span>
													<span class="button">
														<button type="button" class="btnEdit eIconImageModify"
															style="">
															<span class="icoEdit"></span>변경
														</button>
														<button type="button" class="btnDelete eIconImageDelete"
															id="">
															<span class="icoDelete"></span>삭제
														</button>
												</span>
											</label>
											</li>

										</ul>

										<div class="mImgSelect typeIconList gEmpty" id="emptyIcon">
											<p class="empty">등록된 아이콘이 없습니다.</p>
										</div>

									</div>
									<ul class="txtInfo">
										<li>마우스를 드래그하여 순서를 변경할 수 있습니다.</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="mToggleBar eToggle ec-product-register-toggle selected ">
				<h2>상세이용안내</h2>
				<div class="ctrl">
					<label class="gLabel" style="display: none"><input
						type="checkbox" name="aToggleValue[info]" value="T"
						data-uncheck="F" /> 항상열기</label> <span><button type="button">
							<em>열기</em>
						</button></span>
				</div>
			</div>

			<div id="footer">
				<a href="#none" class="btnSubmit" id="ec-product-register-submit">상품수정</a>
				<a href="#none" class="btnEm " id="eProductPreview">미리보기</a>
			</div>

			<form id="ec-product-register-image-upload-form"
				enctype="multipart/form-data"
				target="ec-product-register-image-upload-frame" method="post"
				action="/exec/admin/shop1/Product/ProductImageUpload">
				<input type="hidden" name="img_type" id="sImgType" value="">
				<input type="hidden" name="iframe" value="T"> <input
					type="hidden" name="uploadMode" value="mode_detail"> <input
					type="file" id="ec-product-register-image-upload" name="file"
					style="display: none;">
			</form>
			<form id="eAdminSingleIconUpload" enctype="multipart/form-data"
				target="ec-product-register-image-upload-frame" method="post"
				action="/exec/admin/shop1/Product/ProductIconUpload">
				<input type="hidden" name="type" value="custom"> <input
					type="hidden" name="icon_type" value="I"> <input
					type="file" id="iconFiles" name="file" multiple=""
					style="display: none;">
			</form>

			<form id="eAdminSingleIconModify" enctype="multipart/form-data"
				target="ec-product-register-image-upload-frame" method="post"
				action="/exec/admin/shop1/Product/ProductIconUpload">
				<input type="hidden" name="type" value="custom_image"> <input
					type="hidden" name="icon_type" value="S"> <input
					type="hidden" name="mode" value="modify"> <input
					type="hidden" name="icon_code" value=""> <input
					type="hidden" name="icon_name" value=""> <input type="file"
					id="modifyFile" name="file" style='display: none;'>
			</form>

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

	<script type="text/javascript"
		src="/ind-script/optimizer.php?filename=tZWxUsMwDIYfoFl5Dl85BvYuLCzcwe7YiqPWtoxspy1Pj0sD10KhDU0uQxJL3y_9js4RLTkQ81sWDUsHa-KVYIiUWYFYRoHze18t4434Ky9jkGollq8ZeNvf5tVduY7IwGQKfKQfA6NPzflEqR164WWHRiYkLxz4PJNq93wp_QA2LEjD6XwZgngsUfF0ACpy7rcCFmvxvLd-iCwyM3i1FbGlMCv-FFzBq_5t1hA7ma7tZCyZnNAOnItgs0EfRSctapmI-0D1tXC1IGwSeB1_CheFQD7CdBXaMlswoYNWem2nLNABY7OdTr9Bm0bo35KSFsSKBo3wy56Hb21BlYhswnD-BAGNu_KBoUNYX5xfXMNHGGI8D5U1nVUqp45v0GT-77xm_DSasVI0js4atYE0hpKjHEdpKRInWdth56vM5cNAxLdhWJ3rXaXyHxmERbCgUk2bwWQJO4zDmkQnDZwy97_91SyN6Tf4HQ&type=js&k=22113a66c8b39920c550f46c974506fbdd8a6d56&t=1566930464"></script>
	<script type="text/javascript"
		src="/ind-script/optimizer.php?filename=pZTbbsMgDIZfILd7DrS9wbRpd5OmTdWuCTipU8DMQA9vP7KlTSu1UgNXGIv_kw_YYk0WxOMTi46lhR3xRjAESqxAJPRSbcTwk4APwpvUowvZO3mahI1m8l62BpohPIgTzDP1mScMtmL1T_k8UocgXtYUwAn1d5Qrnwe5v1TfnYSSBpyWfEwli5ujb1FAHbG9LpDeiw8mnVS8UPjJBxpbisu0igyxWqOfrSqAwbA4AmvJlWU81krAPuYqC4xgM6tFBxUwtLIHVFUBlcvnXzi9uo15Jw1XGdPZtDKgWvTzvr7fVt6Q1LNVrc_DkJaN8uvBycgAZzvBU8CI5Mo4ejIqagn7HELiGkTIuyCU7pZxsjyqDbCD3fm1IqBxXsp-6VYa1DISzxb52_25KxoNBrdju8sRVrrUSRVzn6rqoqoSQddRhZyhzxv0VgJ8pjzVPj_9BQ&type=js&k=fced050bc25761d67404884ca2c579bd18b49513&t=1569349272"></script>
	<script type="text/javascript">
var SHOP_CURRENCY_INFO = {"1":{"aShopCurrencyInfo":{"currency_code":"KRW","currency_no":"410","currency_symbol":"\uffe6","currency_name":"South Korean won","currency_desc":"\uffe6 \uc6d0 (\ud55c\uad6d)","decimal_place":0,"round_method_type":"F"},"aShopSubCurrencyInfo":null,"aBaseCurrencyInfo":{"currency_code":"KRW","currency_no":"410","currency_symbol":"\uffe6","currency_name":"South Korean won","currency_desc":"\uffe6 \uc6d0 (\ud55c\uad6d)","decimal_place":0,"round_method_type":"F"},"fExchangeRate":1,"fExchangeSubRate":null,"aFrontCurrencyFormat":{"head":"","tail":"\uc6d0"},"aFrontSubCurrencyFormat":{"head":"","tail":""}}};
$(document).ready(function(){
FwValidator.bind("ec-influencer-product-register", false);
});
$(document).ready(function(){
EC_MODE_INPUT_NULL_VALID.initialize("ec-influencer-product-register");
});
var EC_GLOBAL_DATETIME = (function() {
var oConstants = {"STANDARD_DATE_REGEX":"\/([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))\/","IN_ZONE":"inZone","OUT_ZONE":"outZone","IN_FORMAT":"inFormat","OUT_FORMAT":"outFormat","IN_DATE_FORMAT":"inDateFormat","IN_TIME_FORMAT":"inTimeFormat","OUT_DATE_FORMAT":"outDateFormat","OUT_TIME_FORMAT":"outTimeFormat","IN_FORMAT_DATE_ONLY":1,"IN_FORMAT_TIME_ONLY":2,"IN_FORMAT_ALL":3,"OUT_FORMAT_DATE_ONLY":1,"OUT_FORMAT_TIME_ONLY":2,"OUT_FORMAT_ALL":3,"DATE_ONLY":"YYYY-MM-DD","TIME_ONLY":"HH:mm:ss","FULL_TIME":"YYYY-MM-DD HH:mm:ss","ISO_8601":"YYYY-MM-DD[T]HH:mm:ssZ","YEAR_ONLY":"YYYY","MONTH_ONLY":"MM","DAY_ONLY":"DD","WEEK_ONLY":"e","TIME_H_I_ONLY":"HH:mm","TIME_HOUR_ONLY":"HH","TIME_MINUTE_ONLY":"mm","MICRO_SECOND_ONLY":"u","SEOUL":"Asia\/Seoul","TOKYO":"Asia\/Tokyo","SHANGHAI":"Asia\/Shanghai","TAIPEI":"Asia\/Taipei","HANOI":"Asia\/Bangkok","LOS_ANGELES":"America\/Los_Angeles","LISBON":"Europe\/Lisbon","MADRID":"Europe\/Madrid","UTC":"Etc\/UTC","MAX_DATETIME":"9999-12-31 23:59:59"};
var oOptions = {"inZone":"Asia\/Seoul","inFormat":"YYYY-MM-DD HH:mm:ss","inDateFormat":"YYYY-MM-DD","inTimeFormat":"HH:mm:ss","outZone":"Asia\/Seoul","outFormat":"YYYY-MM-DD HH:mm:ss","outDateFormat":"YYYY-MM-DD","outTimeFormat":"HH:mm:ss"};
var oPolicies = {"shop":{"outZone":"Asia\/Seoul","outFormat":"YYYY-MM-DD HH:mm:ss","outDateFormat":"YYYY-MM-DD","outTimeFormat":"HH:mm:ss"}};
var sOverrideTimezone = '';
var sMomentNamespace = 'moment';
var fMomentLoaded = function() {
var bMomentLoaded = !!window[sMomentNamespace];
var bMomentTZLoaded = false;
if (bMomentLoaded) {
bMomentTZLoaded = !!window[sMomentNamespace].tz;
}
return bMomentLoaded && bMomentTZLoaded;
};
var fMomentWrapper = function() {
return window[sMomentNamespace];
};
var fShallowMerge = function(oTarget, oSource) {
oSource = oSource || {};
for (var sKey in oSource) {
if (oSource.hasOwnProperty(sKey)) {
oTarget[sKey] = oSource[sKey];
}
}
return oTarget;
};
var getFormatFromFlag = function(oOptions, iFlag, bOpposite) {
if (bOpposite) {
switch (iFlag) {
case 1:
return oOptions[oConstants.IN_DATE_FORMAT];
case 2:
return oOptions[oConstants.IN_TIME_FORMAT];
default:
return oOptions[oConstants.IN_FORMAT];    
}
}
switch (iFlag) {
case 1:
return oOptions[oConstants.OUT_DATE_FORMAT];
case 2:
return oOptions[oConstants.OUT_TIME_FORMAT];
default:
return oOptions[oConstants.OUT_FORMAT];
}
};
return {
const: oConstants,
init: function(fCallback) {
if (fMomentLoaded()) {
if (typeof fCallback === 'function') {
fCallback();
}
return;
}
var oScript = document.createElement('script');
oScript.type = 'text/javascript';
oScript.async = true;
oScript.src = '/ind-script/moment.php?convert=F';
oScript.onload = oScript.onreadystatechange = function () {
fMomentWrapper().defaultFormat = oOptions[oConstants.OUT_FORMAT];
fMomentWrapper().tz.setDefault(oOptions[oConstants.IN_ZONE]);
if (typeof fCallback === 'function') {
fCallback();
}
};
var oFirstScript = document.getElementsByTagName('script')[0];
oFirstScript.parentNode.insertBefore(oScript, oFirstScript);
},
initPromise: function() {
if (!window.Promise) {
return;
}
return new Promise(function(resolve) {
this.init(resolve);
}.bind(this));
},
isLoaded: function() {
return fMomentLoaded();
},
setOptions: function(oNewOptions) {
if (typeof oNewOptions === 'object') {
for (var sKey in oNewOptions) {
if (oNewOptions.hasOwnProperty(sKey) && oOptions.hasOwnProperty(sKey)) {
oOptions[sKey] = oNewOptions[sKey];
}
}
}
return this;
},
now: function(mOptions, iFlag) {
if (fMomentLoaded() === false) {
return Math.floor(new Date().getTime() / 1000);
}
var oFormatOptions = this.getOptions(mOptions);
return fMomentWrapper()()
.tz(oFormatOptions.outZone)
.format(getFormatFromFlag(oFormatOptions, iFlag));
},
format: function(sTime, mOptions, iFlag) {
if (fMomentLoaded() === false) {
return sTime;
}
var oFormatOptions = this.getOptions(mOptions);
return fMomentWrapper()
.tz(sTime, oFormatOptions.inZone)
.tz(oFormatOptions.outZone)
.format(getFormatFromFlag(oFormatOptions, iFlag));
},
parse: function(sTime, mOptions) {
if (fMomentLoaded() === false) {
return sTime;
}
var oParseOptions = this.getOptions(mOptions);
return fMomentWrapper().tz((sTime || new Date()), oParseOptions.inZone).tz(oParseOptions.outZone);
},
getOptions: function(mOptions, iFlag) {
mOptions = mOptions || {};
var oMergedOptions = fShallowMerge({}, oOptions);
if (typeof mOptions === 'string' && oPolicies[mOptions]) {
oMergedOptions = fShallowMerge(oMergedOptions, oPolicies[mOptions]);
} else if (typeof mOptions === 'object') {
oMergedOptions = fShallowMerge(oMergedOptions, mOptions);
}
if (sOverrideTimezone) {
if ((typeof mOptions === 'string' && mOptions === 'shop') || (typeof mOptions === 'object' && !mOptions[oConstants.OUT_ZONE])) {
oMergedOptions[oConstants.OUT_ZONE] = sOverrideTimezone;
}
}
return oMergedOptions;
},
getRevertOptions: function(mOptions) {
var oCurrentOptions = this.getOptions(mOptions);
var oMergedOptions = fShallowMerge({}, oOptions);
oMergedOptions[oConstants.IN_ZONE] = oCurrentOptions[oConstants.OUT_ZONE];
oMergedOptions[oConstants.IN_FORMAT] = oCurrentOptions[oConstants.OUT_FORMAT];
oMergedOptions[oConstants.IN_DATE_FORMAT] = oCurrentOptions[oConstants.OUT_DATE_FORMAT];
oMergedOptions[oConstants.IN_TIME_FORMAT] = oCurrentOptions[oConstants.OUT_TIME_FORMAT];
return oMergedOptions;
},
today: function(sTime, mOptions, iFlag) {
if (fMomentLoaded() === false) {
throw new Error('MomentJS didnt initialize');
}
mOptions = mOptions || 'shop';
var oRevertOptions = this.getRevertOptions(mOptions);
var oToday;
if (!sTime || sTime === 'now') {
oToday = this.parse('', mOptions);
} else {
iFlag = iFlag || oConstants.IN_FORMAT_ALL || 3;
oToday = fMomentWrapper().tz(sTime, getFormatFromFlag(oRevertOptions, iFlag, true), oRevertOptions[oConstants.IN_ZONE]);
if (oToday.isValid() === false) {
var oStandardDateRegex = new RegExp(oConstants.STANDARD_DATE_REGEX.replace(/\//g, ''));
if (oStandardDateRegex.test(sTime) === true) {
oToday = fMomentWrapper().tz(sTime, oRevertOptions[oConstants.IN_ZONE]);
} else {
oToday = fMomentWrapper()();
}
}
}
var oStartOfDay = oToday.clone().startOf('day');
var oEndOfDay = oToday.clone().endOf('day');
var sStartOfDayInSeoul = oStartOfDay.tz(oConstants.SEOUL).format(oConstants.FULL_TIME);
var sEndOfDayInSeoul = oEndOfDay.tz(oConstants.SEOUL).format(oConstants.FULL_TIME);
return [sStartOfDayInSeoul, sEndOfDayInSeoul];
},
parseFromFormat: function(sTime, mOptions, iFlag) {
if (fMomentLoaded() === false) {
return sTime;
}
mOptions = mOptions || 'shop';
iFlag = iFlag || oConstants.IN_FORMAT_ALL || 3;
var oRevertOptions = {};
if (typeof mOptions === 'string') {
oRevertOptions = this.getRevertOptions(mOptions);
} else {
oRevertOptions = this.getOptions(mOptions);
}
return fMomentWrapper()(sTime, getFormatFromFlag(oRevertOptions, iFlag, true));
}
};
})();
var EC_ADMIN_JS_CONFIG_MODE = {"iProductNo":"12","bIsModify":true,"sLanguage":"ko_KR","sCurrency":"\uc6d0","iImageIconUploadLimit":20,"iAddImageUploadLimit":20,"iIconUploadLimit":100,"aOptionInfo":{"Option":[],"ColorInfo":[]},"sDefaultOptionStyle":"{\"1\":\"S\"}","is_individual_shipping":"T","aGradeFee":{"delivery_fee_type":null,"grade":null},"isRequiredHsCode":false,"sOriginPlaceNum":1798,"bMarketAccount":false,"bMarketMatch":false};
</script>
</body>
</html>


