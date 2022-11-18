<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path2" value="${pageContext.request.contextPath }" />
<c:set var="path1" value="${request.getContextPath() }" />  
<nav class="navbar" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item" href="${path2 }/">
      <span>VISIT JEONJU</span>
    </a>

    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>

  <div id="navbarBasicExample" class="navbar-menu">
    <div class="navbar-start">
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">전주 나들이</a>

        <div class="navbar-dropdown">
          <a class="navbar-item">전주 사계</a>
          <a href="${path2 }/GetTourCateListCtrl.do?cate=A" class="navbar-item" id="A">이달의 추천여행</a>
          <hr class="navbar-divider">
          <a href="${path2 }/GetTourCateListCtrl.do?cate=B"  class="navbar-item" id="B">역사 전통 명소</a>
          <a href="${path2 }/GetTourCateListCtrl.do?cate=C"  class="navbar-item" id="C">자연 생태 명소</a>
        </div>
      </div>
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">축제 / 문화</a>

        <div class="navbar-dropdown">
          <a href="${path2 }/GetTourCateListCtrl.do?cate=D"  class="navbar-item" id="D">축제</a>
          <a class="navbar-item">체험/놀이</a>
          <a class="navbar-item">문화시설</a>
        </div>
      </div>
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">전주의 맛</a>

        <div class="navbar-dropdown">
          <a class="navbar-item" id="E">전통음식</a>
          <a class="navbar-item">향토 음식점</a>
          <a class="navbar-item">안심 음식점</a>
        </div>
      </div>
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">숙박 / 쇼핑</a>

        <div class="navbar-dropdown">
          <a href="${path2 }/GetTourCateListCtrl.do?cate=F"  class="navbar-item" id="F">숙박</a>
          <a href="${path2 }/GetTourCateListCtrl.do?cate=G"  class="navbar-item" id="G">쇼핑</a>
        </div>
      </div>
            <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">전주 이야기</a>

        <div class="navbar-dropdown">
          <a class="navbar-item" href="${path2 }/GetNoticeListCtrl.do">지금 전주</a>
          <a class="navbar-item">국제슬로시티 전주</a>
          <a class="navbar-item">랜선전주여행</a>
        </div>
      </div>
            <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">관광가이드</a>

		<div class="navbar-dropdown">
          <a class="navbar-item">대중교통 정보 조회</a>
          <a class="navbar-item">관광지도</a>
          <a class="navbar-item">관광택시</a>
          <a class="navbar-item">묻고 답하기</a>
        </div>
      </div>
    </div>

	<div class="navbar-end">
	  <div class="navbar-item">
	  	<c:if test="${empty sid }">
	 <div class="buttons">
	   <a href="${path2 }/user/joinForm.jsp" class="button is-primary">
	     <strong>회원가입</strong>
	   </a>
	   <a href="${path2 }/user/login.jsp" class="button is-light">
	     	로그인
	   </a>
	 </div>
	</c:if>
	<c:if test="${not empty sid }">
	 <div class="buttons">
	   <a href="${path2 }/UserInfoCtrl.do" class="button is-primary">
	     <strong>회원 정보</strong>
	   </a>
	   <a href="${path2 }/UserLogoutCtrl.do" class="button is-light">
	     	로그아웃
	   </a>
		<c:if test='${sid.equals("admin")}'>
		   <a href="${path2 }/AdminPageCtrl.do" class="button is-info">
		     <strong>관리자 페이지로</strong>
		   </a>
		</c:if>
	 </div>
	</c:if>
  </div>
</div>
  </div>
</nav>