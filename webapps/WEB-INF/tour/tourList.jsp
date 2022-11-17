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
    <title>전체 관광 안내 목록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  <style>
  	.section { clear:both; width:1400px; margin:0 auto; }
	.section:after { content:""; display:block; clear:both; }
  </style>
  </head>
  <body>
  <jsp:include page="/header.jsp" />
  <section class="section">
    <div class="container">
      <h1 class="title">전체 관광 안내 목록</h1>
      	<table class="table">
		  <thead>
		    <tr>
		      <th><abbr title="Num">No</abbr></th>
		      <th><abbr title="Cate">카테고리</abbr></th>
		      <th><abbr title="Title">제목</abbr></th>
		      <th><abbr title="Regdate">작성일</abbr></th>
		    </tr>
		  </thead>
		   <tbody>
		   <c:forEach items="${list }" var="dto" varStatus="status">
		    <tr>
		      <td>${status.count }</td>
		      <td>
				<c:set var="cate" value="${dto.cate }" /> 
				<c:if test="${cate eq 'A' }">
				<span>이달의 추천여행</span>
				</c:if>
				<c:if test="${cate eq 'B' }">
				<span>역사 전통 명소</span>
				</c:if>
				<c:if test="${cate eq 'C' }">
				<span>자연 생태 명소</span>
				</c:if>
				<c:if test="${grade eq 'D' }">
				<span>축제</span>
				</c:if>
				<c:if test="${cate eq 'E' }">
				<span>전통음식</span>
				</c:if>
				<c:if test="${cate eq 'F' }">
				<span>숙박</span>
				</c:if>
				<c:if test="${cate eq 'G' }">
				<span>쇼핑</span>
				</c:if>
		      </td>
		      <td>
		      	<a href="${path1 }/GetTourDetailCtrl.do?no=${dto.no }">${dto.title }</a>
			  </td>
			  <td>
		      	<fmt:parseDate value="${dto.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
		      	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
		      </td>
		    </tr>
		    </c:forEach>
			<c:if test="${empty list }">
		    <tr>
		    	<td colspan="3">해당 데이터 목록이 없습니다.</td>
		    </tr>
		    </c:if>
		  </tbody>
		</table>
		<c:if test='${sid.equals("admin") }'>
		<div class="buttons">
		  <a href="${path1 }/tour/addTour.jsp" class="button is-success">관광 안내 등록</a>
		</div>
		</c:if>
	</div>
  </section>
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>