<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
	if(mid.equals("")) {
%>
	<script>
		location.href="${pageContext.request.contextPath}/study/0428_database/login.jsp";
	</script>
<%  }%>