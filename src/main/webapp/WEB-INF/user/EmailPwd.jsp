<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="/css/IdPwSearch.css" />

<div id="searchPwdBox">
<h1 id="title">��й�ȣ ã��</h1>

	<div id="searchIDBorder">
	<p id="smallIDSearch">�̸��Ϸ� ��й�ȣ ã��</p>
		<input class="text_in" type="text" name="���̵�" placeholder="���̵� �Է��ϼ���"><br>
		<input class="text_in" type="text" name="�̸�" placeholder="�̸��� �Է��ϼ���"><br>
		<div id="pNumBorder">
			<input id="pNumberSend" type="text" name="�޴��� ��ȣ" placeholder="�̸����� �Է��ϼ���">
			<button id="sendBtn">����</button>	
		</div>
		<div id="pNumBorder">
			<input id="pNumberSend" type="text" name="���� ��ȣ" placeholder="������ȣ�� �Է��ϼ���" 
			oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
			<button id="sendBtn">Ȯ��</button>	
		</div>
	</div>	
		<button class="IDsearch" onclick="">��й�ȣ ã��</button>
		<p id="searchEmail"><a href="/user/login/fing-password/by-phone-number">�޴��� ��ȣ�� ã��</a></p>
</div>
</div>
