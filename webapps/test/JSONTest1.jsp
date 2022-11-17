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
<meta charset="UTF-8">
<title>JSON Test1</title>
<jsp:include page="/head.jsp" />
</head>
<body>
	<h2 class="title">JSON(JavaScript Object Notation)</h2>
	<p>자바스크립트의 객체 형태로 데이터를 교환하는 방식</p>
	<br><hr><br>
	<div id="js">
	</div>
	<script>
	$(document).ready(function(){
		//JSON = java MAP
		var obj = {name:"박평화", age:28};
		$("#js").html("<p>이름 : " + obj.name+"</p>" );
		$("#js").append("<p>나이 : " + obj.age+"</p>" );
	});
	</script>
	<br><hr><br>
	<h2 class="title">JSON 데이터 받기</h2>
	<div id="con">
	</div>
	<script>
	$(document).ready(function(){
		$.ajax({
			url:"${path1 }/JSONTest1.do", //전송되어질 곳
			type:"post",		//전송방식
			dataType:"json",	//데이터반환방식
			success:function(result){
				console.log(result.result);
				var test = result.result;
				$("#con").html(test);	//뿌려주는곳
			}
		})
	});
	</script>
	<br><hr><br>
	<div id="con2">
	</div>
	<script>
	$(document).ready(function(){
		var params = {name : "박평화" }
		$.ajax({
			url:"${path1 }/JSONTest2.do", //아이디가 전송되어질 곳
			type:"post",		//전송방식
			dataType:"json",	//데이터반환방식
			data:params,		//전송방식이 포스트인 경우 객체로 묶어서 전송
			success:function(data){
				console.log(data);
				var user = data;	//true 또는 false를 받음
				$("#con2").html("이름 : "+user.name+", 점수 : "+user.point);	//뿌려주는곳
			}
		})
	});
	</script>
	<br><hr><br>
	<div id="con3">
	</div>
	<script>
	$(document).ready(function(){
		$.ajax({
			url:"${path1 }/JSONTest3.do", //아이디가 전송되어질 곳
			type:"post",		//전송방식
			enctype:"UTF-8",
			dataType:"json",	//데이터반환방식
			processData:false,
			contentType:false, 
			cache:false,
			success:function(data){
				var trans = data;
				console.log(trans.data);
				var tg = "";
				$.each(trans, function(key, value){
					if(key=="data"){
						for(var i=0;i<value.length;i++){
							console.log(value[i].name);
							tg = tg +"<div>이름 : "+value[i].name+"</div>";
							tg = tg +"<div>점수 : "+value[i].point+"</div>";
						}
					}
				});
				$("#con3").html(tg);
			}
		});
	});
	</script>
	
</body>
</html>