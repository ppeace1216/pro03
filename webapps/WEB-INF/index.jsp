<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${request.getContextPath() }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>메인 페이지</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
	<script src='https://unpkg.com/jquery@3/dist/jquery.min.js'></script>
	<script src='https://unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
	<script src='https://unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
	<link rel="stylesheet" href="common.css">
    <jsp:include page="/head.jsp" />
</head>
<body>
  	<jsp:include page="${path1 }/header.jsp" />
	<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
	  <ol class="carousel-indicators">
	    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
	    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
	    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
	    <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
	    <li data-target="#carouselExampleCaptions" data-slide-to="4"></li>
	  </ol>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="./data/img/mainpage1.jpg" class="d-block w-100" alt="main1">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>
	        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-signpost-fill" viewBox="0 0 16 16">
			  <path d="M7.293.707A1 1 0 0 0 7 1.414V4H2a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h5v6h2v-6h3.532a1 1 0 0 0 .768-.36l1.933-2.32a.5.5 0 0 0 0-.64L13.3 4.36a1 1 0 0 0-.768-.36H9V1.414A1 1 0 0 0 7.293.707z"/>
			</svg>지금 여기는 <strong style="color:white;">경기전</strong>
	        </h5>
	        <p>Some representative placeholder content for the first slide.</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="./data/img/mainpage2.jpg" class="d-block w-100" alt="main2">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>Second slide label</h5>
	        <p>Some representative placeholder content for the second slide.</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="./data/img/mainpage3.jpg" class="d-block w-100" alt="main3">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>Third slide label</h5>
	        <p>Some representative placeholder content for the third slide.</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="./data/img/mainpage4.jpg" class="d-block w-100" alt="main4">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>Third slide label</h5>
	        <p>Some representative placeholder content for the third slide.</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="./data/img/mainpage5.jpg" class="d-block w-100" alt=main5">
	      <div class="carousel-caption d-none d-md-block">
	        <h5>Third slide label</h5>
	        <p>Some representative placeholder content for the third slide.</p>
	      </div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </button>
	</div>
	<jsp:include page="${path1 }/footer.jsp" />
</body>
</html>