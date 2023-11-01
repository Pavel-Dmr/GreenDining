<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="/css/FingID.css" />
<script src="https://kit.fontawesome.com/dd4730185a.js" crossorigin="anonymous"></script>    

<body>
<div style="text-align: center">
<h6 class="mt-5 mb-3">ȸ������</h6>
<div class="btn-group w-400px" role="group" aria-label="Basic radio toggle button group">
  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
  <label class="btn btn-outline-primary" for="btnradio1">����</label>
  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio2">�����</label>
</div>
<div class="fingForm" id="user_find">
<h1 id="title">���̵� ã��</h1>
	<p id="middleTit">���̵� �����̳���?</p>
	<p id="pickHow">���Ͻô� ����� �������ּ���</p>
	
	<button class="fingBtn" onclick="location.href='/user/login/fing-id/by-phone-number'">
	<i class="fa-solid fa-mobile-screen-button" style="color: #182E15;"></i>
	�޴��� ��ȣ�� ã��
	<div class="fBtnI"><i class="fa-solid fa-chevron-right" style="color: #182e15;"></i></div>
	</button>
	
	<button class="fingBtn" onclick="location.href='/user/login/fing-id/by-email-address'">
	<i class="fa-regular fa-envelope" style="color: #182e15;"></i>
	�̸��� �ּҷ� ã��
	<div class="fBtnI"><i class="fa-solid fa-chevron-right" style="color: #182e15;"></i></div>
	</button>
	
	<p id="smallTit">��й�ȣ�� �����̳���?</p>
	<p id="searchA"><a href="/user/login/fing-password">��й�ȣ ã��</a></p>
	<div id="backCol">
		<p>- ������ ȸ���� ���̵� �Է¶��� �̸��� �ּҸ� �Է��ϼ���</p>
		<p>- ���̵�/��й�ȣ�� ã���� �� ���ٸ� �Ʒ� �����ּҷ� �̸�, ����ó, ���� �� &nbsp;&nbsp;2�ڸ��� �����ּ���</p>
		<p>&nbsp; ��)ȫ�浿, 010-1234-5678, 23(���)</p>
		<p>&nbsp; �����ּ�: asdf@asdf.com</p>
		<p>&nbsp; ������: 010-0123-0123</p>
	</div>
</div>
<div class="fingForm" id="business_find" style="display: none;">
<h1 id="title">����� ���̵� ã��</h1>
	<p id="middleTit">���̵� �����̳���?</p>
	<p id="pickHow">���Ͻô� ����� �������ּ���</p>
	
	<button class="fingBtn" onclick="location.href='/merchant/login/fing-id/by-business-number-id'">
	<i class="fa-solid fa-mobile-screen-button" style="color: #182E15;"></i>
	����ڵ�� ��ȣ�� ã��
	<div class="fBtnI"><i class="fa-solid fa-chevron-right" style="color: #182e15;"></i></div>
	</button>
	
	
	<p id="smallTit">��й�ȣ�� �����̳���?</p>
	<p id="searchA"><a href="/user/login/fing-password">��й�ȣ ã��</a></p>
	<div id="backCol">
		<p>- ������ ȸ���� ���̵� �Է¶��� �̸��� �ּҸ� �Է��ϼ���</p>
		<p>- ���̵�/��й�ȣ�� ã���� �� ���ٸ� �Ʒ� �����ּҷ� �̸�, ����ó, ���� �� &nbsp;&nbsp;2�ڸ��� �����ּ���</p>
		<p>&nbsp; ��)ȫ�浿, 010-1234-5678, 23(���)</p>
		<p>&nbsp; �����ּ�: asdf@asdf.com</p>
		<p>&nbsp; ������: 010-0123-0123</p>
	</div>
</div>
</div>
</body>
