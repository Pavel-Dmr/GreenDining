<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" import="java.util.Date" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
  <style>
    /* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
}
/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
  </style>
  <script>
   var currentPage = ${salePage.number};  // 현재 페이지 번호 초기화
   var currentSize = ${salePage.size};  // 현재 페이지 사이즈 초기화


    function filterControl(ele,name,value) {
      $("#search_form_02 input[name=" + name + "]").val(value);

      
      if(!$(ele).is(":checked") && name != "star")
      {
        $("#search_form_02 input[name=" + name + "]").val('');
      }
      $("#search_form_02").submit();
    }

    function orderByControl(sort,direction)
    {
      $("#search_form_02 input[name=sort]").val(sort);
      $("#search_form_02 input[name=direction]").val(direction);
      $("#search_form_02").submit();      
    }
    function priceByControl()
    {
      var minPrice = $("#minPrice").val();
      var maxPrice = $("#maxPrice").val();

      $("#search_form_02 input[name=minPrice]").val(minPrice);
      $("#search_form_02 input[name=maxPrice]").val(maxPrice);

      $("#search_form_02").submit();
    }
  
    function resetByControl()
    {
      $("#search_form_02 input").each(function()
      {
        $(this).val("");
      });

      $("#search_form_02").submit();
    }
    function changeSize(size) {
      
      window.location.href = "?page=0" + "&size=" + size;
    }

    function changePage(page) {
      currentPage = page;  // 페이지 이동할 때마다 페이지 번호 업데이트
      window.location.href = "?page=" + currentPage + "&size=" + currentSize;
    }
  </script>
  </head>
  <body>
  <div id="searchF">
    <!-- ? 왼쪽 검색 옵션 필터 -->
    <section id="filter" class="position-relative d-flex flex-column float-start w-200px border border-1">
      <h5 class="mt-4 ms-3">필터</h5>
      <form action="/np/search" id="search_form_02" method="get">
        <input type="hidden" name="delivery" value="${delivery}">
        <input type="hidden" name="category" value="${category}">
        <input type="hidden" name="region" value="${region}">
        <input type="hidden" name="keyword" value="${keyword}">
        <input type="hidden" name="sort" value="${sort}">
        <input type="hidden" name="direction" value="${direction}">
        <input type="hidden" name="star" value="${star}">
        <input type="hidden" name="minPrice" value="${minPrice}">
        <input type="hidden" name="maxPrice" value="${maxPrice}">
      </form>
      <!-- ! 체크 항목 있으면 전체 해제 옵션 보이게 -->
      <div id="checked_option" class="fs-14px position-absolute end-0 mt-4 me-2">
        <button class="bg-white" onclick="resetByControl()"><span class="fs-16px material-symbols-outlined align-middle"> restart_alt </span>전체해제</button>
      </div>
      <!-- ! 배송 옵션 -->
      <div id="delivery_option" class="d-flex flex-column mt-2 w-100">
        <label><input type="checkbox"  value="오늘출발" /> 오늘출발(미구현)</label>
        <label><input type="checkbox"  value="무료배송" onchange="filterControl(this,'delivery','free')" ${delivery == 'free' ? 'checked' : ''} /> 무료배송</label>
      </div>
      <!-- ! 카테고리 옵션 -->
      <div id="category_option" class="d-flex flex-column w-100">
        <h6 class="fw-bold">카테고리</h6>
        <label><input type="checkbox" value="10000" onchange="filterControl(this,'category',10000)" ${category == 10000 ? 'checked' : ''} /> 과일/견과</label>
        <label><input type="checkbox" value="20000" onchange="filterControl(this,'category',20000)" ${category == 20000 ? 'checked' : ''}/> 채소</label>
        <label><input type="checkbox" value="30000" onchange="filterControl(this,'category',30000)" ${category == 30000 ? 'checked' : ''}/> 쌀/잡곡</label>
        <label><input type="checkbox" value="40000" onchange="filterControl(this,'category',40000)" ${category == 40000 ? 'checked' : ''} /> 축산물</label>
        <label><input type="checkbox" value="50000" onchange="filterControl(this,'category',50000)" ${category == 50000 ? 'checked' : ''}/> 수산물</label>
        <label><input type="checkbox" value="60000" onchange="filterControl(this,'category',60000)" ${category == 60000 ? 'checked' : ''}/> 가공식품</label>
      </div>
      
      <!-- ! 브랜드 옵션 -->
      <div id="brand_option" class="d-flex flex-column w-100">
        <h6 class="fw-bold">지역</h6>
        <label><input type="checkbox"  value="1000" onchange="filterControl(this,'region',1000)" ${region == 1000 ? 'checked' : ''} /> 수도권</label>
        <label><input type="checkbox"  value="2000" onchange="filterControl(this,'region',2000)" ${region == 2000 ? 'checked' : ''} /> 강원도</label>
        <label><input type="checkbox"  value="3000" onchange="filterControl(this,'region',3000)" ${region == 3000 ? 'checked' : ''} /> 충청도</label>
        <label><input type="checkbox"  value="4000" onchange="filterControl(this,'region',4000)" ${region == 4000 ? 'checked' : ''} /> 경상도</label>
        <label><input type="checkbox"  value="5000" onchange="filterControl(this,'region',5000)" ${region == 5000 ? 'checked' : ''} /> 전라도</label>
        <label><input type="checkbox"  value="6000" onchange="filterControl(this,'region',6000)" ${region == 6000 ? 'checked' : ''} /> 제주도</label>
      </div>
      
      <!-- ! 별점 옵션 -->
      <div id="star_option" class="d-flex flex-column w-100">
        <h6 class="fw-bold">별점</h6>
        <label onclick="filterControl(this,'star',0)"> 별점 전체</label>
        <label onclick="filterControl(this,'star',4)" class="w-100">
          
          <div class="float-start">
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #ff0000"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #ff0000"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #ff0000"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #ff0000"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #cccccc"></i>
           이상
          </div>
        </label>
        <label onclick="filterControl(this,'star',3)">
          <div class="float-start">
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #ff0000"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #ff0000"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #ff0000"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #cccccc"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #cccccc"></i>
           이상
          </div>
        </label>
        <label onclick="filterControl(this,'star',2)">
           <div class="float-start">
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #ff0000"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #ff0000"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #cccccc"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #cccccc"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #cccccc"></i>
           이상

          </div>
        </label>
        <label onclick="filterControl(this,'star',1)">
          <div class="float-start">
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #ff0000"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #cccccc"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #cccccc"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #cccccc"></i>
           <i class="fa-solid fa-star fs-10px mt-0" style="color: #cccccc"></i>
           이상
          </div>
        </label>
      </div>
      <!-- ! 가격 옵션 -->
      <div id="price_option">
        <h6 class="fw-bold">가격</h6>
        <div id="price_range" class="fs-10px">
          <span> <input type="number" class="" min="0" maxlength="10" id="minPrice" value="${minPrice}" /> ~ </span>
          <span> <input type="number" class="" min="0" maxlength="10" id="maxPrice" value="${maxPrice}" />원 </span>
          <span><button class="bg-white w-30px h-20px rounded-2" onclick="priceByControl()">검색</button></span>
        </div>
      </div>
    </section>
    <section id="search_items" class="float-start border border-1">
      <!-- ! 상단 나열 옵션 -->
      <div id="product_option" class="ms-4 mt-4">
        <h5>'${keyword}'에 대한 검색 결과</h5>
        <div id="product_option_list" class="bg-secondary">
          
          <label for="" class="ms-3">랭킹순(미구현)</label>
          <label for=""  onclick="orderByControl('price','asc')">낮은가격순</label>
          <label for=""  onclick="orderByControl('price','desc')">높은가격순</label>
          <label for=""  onclick="orderByControl('total_rate','desc')">판매량순</label>
          <label for=""  onclick="orderByControl('created_at','desc')">최신순</label>
           <div class="size-selector position-relative w-100px float-end">
              <div class="current-size">${salePage.size}개씩 보기</div>
              <div class="btn-group-vertical visually-hidden size-btn_box position-absolute fs-12px z-3" role="group" aria-label="Vertical button group">
                <button type="button" onclick="changeSize(12)" class="btn btn-secondary z-3 fs-12px">12개씩 보기</button>
                <button type="button" onclick="changeSize(16)" class="btn btn-secondary z-3 fs-12px">16개씩 보기</button>
                <button type="button" onclick="changeSize(20)" class="btn btn-secondary z-3 fs-12px">20개씩 보기</button>
                <button type="button" onclick="changeSize(24)" class="btn btn-secondary z-3 fs-12px">24개씩 보기</button>
              </div>
            </div>
        </div>
      </div>

      <!-- ! 상품 카드 목록 -->
      <div id="product_list" class="ms-2 me-2 mb-5 mt-5 row column-gap-0 row-cols-lg-4 row-cols-md-3 row-cols-sm-2 h-100 row-gap-5">
        <c:choose>
          <c:when test="${fn:length(salePage.content) > 0}">
            <c:forEach var="sale" items="${salePage.content}" varStatus="i">
              <a href="/item/${sale.id}">
              <div class="col w-400px h-450px p-0">
                <div class="card h-100 overflow-hidden">
                 <div class="embed-responsive">
                    <img src="${sale.image_path}" class="card-img-top" alt="tree">
                  </div>
                  <div class="card-body m-0 ms-1">
                    <h5 class="card-title">
                      <c:if test="${sale.discount != 0}">
                        <span id="percent" class="text-danger me-2">${sale.discount}%</span>
                      </c:if>
                      <c:set var="discountedPrice" value="${sale.min_price*(1-sale.discount/100)}" />
                      <fmt:formatNumber value="${discountedPrice}" pattern="#,##0" />원
                    </h5>
                    <p class="card-text fw-lighter fs-14px float-start">
                      <div class="fs-13px" id="sale_title_div">
                        ${sale.title}
                      </div>
                      
                      <i class="fa-solid fa-star fs-10px mt-0" style="color: #ff0000"></i>
                      <span id="star_score" class="fs-11px mt-0">${sale.review_average_star}</span>
                      <span id="review_count" class="fs-12px text-black-50 mt-0">• 리뷰${sale.review_count}</span>
                      <br>
                      <span id="total_rate" class="text-black-50 mt-2 fs-12px">${sale.total_rate}개 판매</span>
                      <br>
                      <c:if test="${sale.delivery_fee == 0}">
                        <span id="total_rate" class="text-primary mt-2 fs-12px">무료배송</span>
                      </c:if>
                    </p>
                  </div>
                  <div class="card-footer border-0 bg-transparent ps-1 pb-0 pe-0 w-100">
                    <small class="position-absolute bottom-0 mb-2 ms-2 fs-12px align-bottom">${sale.store_name}</small>
                  </div>

                </div>
              </div>
              </a>
            </c:forEach>
            <c:forEach begin="${fn:length(salePage.content) % 5}" end="5">
              <div class="col" h-460px></div>
            </c:forEach>
            
          </c:when>
          <c:when test="${fn:length(salePage.content) == 0}">
            <h6>검색한 상품이 없습니다.</h6>
          </c:when>
        </c:choose>
      </div>
      <div class="pagination justify-content-center">
	
		
		<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
			 <div class="btn-group me-2" role="group" aria-label="First group">
				<c:forEach begin="${Math.floor((salePage.number + 1) / 10) * 10}" end="${salePage.totalPages - 1}" step="1" var="page" varStatus="i">
					<c:choose>
						<c:when test="${page == salePage.number}">
							<button  type="button" class="current btn btn-primary">${page + 1}</button>
						</c:when>
						<c:otherwise>
							<button type="button" onClick="location.href='?page=${page}&size=${size}'" class="btn btn-secondary">${page + 1}</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
	</div></div>
    </section>
    <div class="clearfix"></div>
  </body>

</html>