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
    <title>상세보기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  <style>
  	.top {clear:both; width:auto; margin:auto; text-align : center;}
  	.section { clear:both; width:1200px; margin:0 auto; }
	.section:after { content:""; display:block; clear:both; }
	.breadcrumb { clear:both; margin:100 auto; }
	.ttitle {clear:both; width:auto; margin:auto; text-align : center;}
  </style>
  </head>
  <body>
  <jsp:include page="/header.jsp" />
  <section class="section">
  	<div class="container">
  		<h2 class="title">이미지 추가하기</h2>
  			<form name="frm1" id="frm1" action="${path1 }/ModifyProTourCtrl.do" method="post" onsubmit="return tourCheck(this)">
  			<div id="con">
  				<table class="table">
  					<c:if test="{not empty list}">
  					<tr>
  						<c:forEach items="${list }" var="pic" varStatus="status">
  						<td>
  							<img src="upload/${pic.picname }" class="lazy" onerror="this.style.display='none'" alt="배너" />
  						</td>
  						</c:forEach>
  					</tr>
  					</c:if>
  					<c:if test="${empty list }">
  					<tr>
  						<td>해당 이미지가 없습니다.</td>
  					</tr>
  					</c:if>
  				</table>
  				<div class="field">
  					<div class="control">
  						<input type="hidden" name="pic_ck1" id="pic_ck1" value="no" />
  						<button type="button" class="button is-link" onclick="imgUpload(2)">이미지 추가</button>
  					</div>
  				</div>
  			</div>
  			<br><hr><br>
  			<h2 class="title">안내 수정하기</h2>
  				<table class="table">
  					<tbody>
  						<tr>
  							<th><label class="label"></label>번호</th>
			      			<td><input type="text" name="no" id="no" class="input" value="${dto.no }" readonly required /></td>
  						</tr>
  						<tr>
  							<th><label for="cate" class="label">카테고리</label></th>
  							<td>
  								<input type="hidden" name="cate" value="${dto.cate }" />
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
									<div class="field">
										<div class="select">
										  <select name="cate" id="cate" class="select" onchange="changeTourNo()" required>
										  	<option value="">선택</option>
										    <option value="A">이달의 추천여행</option>
										    <option value="B">역사 전통 명소</option>
										    <option value="C">자연 생태 명소</option>
										    <option value="D">축제</option>
										    <option value="E">전통음식</option>
										    <option value="F">숙박</option>
										    <option value="G">쇼핑</option>
										  </select>
										</div>
									</div>
  							</td>
  						</tr>
  						<tr>
  							<th><label class="label">글번호</label></th>
  							<td><p>${dto.tourno }</p>
  								<input type="hidden" name="tourno0" id="tourno0" value="${dto.tourno }" />
  								<input type="text" name="tourno" id="tourno" class="input" value="${dto.tourno }" readonly />
  							</td>
  						</tr>
  						<tr>
  							<th><label fo="title" class="label">제목</label></th>
  							<td>
  								<input type="text" name="title" id="title" class="input" value="${dto.title }" />
  							</td>
  						</tr>
  						<tr>
  							<th>부제</th>
  							<td>
  								<textarea class="textarea" name="subtitle" id="subtitle" cols="80" rows="8" maxlength="500" required>${dto.subtitle }</textarea>
  							</td>
  						</tr>
  						<tr>
  							<th>상세내용</th>
  							<td>
  								<textarea class="textarea" name="content" id="content" cols="80" rows="8" maxlength="500" required>${dto.content }</textarea>
  							</td>
  						</tr>
  						<tr>
					    	<th><label for="address1" class="label">주소</label></th>
					    	<td>
					      		<p>${dto.addr }</p>
					      		<input type="text" name="postcode" id="postcode" class="input" style="margin-bottom:10px;" placeholder="우편 번호">
						    	<button id="post_btn" onclick="findAddr()" class="button is-info">우편번호 검색</button>
					      		<input type="hidden" name="addr" id="addr" value="${dto.addr }" />
						    	<input type="text" name="address1" id="address1" class="input" style="margin-bottom:10px;" placeholder="기본 주소">
						    	<input type="text" name="address2" id="address2" class="input" style="margin-bottom:10px;" placeholder="상세 주소">
					    	</td>	
					    </tr>
  					</tbody>
  				</table>
  				<div class="buttons">
  					<a href="${path1 }/GetTourListCtrl.do" class="button is-info">목록</a>
  					<c:if test='${sid.equals("admin") }'>
  						<a href="${path1 }/GetTourdetailCtrl.do?no=${dto.no}" class="button is-danger">돌아가기</a>
  						<button type="submit" class="button is-warning">수정</button>
  					</c:if>
  				</div>
  			</form>
  	</div>
  </section>
  <script>
  function imgUpload(pos){
	  var tourno = $("#tourno").val();
	  var win1 = window.open("${path1 }/tour/imgUpload.jsp?no="+pos+"&tourno="+tourno,"win","width=850, height=400")
  }
  function changeTourNo(){
	  if($("#cate").val()=="" || $("#cate").val()==$("#cate0").val()){
		  $("#tourno").val($("#tourno0").val());
	  } else {
		  listLoading();
	  }
  }
  function listLoading(){
	  $.ajax({
		 url:"${path1 }/NoLoadCtrl.do",
		 type:"post",
		 dataType:"json",
		 success:function(data){
			 console.log(data.no);
			 $("#tourno").val($("#cate").val()+data.no);
		 }
	  });
  }
  </script>
  <script>
	function findAddr() {
		new daum.Postcode({
			oncomplete: function(data) {
				console.log(data);
				var roadAddr = data.roadAddress;
				var jibunAddr = data.jibunAddress;
				document.getElementById("postcode").value = data.zonecode;
				if(roadAddr !== '') {
					document.getElementById("address1").value = roadAddr;				
				} else if(jibunAddr !== ''){
					document.getElementById("address1").value = jibunAddr;
				}
				document.getElementById("address2").focus();
				return;
			}
		}).open();
	}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>