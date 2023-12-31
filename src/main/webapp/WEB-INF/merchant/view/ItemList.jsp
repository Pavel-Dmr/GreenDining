<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/css/user/MyPage.css" />
<link rel="stylesheet" href="/css/smartstore/ProductList.css" />
<div class="merchant_page_box">
  <div class="merchant_aside_box">
    <div id="mer_aside"> 
<ul class="list-group list-group-flush" id="aside_list_sort"> 
	<li class="list-group-item">
		<div class="dropdown float-start">
		  <button class="text-start">상품관리</button>
			  <div class="dropdown-options">
			    <a href="/merchant/my-page/product/list">상품 리스트</a><br>
			    <a href="/product/write">상품 등록</a><br>
			  </div>
		 </div>
    </li>
	<li class="list-group-item">
		<div class="dropdown float-start">
		  <button class="text-start">판매글</button>
		  	<div class="dropdown-options">
			    <a href="/merchant/my-page/item/list">판매글 리스트</a><br>
			    <a href="/item/write">판매글 등록</a><br>
		 	</div>
		</div>
    </li>
	<li class="list-group-item">
		<div class="dropdown float-start">
		  <button class="text-start">주문/배송</button>
		  	<div class="dropdown-options">
			    <a href="/merchant/my-page/delivery/list">배송 관리</a><br>
			    <a href="#">주문 조회</a><br>
		 	</div>
		</div>
    </li>
	<li class="list-group-item">
		<div class="dropdown float-start">
		  <button class="text-start">판매자 정보</button>
			  <div class="dropdown-options">
			    <a href="#">계정 정보</a><br>
			    <a href="#">비밀번호 변겅</a><br>
			  </div>
	    </div>
    </li>
	<li class="list-group-item">
		<div class="dropdown float-start">
		  <button class="text-start">공지사항</button>
			  <div class="dropdown-options">
			    <a href="#">공지사항 리스트</a><br>
			    <a href="#">공지사항 등록</a><br>
			  </div>
	    </div>
	</li>
</ul>
    
    </div>
  </div>
  <div id="salePage_main_box">
    <div>
		<p style="text-align: center; font-size: 30px;">판매글 목록</p>
		
	</div>
<table class="table table-hover" id="pList_table">
  <thead>
    <tr>
      <th scope="col" id="col1">번호</th>
      <th scope="col" id="col2">판매 제목</th>
      <th scope="col" id="col3">게시글 상태</th>
      <th scope="col" id="col4">판매 시작 시간</th>
      <th scope="col" id="col5">판매 종료 시간</th>
      <th scope="col" id="col6">수정/삭제</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
  <c:choose>
  	<c:when test="${fn:length(salePage.content)>0 }">
        <c:forEach var="sale" items="${salePage.content}">
            <tr>
            <form id="dsaleForm${sale.id}" method="post" action="/item/delete/${sale.id}">
	            <th scope="row">${sale.id}</th>
	            <td>${sale.title}</td>
	            <td>${sale.status}</td>
	            <td>${sale.started_at}</td>
	            <td>${sale.ended_at}</td>
	            <td id="del_btn">
              	<input id="updataForm" onclick="location.href='/item/write/${sale.id}'" type="button" value="수정">&nbsp;
<%--               	<input id="deleteBtn" onclick="location.href='/item/delete/${sale-id}'" type="button" value="삭제"> --%>
				<input id="deleteBtn${sale.id}" type="button" value="삭제">
              </td>
            </form>
	        </tr>  
        </c:forEach>
        
    </c:when>
    <c:when test="${fn:length(salePage.content)==0}">
    	<tr style="text-align:center; height: 30px;">
			<th colspan="6">등록된 상품이 없습니다.</th></tr>
    </c:when>
  </c:choose>
  
  </tbody>
</table>
	<div id="addProductBtn" class="h-30px">
		<input type="button" class="float-end" onclick="location.href='/item/write'" value="판매글 등록">
	</div>	
	<div class="pagination justify-content-center">
		<div class="size-selector">
			<select id="size" onchange="changeSize()" class="me-3" style="height:37px">
				<option value="5">5개씩 보기</option>
				<option value="10">10개씩 보기</option>
				<option value="20">20개씩 보기</option>
			</select>
		</div>
		
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
</div>
  
</div>


<script>
window.onload = function() {
    // URL에서 'size' 파라미터를 가져옵니다.
    var urlParams = new URLSearchParams(window.location.search);
    var size = urlParams.get('size');
    var page = urlParams.get('page');

    // 'size' 파라미터를 select box의 선택 값으로 설정합니다.
    var selectBox = document.getElementById('size');
    selectBox.value = size;
};

</script>
<script>
var currentPage = ${salePage.number};  // 현재 페이지 번호 초기화
var currentSize = ${size};  // 현재 페이지 사이즈 초기화

window.onload = function() {
  document.getElementById("size").value = currentSize;  // 페이지 로드 시 선택된 사이즈로 설정
};

function changeSize() {
  currentSize = document.getElementById("size").value;  // 페이지 사이즈 변경 시 사이즈 업데이트
  window.location.href = "?page=0" + "&size=" + currentSize;
}

function changePage(page) {
  currentPage = page;  // 페이지 이동할 때마다 페이지 번호 업데이트
  window.location.href = "?page=" + currentPage + "&size=" + currentSize;
}

$("[id^='deleteBtn']").click(function() {
    var con = confirm("정말로 삭제하시겠습니까?");
    if (con) {
        var id = this.id.replace("deleteBtn", "");
        $("#dsaleForm" + id).submit();
    }
});
</script>