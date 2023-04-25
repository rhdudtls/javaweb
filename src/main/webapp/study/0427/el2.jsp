<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp" />
	</head>
<body>
<p><br/></p>
<div class="container">
	<h2>폼을 통햇 넘어온 자료 출력</h2>
	<p>
		취미 : ${hobbys}<br/>
		${hobbys[0]}
	</p>
	<hr/>
	<p><a href="${pageContext.request.contextPath}/study/0427/form2.jsp"></a></p>
</div>
<p><br/></p>
</body>
</html>