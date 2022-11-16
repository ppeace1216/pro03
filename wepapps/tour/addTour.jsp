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
  <title>관광 장소 등록</title>
  <jsp:include page="/head.jsp" />
</head>
<body>
  	<jsp:include page="${path }/header.jsp" />
<div class="container" id="content">
	<h2 class="title">관광 장소 등록</h2>
	<form name="frm1" id="frm1" action="${path1 }addTourCtrl" method="post">
		<div class="field">
		  <label class="label">관광 카테고리 분류</label>
		  <div class="control">
		    <div class="select">
		      <select>
		        <option>이달의 추천여행</option>
		        <option>역사 전통 명소</option>
		        <option>자연 생태 명소</option>
		        <option>숙박</option>
		      </select>
		    </div>
		  </div>
		</div>
		<div class="field">
		  <label class="label">제목</label>
		  <div class="control">
		    <input type="text" class="input" maxlength="120" name="title" id="title" placeholder="제목 입력" required />
		  </div>
		</div>
		
		<div class="field">
		  <label class="label">부제목</label>
		  <div class="control">
		    <input type="text" class="input" maxlength="120" name="subtitle" id="subtitle" placeholder="부제목 입력" />
		  </div>
		</div>
		
		<div class="field">
		  <label class="label">내용</label>
		  <div class="control">
		    <textarea rows="8" cols="100" name="content" id="content" class="textarea" required></textarea>
		  </div>
		</div>
		<div class="file">
		  <label class="file-label">
		    <input class="file-input" type="file" name="resume">
		    <span class="file-cta">
		      <span class="file-icon">
		        <i class="fas fa-upload"></i>
		      </span>
		      <span class="file-label">
		        Choose a file…
		      </span>
		    </span>
		  </label>
		</div>
		
		<div class="field is-grouped">
		  <div class="control">
		    <button type="submit" class="button is-link">등록</button>
		  </div>
		  <div class="control">
		    <button type="reset" class="button is-link is-light">취소</button>
		  </div>
		</div>
	</form>
	<script>
	function changeTourNo(){
		if(cate==""){
			alert("분류를 선택하시지 않으셨습니다.");
			document.frm1.cate.focus();
			return;
		}
		$.ajax({
			url:"${path1 }/NoLoadCtrl.do",
			type:"post",
			dataType:"json",
			success:function(data){
				consol.log(data.no);
				$("#tourno").val(cate+data.no);
			}
		})
	}		
	</script>
</div>
</body>
</html>