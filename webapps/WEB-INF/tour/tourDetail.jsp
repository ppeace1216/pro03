<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
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
  <div class="top">
  	<br><br><br>
  	<h1 class="title is-1">
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
  	</h1>
  	<br><hr>
  </div>
  	<nav class="breadcrumb is-centered" aria-label="breadcrumbs">
	  <ul>
	    <li><a href="${path1 }/">Home</a></li>
	    <li><a href="${path1 }/GetTourCateListCtrl.do?cate=${dto.cate }">
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
	    </a></li>
	    <li class="is-active"><a href="#" aria-current="page">${dto.title }</a></li>
	  </ul>
	</nav>
	<hr>
  <section class="section">
    <div class="container">
    <h2 class="subtitle is-2">${dto.title }</h2>
    <span>글번호 <strong>${dto.tourno }</strong></span>&nbsp&nbsp&nbsp
    <span>작성자 <strong>관리자</strong></span>&nbsp&nbsp&nbsp
    <span>작성일
    	<strong>
    		<fmt:parseDate value="${dto.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
			<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
		</strong>
	</span>&nbsp&nbsp&nbsp
    <span>조회수 <strong>${dto.visited }</strong></span><br><hr>
      <div id="con">
		<table class="table">
		   <tbody>
		    <c:if test="${not empty list }">
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
		  </tbody>
		</table>
	  </div>
	  	<table class="table">
	  		<tbody>
	  			<tr>
	  				<td><h4 class="subtitle is-4">${dto.subtitle }</h4></td>
	  			</tr>
	  			<tr>
	  				<td><p>${dto.content }</p></td>
	  			</tr>
	  			<tr>
	  				<th>
	  				<span class="icon has-text-info">
					  <i class="fas fa-info-circle"></i>
					</span>
					  위치
					</th>
	  				<td>
	  					${dto.addr }
		    			<input type="hidden" name="addr" id="addr" value="${dto.addr }" />
		    			<input type="hidden" name="title" id="title" value="${dto.title }" />
		    		</td>
	  			</tr>
	  		</tbody>
	  	</table>
	  	<div style="clear:both; margin-bottom:20px; padding-bottom:20px; ">
			<div id="map" style="margin-left:120px;	margin-top:50px; width:800px;height:600px; background:white; "></div>
			<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<!-- https://developers.kakao.com/ 회원가입 후 -> 내 애플리케이션 -> 애플리케이션 추가 -> 추가된 해당 앱을 클릭하면 발급받은  API키를 확인할 수 있음  -->			
			<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=e28d5d3e18d7c2e7143fdcdf4547cec7&​libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { //128.433182, 34.8544227
			        center: new kakao.maps.LatLng(34.8544227, 128.433182), // 지도의 중심좌표
			        level: 7 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch($("#addr").val(), function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
					
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$('#place').val()+'</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>
		</div>
		<div class="buttons">
		  <a href="${path1 }/GetTourListCtrl.do" class="button is-info">전체 목록</a>
		  <a href="${path1 }/GetTourCateListCtrl.do?cate=${dto.cate }" class="button is-info">카테고리 목록</a>
		  <c:if test='${sid.equals("admin") }'>
			  <a href="${path1 }/DelTourCtrl.do?no=${dto.no }" class="button is-danger">장소 삭제</a>
			  <a href="${path1 }/ModifyTourCtrl.do?no=${dto.no }" class="button is-warning">장소 수정</a>
		  </c:if>
		</div>
    </div>
  </section>
  <section class="section">
    <div class="container">
      <h1 class="title">이용 후기</h1>
		<table class="table" id="tb1">
			<thead>
				<tr>
					<th>장소</th><th>내용</th><th>작성자</th><th>작성일</th><th></th>
				</tr>
			</thead>
			<tbody>
		   <c:forEach items="${list }" var="dto" varStatus="status">
		    <tr>
		      <td>
		      	<input type="hidden" name="no" id="no" value="${dto.no }" />
		      	<h3>${dto.place }</h3>
		      	<br>
		      	<img src="${path1 }/upload/${dto.imgSrc }" alt="${dto.tourno }" style="width:40px;" />
		      </td>
		      <td>
		      	<div>${dto.content }</div>
		      </td>
		      <td>
		      	<div>
		      		<c:set var="string1" value="${dto.id }"/>
		      		<c:set var="length" value="${fn:length(string1)}"/>
		      		<c:set var="string2" value="${fn:substring(string1, 0, length-3)}" />
		      		${string2}<c:forEach var="i" begin="1" end="${length - 2 }"><span>*</span></c:forEach>
		      	</div>
		      	<div>
		      		<input type="hidden" name="star" id="star" />
		      		<div class="star_data" style="width:${dto.star*20 }px"></div>
		      	</div>
		      </td>
		      <td>
		      	<fmt:parseDate value="${dto.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
		      	<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd" />
		      </td>
		      <td>
		      	<c:if test='${sid.equals("admin")}'>
		      		<a href="${path1 }/DelImpressCtrl.do?no=${dto.no }" class="button is-success">글 삭제</a>
		      	</c:if>
		      </td>	
		    </tr>
		    </c:forEach>
			<c:if test="${empty list }">
		    <tr>
		    	<td colspan="4">이용 후기 목록이 없습니다.</td>
		    </tr>
		    </c:if>
		  </tbody>
		</table>
		<hr style="height:4px; background-color:#ccc;">
		<c:if test='${not empty sid || sid.equals("admin")}'>		
		<table class="table">
			<tbody>
				<tr>
					<td style="width:160px">
						<div class="select" style="width:150">
						  <select name="cate" id="cate" class="select" onchange="changeTourNo()" style="width:150" required>
						  	<option value="">선택</option>
						    <option value="A">관광</option>
						    <option value="B">체험</option>
						    <option value="C">행사</option>
						    <option value="D">축제</option>
						    <option value="E">숙박</option>
						    <option value="F">음식</option>
						    <option value="G">쇼핑</option>
						    <option value="H">기타</option>
						  </select>
						</div>
						<br>
						<div class="select" style="width:150">
							<select name="tourno" id="tourno" style="width:150" required>
								<option value="">선택</option>
								
							</select>
						</div>
					</td>
					<td style="width:100px">
						<input type="radio" name="star" id="star10" class="hidden_item" value="5" checked>
						<input type="radio" name="star" id="star9" class="hidden_item" value="4.5">
						<input type="radio" name="star" id="star8" class="hidden_item" value="4">
						<input type="radio" name="star" id="star7" class="hidden_item" value="3.5">
						<input type="radio" name="star" id="star6" class="hidden_item" value="3">
						<input type="radio" name="star" id="star5" class="hidden_item" value="2.5">
						<input type="radio" name="star" id="star4" class="hidden_item" value="2">
						<input type="radio" name="star" id="star3" class="hidden_item" value="1.5">
						<input type="radio" name="star" id="star2" class="hidden_item" value="1">
						<input type="radio" name="star" id="star1" class="hidden_item" value="0.5">
						<input type="hidden" name="starpoint" id="starpoint" value="">
						<div id="star_group">
							<div id="stardate">
								<div id="starrate"></div>
							</div>
							<div class="star_btn" id="star_btn">
								<label for="star1"></label>
								<label for="star2"></label>
								<label for="star3"></label>
								<label for="star4"></label>
								<label for="star5"></label>
								<label for="star6"></label>
								<label for="star7"></label>
								<label for="star8"></label>
								<label for="star9"></label>
								<label for="star10"></label>
							</div>
						</div>
					</td>
					<td style="min-width:400px">
						<input type="text" name="content" id="content" class="input" placeholder="남기고 싶은 말을 쓰시오." required>
					</td>
					<td>
						<div class="buttons">
						  <button type="button" class="button is-danger" onclick="addImpress()">글 등록</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		</c:if>
    </div>
    <script>
    $(document).ready(function(){
    	
    	$("#content").on("click", function(){
    		if($("#tourno").val()==""){
    			alert("방문 장소를 먼저 고르시기 바랍니다.");
    		}
    	});
    	
    	$("#star_btn label").click(function(){
    		if($("#tourno").val()==""){
    			alert("방문 장소를 먼저 고르시기 바랍니다.");
    			$("#tourno").focus();
    		} else {
    			$("#starpoint").val(($(this).index()+1)/2);
    		}
    	});
    });
    
    function changeTourNo(){
    	var ct = $("#cate").val(); 
    	if(ct==""){
    		alert("카테고리를 먼저 선택하시기 바랍니다.");
    		return;
    	}
    	var params = {	cate : ct	}
		$.ajax({
			url:"${path1 }/CateLoadCtrl.do",
			type:"POST",
			enctype:"application/json",
			data:params,
			datatype:"json",
			success:function(result){
				$("#tourno").empty();
				$("#tourno").append("<option value=''>선택</option>");
				var trans = result;
				console.log(trans);
				$.each(trans, function(key, value){
					if(key=="result"){
						for(var i=0;i<value.length;i++){
							$("#tourno").append("<option value='"+value[i].tourno+"'>"+value[i].place+"</option>");
						}
					}
				});				
			}
		});
    }
    function addImpress(){
    	var ct = $("#cate").val();
    	var tour = $("#tourno").val();
    	var con = $("#content").val();
    	var starpoint = $("#starpoint").val();
    	if(ct==""){
    		alert("카테고리를 먼저 선택하시기 바랍니다.");
    		return;
    	}
    	if(tour==""){
    		alert("방문 장소를 먼저 선택하시기 바랍니다.");
    		return;
    	}
    	if(con==""){
    		alert("내용을 입력하시기 바랍니다.");
    		return;
    	}
    	if(starpoint==""){
    		alert("별점을 먼저 선택하여 주시기 바랍니다.");
    		return;
    	}
    	var params = {	cate : ct, tourno : tour, content : con, star :	starpoint }
		$.ajax({
			url:"${path1 }/AddImpressCtrl.do",
			type:"POST",
			enctype:"application/json",
			data:params,
			datatype:"json",
			success:function(result){
				var trans = result;
				location.href = "${path1 }/GetImpressListCtrl.do";				
			}
		});
    }
    //href="${path1 }/notice/AddImpressCtrl.do" 
    </script>
  </section>
  <jsp:include page="/footer.jsp"></jsp:include>
  </body>
</html>