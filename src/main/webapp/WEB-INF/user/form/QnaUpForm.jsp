<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/js/smartstore/ProductForm.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/* table{
	margin: 0 auto;
	width: 600px;
	border: solid 1px black;
	border-collapse: collapse;
}
tr{
	border: solid 1px black;
}
th{
	width: 200px;
}
td{
	width: 400px;
	text-align: center;
	border: solid 1px black;
} */
</style>
<script src="../jquery/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<h2 style="text-align: center;">질문 내용</h2>
<br><br>
<form action="" id="ajaxForm" method="post" name="form1" enctype="multipart/form-data" method="post">
<table>
	<tbody>
	<tr>
		<th>제목</th>
		<td>
			<input type="text" size = "52"  name="subject" value="${qna.title}">
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="text" size = "52"  readonly="readonly" value="${qna.user_id}">
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea rows="20" cols="50" name="content" style="resize: none" style="resize: none">${qna.content}</textarea>
		</td>
	</tr>
	<tr>
		<th>이미지</th>
		<td>
			<input type="file" name="fileList" multiple="multiple">
						<small style="display: flex; padding-top: 10px;">* 여러개 첨부 가능</small>
						<input type="hidden" name="sale_id" value="${sale_id}">
						<input type="hidden" id="url" value="/imgur/upload">
		</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>
			<input type="text" size = "52"  disabled="disabled" value="${qna.created_at}">
		</td>
	</tr>
	</tbody>
	<tfoot>
		<tr style="text-align: center">
			<td colspan="2">
<!-- 				<input type="button" value="글수정" id="update"> -->
				<input class="submit1" type="button" value="글수정" id="imgur_push">
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록" onclick="location.href ='/item/${qna.sale_id}'">
			</td>
		</tr>
	</tfoot>
</table>
	<input type="hidden" name="bno" value="">
	<input type="hidden" name="bref" value="">
	<input type="hidden" name="bstep" value="">
	<input type="hidden" name="blevel" value="">
</form>
</body>
</html>