<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>adminLeft.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body style="background-color:#efa">
<p><br/></p>
<div class="text-center">
  <h5>관리자메뉴</h5>
  <hr/>
  <p><a href="${ctp}/" target="_top">홈으로</a></p>
  <hr/>
  <p><a href="${ctp}/GuestList.gu" target="adminContent">방명록리스트</a></p>
  <hr/>
  <p><a href="${ctp}/BoardList.bo" target="adminContent">게시판리스트</a></p>
  <hr/>
  <p><a href="${ctp}/AdminMemberList.ad" target="adminContent">회원리스트</a></p>
  <hr/>
</div>
<p><br/></p>
</body>
</html>