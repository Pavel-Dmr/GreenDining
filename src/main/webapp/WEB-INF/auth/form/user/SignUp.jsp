<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/auth/SignUp.css" />

<div id="general_box">
  <h1 class="general_title">일반회원 가입</h1>

  <div id="general">
    <input class="text_in" type="text" name="이름" placeholder="이름" /><br />
    <input class="text_in" type="text" name="이메일" placeholder="이메일" /><br />
    <input class="text_in" type="text" name="닉네임" placeholder="닉네임" /><br />
    <div id="ch"><input type="checkbox" />활동시 닉네임 사용 여부<br /></div>
    <input class="text_in" type="password" name="비밀번호" placeholder="6자리 이상 비밀번호" /><br />
    <input class="text_in" type="password" name="비밀번호 확인" placeholder="비밀번호 확인" /><br />
  </div>
  <div id="ch">
    <input type="checkbox" />전체 동의<br />
    <input type="checkbox" /><span>사이트 이용약관 동의(필수) </span><a href="">보기</a><br />
    <input type="checkbox" /><span>개인정보 수집 및 이용 동의(필수) </span><a href="">보기</a><br />
  </div>
  <button class="chb" onclick="">가입하기</button>
</div>