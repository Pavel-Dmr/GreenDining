<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/user/MyPage.css" />
<script src="/jquery/jquery-3.7.0.min.js"></script>
<script src="/js/smartstore/ProductPrice.js"></script>
<title>mypage</title>
<div class="my_page_box">
	<div class="my_page_aside_box">
		<div class="my_pg_aside_top">
			<h1>MY</h1>
		</div>
	<div id="m_aside">
		<strong>MY 쇼핑</strong>
      	 <ul>
      	 	<a href="/user/my-page"><li>주문목록/배송조회</li></a>
      	 	<a><li>취소/반품/교환/환불</li></a>
      	 	<a><li>정기배송 관리</li></a>
      	 	<a><li>영수증 조회/출력</li></a>
       	</ul>
       </div>
       <div id="m_aside">
       <strong>MY 혜택</strong>
      	 <ul>
      	 	<a><li>할인쿠폰</li></a>
      	 	<a><li>캐시/기프트카드</li></a>
       	</ul>
       </div>
       <div id="m_aside">
       <strong>MY 활동</strong>
      	 <ul>
      	 	<a><li>문의하기</li></a>
      	 	<a><li>문의내역 확인</li></a>
      	 	<a><li>리뷰관리</li></a>
      	 	<a><li>찜 리스트</li></a>
       	</ul>
       </div>
       <div id="m_aside">
       <strong>MY 정보</strong>
      	 <ul>
      	 	<a href="/user/my-page/modify-check-form"><li>개인정보확인/수정</li></a>
      	 	<a><li>결제수단관리</li></a>
      	 	<a><li>배송지 관리</li></a>
       	</ul>
	</div>
	</div>
	<div class="my_main_box">
		<div class="m_main_top">
			<div class="m_top1">
				<p>미사용 티켓</p>
				<a href=""><span class="top1_num">0</span><span style="font-weight: 100; color: white;">장</span></a>
			</div>
			<div class="m_top1">
				<p>배송중</p>
				<a href=""><span class="top1_num">${inDeliveryCount}</span><span style="font-weight: 100; color: white;">개</span></a>
			</div>
			<div class="m_top1">
				<p>할인 쿠폰</p>
				<a href=""><span class="top1_num">0</span><span style="font-weight: 100; color: white;">장</span></a>
			</div>
			<div class="m_top2_box">
				<div class="m_top2">
					<div class="m_top2_it">
						쿠폰
					</div>
					<div>
						<a><span>0</span>원</a>
					</div>
				</div>
				<div class="m_top2">
					<div class="m_top2_it">
						캐시
					</div>
					<div>
						<a><span>0</span>원</a>
					</div>
				</div>			
			</div>
		</div>
		<div class="m_main">
			<div class="m_main_search">
			<h3>주문배송</h3>
			<input class="w-500px mt-3 mb-3" type="text" placeholder="주문한 상품을 검색할 수 있어요!(미완성)"><br>
			</div>
		</div>
		<div id="my_order_box">
			<c:choose>
				<c:when test="${fn:length(ordersPage.content)>0 }">
				 <c:forEach var="order" items="${ordersPage.content}" >
					<div class="my_order">
						    <div class="my_order_title">
						        <div class="order_day">
						       
						        	<fmt:parseDate var="parsedDate" value="${order.created_at}" pattern="yyyy-MM-dd HH:mm:ss"/>
						            <fmt:formatDate pattern="yyyy.MM.dd" value="${parsedDate}" /> 주문
						        </div>
						        <div class="order_d">
						            <a href="/user/my-page/order/${order.id}">주문 상세 보기</a>
						        </div>
						    </div>
						    <c:forEach var="orderItem" items="${orderItemList}">
						    <c:if test="${order.id == orderItem.order_id}">
							    <div class="order_body">
							        <div class="or_body_left">
							            <div class="or_body_title">
							                <div class="or_progress">
							                    ${order.status}
							                </div>
							                <div class="or_day">
							                    3/25(월) 도착
							                </div>
							            </div>
							            <div class="or_it_box">
							                <div class="or_img_box">
							                	<img alt="" class="w-80px h-80px" src="${orderItem.image_path}">
							                </div>
							                <div class="or_it">
							                    <div class="or_name">
							                        <a href="/item/${orderItem.sale_id}">${orderItem.name}</a>
							                    </div>
							                    <div class="or_price">
							                    	<div>
							                        	<span class="price11">${orderItem.after_price}&nbsp;원 ·</span>
							                       		<span>${orderItem.quantity}&nbsp;개</span>
							                    	</div>
							                    </div>
							                </div>
							            </div>
							        </div>
							        <div class="or_body_right">
							            <div id="or_right_btn">
							                <button style="margin-bottom: 1rem;">배송 조회</button>
							                <button>교환, 반품 신청</button>
							            </div>
							        </div>
							    </div>
						    </c:if>
						   </c:forEach>
						</div>
				    </c:forEach>
				    	<div id="page_box">
				    	  <div class="pagination">
							  <div class="size-selector">
							    <select id="size" onchange="changeSize()">
							      <option value="5">5</option>
							      <option value="10">10</option>
							      <option value="20">20</option>
							    </select>
							  </div>
							  <c:if test="${ordersPage.first == false}">
