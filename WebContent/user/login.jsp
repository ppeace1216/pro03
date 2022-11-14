<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<%-- <c:set var="path1" value="${pageContext.request.contextPath }" />   --%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>로그인</title>
  <jsp:include page="/head.jsp" />
</head>
<body>
  	<jsp:include page="${path }/header.jsp" />
<div class="container" id="content">
	<h2 class="title">로그인</h2>
	<form name="frm1" id="frm1" action="${path1 }/LoginCtrl.do" method="post">
	<table class="table">
		<tbody>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="cusId" id="cusId" placeholder="아이디 입력" class="form-control" autofocus required />
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="cusPw" id="cusPw" placeholder="비밀번호 입력" class="form-control" required /></td>
			</tr>
		</tbody>
</div>
  <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>