<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="/css/IdPwSearch.css" />
<div id="searchIDBox">
<h1 id="title">����� ���̵� ã��</h1>

	<div id="searchIDBorder">
	<p id="smallIDSearch">����� ��ȣ�� ���̵� ã��</p>
		<input class="text_in" type="text" name="��ȣ��" placeholder="��ȣ���� �Է��ϼ���"><br>
		<input class="text_in" type="text" name="�޴��� ��ȣ" placeholder="�޴��� ��ȣ�� �Է��ϼ���(���ڸ� �Է�)" 
			oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" ><br>	
		<p id="bNum">����� ��ȣ</p>
		<input class="inp3" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" > - 
		<input class="inp3" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" > - 
		<input class="inp3" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >	
	</div>	
		<button class="IDsearch" onclick="">���̵� ã��</button>
		<p id="searchEmail"><a href="/merchant/login/fing-password/by-business-number-pw">��й�ȣ ã��</a></p>
</div>

