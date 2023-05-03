<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>findId.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
	<h2 class="text-center">아 이 디 찾 기</h2>
		<form name="myform" method="post" action="${ctp}/FindIdOk.fa">
		<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" id="name" required class="form-control"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" id="email" class="form-control"/></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="submit" value="아이디 찾기" class="btn btn-success mr-2"/>
					<input type="reset" value="다시쓰기" class="btn btn-danger mr-2"/>
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/Login.fa';" class="btn btn-warning"/>
				</td>
			</tr>
		</table>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>