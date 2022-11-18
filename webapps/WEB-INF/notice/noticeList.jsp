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
    <title>공지사항 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  <style>
  	.top {clear:both; width:auto; margin:auto; text-align : center;}
  	.section { clear:both; width:1200px; margin:0 auto; }
	.section:after { content:""; display:block; clear:both; }
	.breadcrumb { clear:both; margin:100 auto; }
  </style>
  </head>
  <body>
  <jsp:include page="/header.jsp" />
  <div class="top">
  	<br><br>
  	<h1 class="title">공지사항</h1>
  	<br><hr>
  </div>
  <nav class="breadcrumb is-centered" aria-label="breadcrumbs">
	  <ul>
	    <li><a href="#">Bulma</a></li>
	    <li><a href="#">Documentation</a></li>
	    <li><a href="#">Components</a></li>
	    <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
	  </ul>
	</nav>
	<hr>
  <section class="section">
    <div class="container">
		<table class="table">
		  <thead>
		    <tr>
		      <th><abbr title="No">No</abbr></th>
		      <th><abbr title="Title">제목</abbr></th>
		      <th><abbr title="Result">작성일</abbr></th>
		    </tr>
		  </thead>
		   <tbody>
		   <c:forEach items="${list }" var="dto" varStatus="status">
		    <tr>
		      <td>${status.count }</td>
		      <td><a href="${path1 }/GetNoticeCtrl.do?no=${dto.no }">${dto.title }</a></td>
		      <td>
		      	<fmt:parseDate value="${dto.regDate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
		      	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
		      </td>
		    </tr>
		    </c:forEach>
	<%-- 		    <c:if test="${list==null }">
			    <tr>
			    	<td colspan="3">해당 데이터 목록이 없습니다.</td>
			    </tr>
			    </c:if> --%>
		  </tbody>
		</table>
		<div class="buttons">
		  <c:if test='${sid.equals("admin") }'>
		  	<a href="${path1 }/notice/addNotice.jsp" class="button is-success">글 등록</a>
		  </c:if>
		</div>
    </div>
  </section>
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>