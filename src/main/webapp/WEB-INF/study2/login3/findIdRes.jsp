<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>findIdRes.jsp</title>
	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
	<table class="table table-bordered text-center">
      <tr>
        <td class="text-center"><font size="5">아 이 디 확 인</font></td>
      </tr>
      <tr>
        <th>아이디</th>
        <td>${mid}</td>
      </tr>
      <tr>
        <th>성명</th>
        <td>${name}</td>
      </tr>
      <tr>
        <td>
          <input type="button" value="로그인가기" onclick="location.href='${ctp}/Login.fa';" class="btn btn-warning"/>
        </td>
      </tr>
    </table>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>