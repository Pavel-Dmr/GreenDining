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
    <link rel="stylesheet" href="/dist/bundle/bundle.css" />
    <script src="/dist/bundle/bundle.js"></script>
    <script src="/js/Script.js"></script>
    <script src="/js/public/Search.js"></script>
    <style>
      .card-img-top
      {
        height: 220px;
        object-fit: cover;
      }
    </style>
  </head>
  <body>
    <input type="hidden" name="category_code" value="${category}">
    <input type="hidden" id="redirect_url" value="/np/best-item"></input>
    <section class="container">
      <div class="row">
        <div class="col">
          <section id="category_group">
            <fieldset class="checkbox-group">
              <legend class="checkbox-group-legend">MD 추천</legend>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" value="0" onclick="checkedCategory(this,0)" ${category == 0 ? 'checked' : ''} />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <span class="material-symbols-outlined fs-1"> apps </span>
                    </span>
                    <span class="checkbox-label">전체</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" value="10000" onclick="checkedCategory(this,10000)" ${category == 10000 ? 'checked' : ''} />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon"> <i class="fa-solid fa-lemon fs-2 mb-3 text-warning"></i> </span>
                    <span class="checkbox-label">과일</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" value="20000" onclick="checkedCategory(this,20000)"  ${category == 20000 ? 'checked' : ''}/>
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-carrot fs-2 mb-3" style="color: rgb(247, 138, 21)"></i>
                    </span>
                    <span class="checkbox-label">채소</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" value="30000" onclick="checkedCategory(this,30000)" ${category == 30000 ? 'checked' : ''}/>
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-bowl-rice fs-2 mb-3" style="color: rgb(192, 176, 133)"></i>
                    </span>
                    <span class="checkbox-label">쌀/잡곡</span>
                  </span>
                </label>
              </div>

              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" value="40000" onclick="checkedCategory(this,40000)" ${category == 40000 ? 'checked' : ''}/>
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-bacon fs-2 mb-3 text-danger"></i>
                    </span>
                    <span class="checkbox-label">축산물</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" value="50000" onclick="checkedCategory(this,50000)" ${category == 50000 ? 'checked' : ''}/>
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-fish-fins fs-2 mb-3 text-primary"></i>
                    </span>
                    <span class="checkbox-label">수산물</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" value="60000" onclick="checkedCategory(this,60000)" ${category == 60000 ? 'checked' : ''}/>
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-egg fs-2 mb-3" style="color: rgb(242, 154, 95)"></i>
                    </span>
                    <span class="checkbox-label">가공식품</span>
                  </span>
                </label>
              </div>
            </fieldset>
          </section>
        </div>
      </div>
      <div class="mb-5 mt-5 row row-cols-lg-5 row-cols-md-4 row-cols-sm-3 h-100 row-gap-5 justify-content-start">
        <c:choose>
          <c:when test="${fn:length(salePage.content) > 0}">
            <c:forEach var="sale" items="${salePage.content}" varStatus="i">
              <a href="/item/${sale.id}">
              <div class="col h-450px">
                <div class="card h-100 overflow-hidden">
                  <div class="embed-responsive embed-responsive-4by3">
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
                       <c:if test="${sale.delivery_fee == 0}">
                        <br>
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
    </section>
  </body>
</html>
