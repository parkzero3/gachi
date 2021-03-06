<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<script>
$(function(){

	if('${status}' != '') {
		$("#status").val("${status}");
	} else{
		$("#status").val('');
	}
	if('${search}' != '') {
		$("#search").val("${search}");
	}
	$("#frm_submit").click(function(){
		var url = "/adminCreator";
		var data = "status=" + $("#status").val() + "&search=" + $("#search").val().trim();+"&now=" + 1;
		$.ajax({
			url : url,
			data : data,
			type : "POST",
			dataType : "json",
			success: function(data){
				var result = data.result;
				console.log(result);
			},error:function(){
				var result = data.result;
				console.log(result);
			}
		});
		
	});
});

function postPageMove(now) {
	console.log(now);
	return false;
	var url = "/adminCreator";
	var data = "status=" + $("#status").val() + "&search=" + $("#search").val().trim(); + "&now=" + now;
	$.ajax({
		url : url,
		data : data,
		type : "POST",
		dataType : "json",
		success: function(data){
			var result = data.result;
			console.log(result);
		},error:function(){
			var result = data.result;
			console.log(result);
		}
	});
}
</script>
<div class="container ad_font">
<h1>크리에이터 관리</h1>
<div id="ad_search_header">
<div>
	<ul id="cr_member_info">
		<li>●활동 : ${countNowCreator }명</li>
		<li>●탈퇴 : ${countDeletedCreator}명</li>
		<li>●누적 : ${countAllCreator }명</li>
	</ul>
</div>
<div>
	<form action="adminCreator" method="post" id="frm">
		<!-- <select name="">
			<option>전체</option>
			<option>크리에이터명</option>
			<option>이름</option>
			<option>이메일</option>
			<option>연락처</option>
		</select> -->
		<select name="status" id="status">
			<option value="">전체</option>
			<option value="승인">승인</option>
			<option value="미승인">미승인</option>
			<option value="승인거절">승인거절</option>
			
		</select>
		<input type="text" id="search" name="search"/>
		<input type="hidden" id="now" value="${nowPage }"/>
		<input type="submit" id="frm_submit" class="btn" value="검색" />
		</form>
</div>
</div>
<div style="margin-bottom:20px;">
<ul id="cr_member_lst" class="text-center">
	<li>번호</li>
	<li>아이디</li>
	<li>크리에이터명</li>
	<li>이름</li>
	<li>연락처</li>
	<li>가입일</li>
	<li>탈퇴일</li>
	<li>승인여부</li>
	
	<c:forEach var="creatorList" items="${creatorList }">
	<li>${creatorList.rownum }</li>
	<li><a href="/gachi/adminCreatorView?userid=${creatorList.userid }">${creatorList.userid }</a></li>
	<li>${creatorList.nickname}</li>
	<li>${creatorList.username }</li>
	<li>${creatorList.tel }</li>
	<li>${creatorList.signupdate }</li>
	<li><c:if test="${creatorList.deleted eq '탈퇴'}">${creatorList.withdrawdate }</c:if><c:if test="${creatorList.deleted ne '탈퇴'}"> </c:if></li>
	<li>${creatorList.creator_state}

	</c:forEach>
</ul>
</div>	
	<div id="paging">
	<ul class="pagination justify-content-center" style="margin-top: 50px;">

			<c:if test="${(nowPage % 5) eq 0}">
				<c:set var="startPage" value="${nowPage-4 }"/>
			</c:if>
			<c:if test="${(nowPage % 5) ne 0}">
				<fmt:parseNumber var="tmp" integerOnly="true" value="${nowPage/5}"/>
				<fmt:parseNumber var="startPage" integerOnly="true" value="${tmp*5+1}"/>
			</c:if>
			
			<c:if test="${method eq 'get' }">
				<c:if test="${startPage ne 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminCreator?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${(startPage+i) <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminCreator?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminCreator?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
			<c:if test="${method eq 'post' }">
				<c:if test="${startPage ne 1}">
					<li class="btn">
						<a class="btn" href="/gachi/adminCreator?now=${nowPage-1}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${(startPage+i) <= lastPage }">
					<li class="btn">
						<a class="btn" href="/gachi/adminCreator?now=${startPage+i }">${startPage+i }</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${(lastPage - startPage) > 5}">
					<li class="btn">
						<a class="btn" href="/gachi/adminCreator?now=${nowPage+1}">Next</a>
					</li>
				</c:if>
			</c:if>
	</ul>
</div>
</div>