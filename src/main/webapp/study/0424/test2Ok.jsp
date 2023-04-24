<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:useBean id="vo" class="study.t0424.Test1VO" />
<jsp:setProperty property="*" name="vo"/>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test2Ok.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
	</head>
<body>
<p><br/></p>
<div class="container">
	<h2>처리된 자료를 view에 출력시켜본다.</h2>
	<div>
		<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td><%=vo.getName()%></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><%=vo.getAge()%></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><%=vo.getGender()%></td>
			</tr>
			<tr>
				<th>직업</th>
				<td><%=vo.getJob()%></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%=vo.getAddress()%></td>
			</tr>
		</table>
		<p>
			<a href="test2.jsp">돌아가기</a>
		</p>
	</div>
</div>
<p><br/></p>
</body>
</html>