<!-- 							    	<a href="javascript:changePage(0)">처음</a> -->
									<a href="javascript:changePage(${ordersPage.number - 1})">이전</a>
							  </c:if>
							  <c:forEach begin="0" end="${ordersPage.totalPages -1}" step="1" var="page">
							    <c:choose>
							      <c:when test="${page == ordersPage.number}">
							        <span class="current">${page + 1}</span>
							      </c:when>
							      <c:otherwise>
							        <a href="?page=${page}&size=${size}">${page + 1}</a>
							      </c:otherwise>
							    </c:choose>
							  </c:forEach>
							  <c:if test="${ordersPage.last == false}">
							  		<a href="javascript:changePage(${ordersPage.number + 1})">다음</a>
<%-- 									<a href="javascript:changePage(${ordersPage.totalPages - 1})">마지막</a> --%>
							  </c:if>
							</div>
						</div>
			    </c:when>
			    <c:when test="${fn:length(ordersPage.content)  == 0 }">
			      <h6>NO ORDER NOT YET</h6>
			    </c:when>
		    </c:choose>
		

			
		<div class="or_guide_box">
			<div class="or_guide_up">
				<div class="or_guide_1">
					<p>배송상품 주문상태 안내</p>
					<a href="">자세한 내용 더보기 ></a>
				</div>
				<div class="or_guide_2">
					<div class="or_guide_img">
						<i class="fa-solid fa-money-bill-1-wave" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">결제완료</p>
						<p style="font-size: 10px;">주문,결제 확인이 완료되었습니다.</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-box-open" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">상품준비중</p>
						<p style="font-size: 10px;">판매자가 발송할상품을 준비중입니다.</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-gift" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">배송시작</p>
						<p style="font-size: 10px;">상품준비가 완료되어곧 배송될 예정입니다.</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-truck" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">배송중</p>
						<p style="font-size: 10px;">상품이 고객님께 배송중입니다.</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-truck-ramp-box" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">배송완료</p>
						<p style="font-size: 10px;">상품이 주문자에게 전달완료되었습니다.</p>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</div>


<script>
window.onload = function() {
    // URL에서 'page'와 'size' 파라미터를 가져옵니다.
    var urlParams = new URLSearchParams(window.location.search);
    var size = urlParams.get('size');
    var page = urlParams.get('page');

    // 'page'와 'size' 파라미터를 전역 변수로 설정합니다.
    window.currentPage = page ? parseInt(page) : 0;
    window.currentSize = size ? parseInt(size) : 5;

    // 'size' 파라미터를 select box의 선택 값으로 설정합니다.
    var selectBox = document.getElementById('size');
    selectBox.value = window.currentSize;
};

// function changeSize() {
//     window.currentSize = document.getElementById("size").value;  // 페이지 사이즈 변경 시 사이즈 업데이트
//     window.location.href = "?page=" + window.currentPage + "&size=" + window.currentSize;
// }

function changePage(page) {
    window.currentPage = page;  // 페이지 이동할 때마다 페이지 번호 업데이트
    window.location.href = "?page=" + window.currentPage + "&size=" + window.currentSize;
}
function changeSize() {
    window.currentSize = document.getElementById("size").value;  // 페이지 사이즈 변경 시 사이즈 업데이트
    window.currentPage = 0;  // 페이지 번호 초기화
    window.location.href = "?page=" + window.currentPage + "&size=" + window.currentSize;
}
</script>

