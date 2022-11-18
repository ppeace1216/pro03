<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<div class="column is-2 has-background-grey-lighter has-text-white" style="min-height:90vh">
	<div class="navbar-menu">
		<a href="${path1 }/GetUserListCtrl.do" class="navbar-item">회원 관리</a><br>
	</div>
	<div class="navbar-menu">
		<a href="${path1 }/GetNoticeListCtrl.do" class="navbar-item">공지 관리</a>
	</div>
	<div class="navbar-menu">
		<a href="${path1 }/tour/addTour.jsp" class="navbar-item">여행안내 등록</a>
	</div>
	<div class="navbar-menu">
		<a href="${path1 }/GetTourListCtrl.do" class="navbar-item">여행안내 전체목록</a>
	</div>
</div>