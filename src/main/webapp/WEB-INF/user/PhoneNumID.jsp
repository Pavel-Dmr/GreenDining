<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="/css/IdPwSearch.css" />
<div id="searchIDBox">
<h1 id="title">���̵� ã��</h1>

	<div id="searchIDBorder">
	<p id="smallIDSearch">�޴������� ���̵� ã��</p>
		<input class="text_in" type="text" name="�̸�" placeholder="�̸��� �Է��ϼ���"><br>
		<input class="text_in" type="text" name="�޴��� ��ȣ" placeholder="�޴��ȣ�� �Է��ϼ���(���ڸ� �Է�)" 
			oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" ><br>		
	</div>	
		<button class="IDsearch" onclick="">���̵� ã��</button>
		<p id="searchEmail"><a href="/user/login/fing-id/by-email-address">�̸��� �ּҷ� ã��</a></p>
</div>

