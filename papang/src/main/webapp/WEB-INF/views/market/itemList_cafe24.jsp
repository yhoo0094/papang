<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 못하긋당ㅎ -->
<style>
body, code {
    font-size: 12px;
    font-family: "Apple SD Gothic Neo","맑은 고딕","malgun gothic",sans-serif;
    color: #000;
}
.dnd_module_cb512e5bb1ccf49be3df289bf203e4fc .productList {
    position: relative;
    width: 100%;
    padding: 20px 16px 0;
    box-sizing: border-box;
    background-color: #fff;
}
.dnd_module_cb512e5bb1ccf49be3df289bf203e4fc .sortingArea {
    position: relative;
    margin-bottom: 40px;
    padding: 0 64px 0 0;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.dnd_module_cb512e5bb1ccf49be3df289bf203e4fc .productList.typeThumb .prdList {
    display: flex;
    -webkit-flex-wrap: wrap;
    margin: 0 0 0 -10px;
}
.dnd_module_cb512e5bb1ccf49be3df289bf203e4fc .productList .prdList:after {
    content: '';
    display: block;
    clear: both;
}
.dnd_module_cb512e5bb1ccf49be3df289bf203e4fc .productList.typeThumb .prdList > li {
    float: left;
    flex-basis: 50%;
    width: 50%;
    box-sizing: border-box;
}
.dnd_module_cb512e5bb1ccf49be3df289bf203e4fc .productList li {
    vertical-align: top;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.dnd_module_cb512e5bb1ccf49be3df289bf203e4fc .productList.typeThumb .prdList > li > .inner {
    padding-left: 10px;
}
.dnd_module_cb512e5bb1ccf49be3df289bf203e4fc .productList .thumbnail {
    position: relative;
    overflow: hidden;
}
.dnd_module_cb512e5bb1ccf49be3df289bf203e4fc .productList .thumbnail a {
    display: block;
    position: relative;
    font-size: 0;
    background: #f6f6f8;
}
a {
    text-decoration: none;
    color: #000;
}
.dnd_module_cb512e5bb1ccf49be3df289bf203e4fc .productList .thumbnail a img {
    max-width: 100%;
    max-height: 100%;
    width: 100%;
    height: auto;
}
img, fieldset {
    border: 0;
    vertical-align: top;
}
.dnd_module_cb512e5bb1ccf49be3df289bf203e4fc .productList .description {
    min-height: 102px;
    padding: 7px 20px 20px 0;
    text-align: left;
    box-sizing: border-box;
    word-break: break-all;
}
.dnd_module_cb512e5bb1ccf49be3df289bf203e4fc .productList .description .name {
    display: -webkit-box;
    overflow: hidden;
    max-height: 36px;
    font-weight: normal;
    line-height: 18px;
    text-overflow: ellipsis;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}

</style>
	
<div class="dnd_module_cb512e5bb1ccf49be3df289bf203e4fc">
	<!-- MOMA COMPONENT ID 37 : BS_상품분류_일반상품-진열_v01 -->
	<!-- 쇼큐 있는 경우 -->
	<div id="shopQ">
		<div
			class="xans-element- xans-product xans-product-searchdata typeList xans-record-">
			<form class="searchField" id="ec-product-fixed-form"
				action="/product/search.html" method="get">
				<!-- 쇼큐 더보기 클릭 전 -->
				<div class="searchCondition shopQShow">
					<div
						class="xans-element- xans-product xans-product-fixedsearchfilterlist toggleArea selected xans-record-">
						<div class="title ec-product-searchdata-within">
							<h3>결과 내 검색</h3>
						</div>
						<div class="contents search searchForm">
							<div class="withinInput ">
								<div class="search">
									<input class="keyword"
										onkeyup="SEARCH_HASHTAG.getHashtag($(this), 'product', 'T');"
										autocomplete="off" value="" type="text">
									<button type="button" class="btnDelete">삭제</button>
									<button type="button" class="btnResearch">검색</button>
								</div>
								<div class="suggest">
									<ul></ul>
								</div>
							</div>
							<div class="priceInput displaynone"></div>
							<div class="slider displaynone"></div>
							<p class="value displaynone"></p>
						</div>
					</div>
				</div>
				<!-- //쇼큐 더보기 클릭 전 -->
			</form>
			<!-- 쇼큐 더보기 클릭 후 -->
			<div id="ec-product-fixed-form-filter"
				class="xans-element- xans-product xans-product-searchdata searchCondition xans-record-">
				<form class="searchCondition" id="ec-product-searchdata-form"
					name="" method="get">
					<input type="hidden" name="keyword"
						id="ec-product-searchdata-keyword_hidden"><input
						type="hidden" name="rel_keyword"
						id="ec-product-searchdata-relateKeyword" value="">
					<div class="header">
						<h2 class="title">상세검색</h2>
					</div>
					<div class="wrap">
						<div
							class="xans-element- xans-product xans-product-searchfilterlist toggleArea eToggle selected xans-record-">
							<div class="title ec-product-searchdata-within">
								<h3>결과 내 검색</h3>
							</div>
							<div class="contents search searchForm">
								<div class="withinInput ">
									<div class="search">
										<input class="keyword"
											onkeyup="SEARCH_HASHTAG.getHashtag($(this), 'product', 'T');"
											autocomplete="off" value="" type="text">
										<button type="button" class="btnDelete">삭제</button>
										<button type="button" class="btnResearch">검색</button>
									</div>
									<div class="suggest">
										<ul></ul>
									</div>
								</div>
								<div class="priceInput displaynone"></div>
								<div class="slider displaynone"></div>
								<p class="value displaynone"></p>
							</div>
							<button type="button"
								class="btnClear ec-product-searchdata-form-clear"
								filter_key_value="within">선택해제</button>
						</div>
					</div>
					<div class="moreTags ec-base-button gFixed">
						<div class="ec-base-button gColumn">
							<button type="button" class="btnEm ec-product-searchdata-reset">초기화</button>
							<button type="button" class="btnSubmit"
								id="ec-product-searchdata-submit">2건 결과보기</button>
							<span id="ec-product-searchdata-search-count"></span>
						</div>
					</div>
					<button type="button" class="btnClose" id="ec-product-filter-close">닫기</button>
				</form>
			</div>
			<!-- //쇼큐 더보기 클릭 후 -->
			<p class="moreTags">
				<button type="button" id="ec-product-searchdata-mobile-button"
					class="btnSearchdata ">필터 더보기</button>
			</p>
		</div>
	</div>
	<!-- //쇼큐 있는 경우 -->
	<div class="xans-element- xans-product xans-product-normalpackage ">
		<div
			class="xans-element- xans-product xans-product-listnormal productList typeThumb">
			<!--
            $count = 12
                ※ 상품진열갯수를 설정하는 변수입니다. 설정하지 않을 경우, 최대 200개의 상품이 진열 됩니다.
                ※ 진열된 상품이 많으면, 쇼핑몰에 부하가 발생할 수 있습니다.
            $basket_result = /product/add_basket.html
            $basket_option = /product/basket_option.html
        -->
			<div
				class="xans-element- xans-product xans-product-normalmenu sortingArea ">
				<div class="sort">
					<select id="selArray" name="selArray"
						class="xans-element- xans-product xans-product-orderby"><option
							value="">-정렬방식-</option>
						<option value="?cate_no=24&amp;sort_method=5#Product_ListMenu"
							class="xans-record-">신상품</option>
						<option value="?cate_no=24&amp;sort_method=1#Product_ListMenu"
							class="xans-record-">상품명</option>
						<option value="?cate_no=24&amp;sort_method=3#Product_ListMenu"
							class="xans-record-">낮은가격</option>
						<option value="?cate_no=24&amp;sort_method=4#Product_ListMenu"
							class="xans-record-">높은가격</option>
						<option value="?cate_no=24&amp;sort_method=2#Product_ListMenu"
							class="xans-record-">제조사</option>
						<option value="?cate_no=24&amp;sort_method=7#Product_ListMenu"
							class="xans-record-">사용후기</option>
					</select>
				</div>
				<div class="btnSorting eProductSort">
					<button type="button" class="bigView selected">확대보기</button>
					<button type="button" class="smallView">축소보기</button>
				</div>
			</div>
			<ul class="prdList">
				<li id="anchorBoxId_10" class="xans-record-">
					<div class="inner">
						<div class="thumbnail">
							<div class="prdImg">
								<a href="/product/샘플상품-2/10/category/24/display/1/"
									name="anchorBoxName_10"><img
									src="//img.echosting.cafe24.com/thumb/img_product_medium.gif"
									id="eListPrdImage10_1" alt="샘플상품 2"></a>
							</div>
						</div>
						<div class="description">
							<strong class="name"><a
								href="/product/샘플상품-2/10/category/24/display/1/" class=""><span
									class="title displaynone"><span
										style="font-size: 12px; color: #555555;">상품명</span> :</span> <span
									style="font-size: 12px; color: #555555;">샘플상품 2</span></a></strong>
							<ul class="xans-element- xans-product xans-product-listitem spec">
								<li class=" xans-record-"><strong class="title displaynone"><span
										style="font-size: 12px; color: #555555;">소비자가</span> :</strong> <span
									style="font-size: 12px; color: #555555; text-decoration: line-through;">10,000원</span></li>
								<li class=" xans-record-"><strong class="title displaynone"><span
										style="font-size: 12px; color: #008BCC; font-weight: bold;">판매가</span>
										:</strong> <span
									style="font-size: 12px; color: #008BCC; font-weight: bold;">10,000원</span><span
									id="span_product_tax_type_text" style=""> </span></li>
							</ul>
							<span class="icon"></span>
						</div>
					</div>
				</li>
				<li id="anchorBoxId_9" class="xans-record-">
					<div class="inner">
						<div class="thumbnail">
							<div class="prdImg">
								<a href="/product/샘플상품-1/9/category/24/display/1/"
									name="anchorBoxName_9"><img
									src="//img.echosting.cafe24.com/thumb/img_product_medium.gif"
									id="eListPrdImage9_1" alt="샘플상품 1"></a>
							</div>
						</div>
						<div class="description">
							<strong class="name"><a
								href="/product/샘플상품-1/9/category/24/display/1/" class=""><span
									class="title displaynone"><span
										style="font-size: 12px; color: #555555;">상품명</span> :</span> <span
									style="font-size: 12px; color: #555555;">샘플상품 1</span></a></strong>
							<ul class="xans-element- xans-product xans-product-listitem spec">
								<li class=" xans-record-"><strong class="title displaynone"><span
										style="font-size: 12px; color: #555555;">소비자가</span> :</strong> <span
									style="font-size: 12px; color: #555555; text-decoration: line-through;">5,000원</span></li>
								<li class=" xans-record-"><strong class="title displaynone"><span
										style="font-size: 12px; color: #008BCC; font-weight: bold;">판매가</span>
										:</strong> <span
									style="font-size: 12px; color: #008BCC; font-weight: bold;">5,000원</span><span
									id="span_product_tax_type_text" style=""> </span></li>
							</ul>
							<span class="icon"></span>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div
		class="xans-element- xans-product xans-product-normalpaging productPaginate typeList">
		<a href="#none" class="btnPrev">이전 페이지</a>
		<ol class="page">
			<li class="xans-record-"><a href="?page=1" class="this">1</a></li>
		</ol>
		<a href="#none" class="btnNext">다음 페이지</a>
	</div>
	<!-- //MOMA COMPONENT ID 37 : BS_상품분류_일반상품-진열_v01 -->
</div>