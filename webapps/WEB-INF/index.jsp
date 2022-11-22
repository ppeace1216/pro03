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
    <style>
   	.page_tit { text-align: left; font-size:30px; font-weight: 700; padding-top:1em; padding-bottom: 0.8em; line-height:2em; margin-left: 100px }
   	#page1 { background-repeat: no-repeat; background-size: cover; background-position:center center; height: 100vh; background-image:url("./data/img/mainsub1.jpg"); overflow:hidden; height: 650px; margin: 100px; }
    .lst { clear:both; width: 1400px;}
    .lst:after { content:""; display:block; clear: both;}
    .lst li { margin-bottom: 10px; }
    .lst li.right { float:right; width:500px; height: 500px; }
    .ico_lst { clear:both; width: 100%; overflow:hidden; }
    .ico_lst li a { display:block; background-repeat: no-repeat; 
    background-position:0px center; background-size:auto 75%; padding-left: 120px; padding-bottom: 30px;}
    .ico_lst li a.icon1 { background-image: url("./img/icon/calicon.png");background-size:auto 60%; }
    .ico_lst li a.icon2 { background-image: url("./img/icon/teaicon.png");}
    .ico_lst li a.icon3 { background-image: url("./img/icon/leaficon.png"); }
    .cate_tit { color:#222; font-size:25px; padding-bottom: 1em; }
    .cate_com { color:#222; font-size:18px; overflow:hidden; font-weight: 100; line-height:2em; white-space:nowrap; text-overflow:ellipsis;}
    .card-title { overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }
	.card-text {   overflow: hidden;  text-overflow: ellipsis;  display: -webkit-box;
    -webkit-line-clamp: 2;  -webkit-box-orient: vertical; }
	#best { margin-bottom:40px; }  
	#best li { margin-bottom:24px; } 
	.cate_title { padding-top:24px; padding-bottom:24px; padding-left:36px; } 
    </style>
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
	        <h5 class="display-4">
	        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-signpost-fill" viewBox="0 0 16 16">
			  <path d="M7.293.707A1 1 0 0 0 7 1.414V4H2a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h5v6h2v-6h3.532a1 1 0 0 0 .768-.36l1.933-2.32a.5.5 0 0 0 0-.64L13.3 4.36a1 1 0 0 0-.768-.36H9V1.414A1 1 0 0 0 7.293.707z"/>
			</svg>지금 여기는 <strong style="color:white;">전주향교</strong>
	        </h5>
	        <p># 연인과함께  # 운치있는  # 가을산책</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="./data/img/mainpage2.jpg" class="d-block w-100" alt="main2">
	      <div class="carousel-caption d-none d-md-block">
	        <h5 class="display-4">
	        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-signpost-fill" viewBox="0 0 16 16">
			  <path d="M7.293.707A1 1 0 0 0 7 1.414V4H2a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h5v6h2v-6h3.532a1 1 0 0 0 .768-.36l1.933-2.32a.5.5 0 0 0 0-.64L13.3 4.36a1 1 0 0 0-.768-.36H9V1.414A1 1 0 0 0 7.293.707z"/>
			</svg>지금 여기는 <strong style="color:white;">전주향교</strong>
	        </h5>
	        <p># 전주한옥마을  # 역사관광지  # 전주단풍</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="./data/img/mainpage3.jpg" class="d-block w-100" alt="main3">
	      <div class="carousel-caption d-none d-md-block">
	       <h5 class="display-4">
	        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-signpost-fill" viewBox="0 0 16 16">
			  <path d="M7.293.707A1 1 0 0 0 7 1.414V4H2a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h5v6h2v-6h3.532a1 1 0 0 0 .768-.36l1.933-2.32a.5.5 0 0 0 0-.64L13.3 4.36a1 1 0 0 0-.768-.36H9V1.414A1 1 0 0 0 7.293.707z"/>
			</svg>지금 여기는 <strong style="color:white;">경기전</strong>
	        </h5>
	        <p># 전주한옥마을  # 역사관광지  # 가을여행</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="./data/img/mainpage4.jpg" class="d-block w-100" alt="main4">
	      <div class="carousel-caption d-none d-md-block">
	       <h5 class="display-4">
	        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-signpost-fill" viewBox="0 0 16 16">
			  <path d="M7.293.707A1 1 0 0 0 7 1.414V4H2a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h5v6h2v-6h3.532a1 1 0 0 0 .768-.36l1.933-2.32a.5.5 0 0 0 0-.64L13.3 4.36a1 1 0 0 0-.768-.36H9V1.414A1 1 0 0 0 7.293.707z"/>
			</svg>지금 여기는 <strong style="color:white;">전주수목원</strong>
	        </h5>
	        <p># 가족과함께  # 포토존  # 생태관광지 # 한국도로공사</p>
	      </div>
	    </div>
	    <div class="carousel-item">
	      <img src="./data/img/mainpage5.jpg" class="d-block w-100" alt=main5">
	      <div class="carousel-caption d-none d-md-block">
	        <h5 class="display-4">
	        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-signpost-fill" viewBox="0 0 16 16">
			  <path d="M7.293.707A1 1 0 0 0 7 1.414V4H2a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h5v6h2v-6h3.532a1 1 0 0 0 .768-.36l1.933-2.32a.5.5 0 0 0 0-.64L13.3 4.36a1 1 0 0 0-.768-.36H9V1.414A1 1 0 0 0 7.293.707z"/>
			</svg>지금 여기는 <strong style="color:white;">남천교</strong>
	        </h5>
	        <p># 경치좋은곳  # 포토존  # 전주한옥마을 # 야경코스</p>
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
		<section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">특별한 전주,<br><strong>추천여행</strong></h2>
                <ul class="lst">
                    <li class="right">
                        <ul class="ico_lst">
                            <li>
                                <a href="" class="icon1">
                                    <h3 class="cate_tit">1일 여행자를 위한 한옥마을투어</h3>
                                    <p class="cate_com">2022년 F/W 전주 한옥마을 1일 여행 필수코스</p>
                                </a>
                            </li>
                            <li>
                                <a href="" class="icon2">
                                    <h3 class="cate_tit">전통과 문화, 축제의 도시 전주 100% 즐기기</h3>
                                    <p class="cate_com">다양한 콘텐츠를 통해 새로운 문화를 만들어가는 전주!</p>
                                </a>
                            </li>
                            <li>
                                <a href="" class="icon3">
                                    <h3 class="cate_tit">사부작사부작 느리게 걷기, 슬로우투어</h3>
                                    <p class="cate_com">여유를 즐기고 사색하며 걷는 전주 힐링 여행</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </section>
        <section class="page" id="page2">
            <div class="page_wrap">
                <h2 class="page_tit"><strong>여행팁! 전주의 추천명소</strong></h2>
                	<ul class="row" id="best">
                	  <li class="col-xl-3 col-lg-4 col-md-6 col-sm-12">
	                   <div class="card" style="width: 18rem;">
						  <img src="./data/img/mainsub2.jpg" class="card-img-top" alt="...">
						  <div class="card-body">
						  	<h5 class="card-title">경기전</h5>
						    <p class="card-text">조선왕조 500년의 시간을 간직하다</p>
						  </div>
						</div>
						<div class="card" style="width: 18rem;">
						  <img src="./data/img/mainsub3.jpg" class="card-img-top" alt="...">
						  <div class="card-body">
						    <h5 class="card-title">전동성당</h5>
						    <p class="card-text">신앙의 요람</p>
						  </div>
						</div>
						<div class="card" style="width: 18rem;">
						  <img src="..." class="card-img-top" alt="...">
						  <div class="card-body">
						    <h5 class="card-title">전주생태동물원</h5>
						    <p class="card-text">사람과 동물이 공존하는 생태동물원</p>
						  </div>
						</div>
						<div class="card" style="width: 18rem;">
						  <img src="..." class="card-img-top" alt="...">
						  <div class="card-body">
						    <h5 class="card-title">덕진공원</h5>
						    <p class="card-text">가족, 연인과의 추억을 떠올리게 하는 낭만의 장소</p>
						  </div>
						</div>
					</li>
                </ul>
            </div>
        </section>
	<jsp:include page="${path1 }/footer.jsp" />
</body>
</html>