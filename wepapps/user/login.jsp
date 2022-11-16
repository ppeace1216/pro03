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
<jsp:include page="/header.jsp" />
  <section class="section">
    <div class="container">
	<h2 class="title">로그인</h2>
	<form name="frm1" id="frm1" action="${path1 }/UserLoginCtrl.do" method="post" onsubmit="return joinCheck(this)">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<div class="form-row">
							<input type="text" name="id" id="id" placeholder="아이디 입력" class="input" autofocus required />
						</div>
						<div>
							<c:if test="${empty msg }">
								<p></p>
							</c:if>
							<c:if test="${not empty msg }">
								<p>${msg }</p>
							</c:if>
						</div>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" id="pw" placeholder="비밀번호 입력" class="input" required /></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" class="button is-info is-light" value="로그인">
			<a href="<%=request.getContextPath() %>/user/joinForm.jsp" class="button is-info">회원가입</a>
		</div>
	</form>	
	<script>
	</script>
</div>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>