<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberMain.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
	<h2>회 원 전 용 방</h2>
	<hr/>
	<div>
		<p>현재 <font color="blue">${sNickName}</font>님(${strLevel})로그인 중이십니다.</p>
		<P>누적 포인트 : ${point}</P>
		<P>총 방문횟수 : ${visitCnt}</P>
		<P>오늘 방문횟수 : ${todayCnt}</P>
		<P>회원사진 : <img src="${ctp}/images/member/${photo}" width="200px"/></P>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>