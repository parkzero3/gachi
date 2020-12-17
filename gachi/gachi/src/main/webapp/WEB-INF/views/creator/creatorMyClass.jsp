<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
 <style>
	#search_area{
		margin-top:20px;
		margin-bottom:20px;
		border:3px solid #437299;
		border-radius:10px;
		overflow: auto;
	}
	#search_area{
		padding-left:0px;
		overflow: auto;
	}
	#search_area h3{
		margin-top:20px;
		text-align:center;
	}
	#search_area li{
		margin:5px 0px;
		float:left;
	}
	#search_area>li:nth-child(2n+1){
		width:20%;
		text-align:center;
	}
	#search_area>li:nth-child(2n){
		width:80%;
		text-align:left;
	}
	 #paging{
	 	overflow: auto;
	 }
	 select{
	 	height:30px;
	 }
 </style> 
 <script>
 	$(()=>{
 		$("#startDate").val("${startDate}");
		$("#endDate").val("${endDate}");
		$("#class_state").val("${class_state}").attr("selected", "selected");
		$("#dateOption").val("${dateOption}").attr("selected", "selected");
		$("#category").val("${category}").attr("selected", "selected");
		$("#search").val("${search}");
		
		
 		
 	});
 </script>
 <div class="container text-center ad_font">
 	<h1>클래스 관리</h1>
	<form method="post" action="adminClass">
	<h3>검색옵션</h3>
			<ul id="search_area">
				<li>날짜옵션</li>
				<li>	
					<select id="dateOption" name="dateOption">
						<option value="">전체</option>
						<option value="allow">등록일</option>
						<option value="signup">등록신청일</option>
					</select>	
					<input type="date" id="startDate" name="startDate">&nbsp;~&nbsp;<input type="date" name="endDate" id="endDate">
				</li>
				<li>카테고리</li>
				<li>
					<select id="category" name="category">	
						<option value="">전체</option>
						<option value="공예/창작">공예/창작</option>
						<option value="요리">요리</option>
						<option value="미술">미술</option>
						<option value="음악">음악</option>
						<option value="라이프스타일">라이프스타일</option>
						<option value="운동">운동</option>
						<option value="사진/영상">사진/영상</option>
					</select>			
				</li>
				<li>클래스상태</li>
				<li>
					<select id="class_state" name="class_state">
						<option value="">전체</option>
						<option value="등록대기">등록대기</option>
						<option value="판매중">판매중</option>
						<option value="종료">종료</option>
					</select>
				</li>
				<li>검색</li>
				<li><input type="text" id="search" name="search"/></li>
				<li style="width:100%;text-align:center">
					<input type="submit" id="searchBtn" class="btn" value="조회"/>
				</li>	
			</ul>	
</form>
	<ul id="ad_class_lst">
		<li>클래스코드</li>
		<li>카테고리</li>
		<li>클래스명</li>
		<li>크리에이터명</li>
		<li>누적수강생</li>
		<li>등록신청일</li>
		<li>등록일</li>
		<li>상태</li>
		
		<c:forEach var="result" items="${result}">
		<li>${result.code }</li>
		<li>${result.category }</li>
		<li class="wordCut"><a href="/gachi/adminClassView?code=${result.code}">${result.class_name}</a></li>
		<li class="wordCut">${result.nickname }</li>
		<li>${result.total_student }</li>
		<li>${result.signup }</li>
		<li>${result.allow }</li>
		<li>${result.class_state }</li>
		</c:forEach>	
	</ul>
	<div class="cr_MyClass_list_menu">
		<button onclick="location.href='/gachi/creatorMyClassWrite'" class="btn">강좌개설신청</button>
	</div>
	<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">
			<c:if test="${nowPage % 5 eq 0}">
				<c:set var="startPage" value="${nowPage-4 }"/>
			</c:if>
			<c:if test="${nowPage % 5 ne 0}">
				<fmt:parseNumber var="startPage" integerOnly="true" value="${(nowPage/5)*5}"/>
			</c:if>
			
			<c:if test="${method eq 'get' }">
				<c:if test="${startPage ne 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminClass?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${startPage+i <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminClass?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminClass?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			<c:if test="${method eq 'post' }">
				<c:if test="${startPage ne 1}">
					<li class="btn">

						<a class="btn" href="/gachi/adminClass?now=${nowPage-1}">Prev</a>

					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${startPage+i <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminClass?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminClass?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			
	</ul>
</div>
</div>