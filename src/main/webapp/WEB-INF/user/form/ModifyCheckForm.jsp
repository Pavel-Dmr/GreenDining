<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" import="java.util.Date" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원정보 확인</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous" />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"></script>
  </head>
  <body>
    <h3>회원정보 확인</h3>
    <p>${ssKey.email}님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</p>
    <form action="/user/my-page/modify-form" id="modify-check-form" method="post">
      <table class="table">
        <tbody>
          <tr>
            <th>아이디</th>
            <td>
              <input type="text" name="id" id="" value="${ssKey.id}" readonly />
            </td>
          </tr>
          <tr>
            <th>비밀번호</th>
            <td>
              <input type="password" name="password" id="" />
            </td>
          </tr>
        </tbody>
      </table>
      <div class="d-flex justify-content-center">
        <button type="button" id="modify-check-ok" class="btn btn-primary w-50px h-30px fs-12px me-3">확인</button>
        <button type="button" id="modify-check-no" class="btn btn-warning w-50px h-30px fs-12px">취소</button>
      </div>
    </form>
  </body>
</html>
