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
          <a class="navbar-item">이달의 추천여행</a>
          <hr class="navbar-divider">
          <a class="navbar-item">역사 전통 명소</a>
          <a class="navbar-item">자연 생태 명소</a>
        </div>
      </div>
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">축제 / 문화</a>

        <div class="navbar-dropdown">
          <a class="navbar-item">축제</a>
          <a class="navbar-item">체험/놀이</a>
          <a class="navbar-item">문화시설</a>
        </div>
      </div>
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">전주의 맛</a>

        <div class="navbar-dropdown">
          <a class="navbar-item">전통음식</a>
          <a class="navbar-item">향토 음식점</a>
          <a class="navbar-item">안심 음식점</a>
        </div>
      </div>
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">숙박 / 쇼핑</a>

        <div class="navbar-dropdown">
          <a class="navbar-item">숙박</a>
          <a class="navbar-item">쇼핑</a>
        </div>
      </div>
            <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">전주 이야기</a>

        <div class="navbar-dropdown">
          <a class="navbar-item" href="${path2 }/GetNoticeCtrl.do">지금 전주</a>
          <a class="navbar-item">국제슬로시티 전주</a>
          <a class="navbar-item">랜선 전주여행</a>
        </div>
      </div>
            <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">관광가이드</a>

		<div class="navbar-dropdown">
          <a class="navbar-item">대중교통 정보 조회</a>
          <a class="navbar-item">관광지도</a>
          <a class="navbar-item">관광택시</a>
          <a class="navbar-item">관광안내소</a>
        </div>
      </div>
    </div>

    <div class="navbar-end">
      <div class="navbar-item">
        <div class="buttons">
          <a class="button is-light" href="${path2 }/user/login.jsp">로그인</a>
          <a class="button is-primary" href="${path2 }/user/joinForm.jsp">
            <strong>회원 가입</strong>
          </a>
          
        </div>
      </div>
    </div>
  </div>
</nav>