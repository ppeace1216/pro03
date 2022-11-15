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
    <title>공지사항 글 수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  </head>
  <body>
  <jsp:include page="/header.jsp" />
  <section class="section">
    <div class="container">
      <h1 class="title">글 수정하기</h1>
      	<form action="${path1 }/ModifyNoticeProCtrl.do" method="post">
			<table class="table">
			   <tbody>
			   	<tr>
			      <th><label for="no">공지 번호</label></th>
			      <td><input type="text" name="no" id="no" value="${dto.no }" readonly /></td>
			    </tr>
			    <tr>
			      <th><label for="title">제목</label></th>
			      <td><input type="text" class="input" maxlength="120" name="title" id="title" placeholder="제목 입력" value="${dto.title }" required /></td>
			    </tr>
			    <tr>
			      <th><label for="content">내용</label></th>
			      <td><textarea rows="8" cols="100" name="content" id="content" class="textarea" required>${dto.content }</textarea></td>
			    </tr>
			  </tbody>
			</table>
			<div class="buttons">
			  <button type="submit" class="button is-success">수정</button>
			  <button type="reset" class="button is-warning">취소</button>
			  <a href="${path1 }/GetNoticeListCtrl.do" class="button is-info">목록</a>
			</div>
		</form>
    </div>
  </section>
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>