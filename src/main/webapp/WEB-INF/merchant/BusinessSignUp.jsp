<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<div id="general_box">
<h1 class="general_title">�����ȸ�� ����</h1>

	<div id="general">
		<input class="text_in" type="text" name="��ȣ��" placeholder="��ȣ��"><br>
		<input class="text_in" type="text" name="��ǥ�ڸ�" placeholder="��ǥ�ڸ�"><br>
		<input class="text_in" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="����� ��ȣ" placeholder="����ڵ�� ��ȣ( _���� 10�ڸ� )"><br>
		<input class="text_in" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="�޴��� ��ȣ" placeholder="�޴��� ��ȣ( -���� 9�ڸ� )"><br>
		<input class="text_in" type="text" name="�̸���" placeholder="�̸���"><br>		
		<input class="text_in" type="password" name="��й�ȣ" placeholder="6�ڸ� �̻� ��й�ȣ"><br>
		<input class="text_in" type="password" name="��й�ȣ Ȯ��" placeholder="��й�ȣ Ȯ��"><br>
	</div>
	<div id="ch">
		<input type="checkbox">��ü ����<br>
		<input type="checkbox"><span>����Ʈ �̿��� ����(�ʼ�) </span><a href="">����</a><br>
		<input type="checkbox"><span>�������� ���� �� �̿� ����(�ʼ�) </span><a href="">����</a><br>
	</div>
		<button class="chb" onclick="">�����ϱ�</button>
</div>

