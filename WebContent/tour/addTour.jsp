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
		  <label class="label">Name</label>
		  <div class="control">
		    <input class="input" type="text" placeholder="Text input">
		  </div>
		</div>
		
		<div class="field">
		  <label class="label">Username</label>
		  <div class="control has-icons-left has-icons-right">
		    <input class="input is-success" type="text" placeholder="Text input" value="bulma">
		    <span class="icon is-small is-left">
		      <i class="fas fa-user"></i>
		    </span>
		    <span class="icon is-small is-right">
		      <i class="fas fa-check"></i>
		    </span>
		  </div>
		  <p class="help is-success">This username is available</p>
		</div>
		
		<div class="field">
		  <label class="label">Email</label>
		  <div class="control has-icons-left has-icons-right">
		    <input class="input is-danger" type="email" placeholder="Email input" value="hello@">
		    <span class="icon is-small is-left">
		      <i class="fas fa-envelope"></i>
		    </span>
		    <span class="icon is-small is-right">
		      <i class="fas fa-exclamation-triangle"></i>
		    </span>
		  </div>
		  <p class="help is-danger">This email is invalid</p>
		</div>
		
		<div class="field">
		  <label class="label">Message</label>
		  <div class="control">
		    <textarea class="textarea" placeholder="Textarea"></textarea>
		  </div>
		</div>
		
		<div class="field">
		  <div class="control">
		    <label class="checkbox">
		      <input type="checkbox">
		      I agree to the <a href="#">terms and conditions</a>
		    </label>
		  </div>
		</div>
		
		<div class="field">
		  <div class="control">
		    <label class="radio">
		      <input type="radio" name="question">
		      Yes
		    </label>
		    <label class="radio">
		      <input type="radio" name="question">
		      No
		    </label>
		  </div>
		</div>
		
		<div class="field is-grouped">
		  <div class="control">
		    <button class="button is-link">Submit</button>
		  </div>
		  <div class="control">
		    <button class="button is-link is-light">Cancel</button>
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