<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>

<div class="container">
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
	<form action="">
		<select name="#">
			<option>전체</option>
			<option>크리에이터명</option>
			<option>이름</option>
			<option>이메일</option>
			<option>연락처</option>
		</select>
		<select name="#">
			<option>전체</option>
			<option>승인</option>
			<option>미승인</option>
			<option>승인거절</option>
			
		</select>
		<input type="text" id="" name=""/>
		<input type="submit" class="btn" value="검색" />
		</form>
</div>
</div>
<div style="margin-bottom:20px;">
<ul id="cr_member_lst" class="text-center">
	<li>번호</li>
	<li>카테고리</li>
	<li>크리에이터명</li>
	<li>이메일</li>
	<li>연락처</li>
	<li>가입일</li>
	<li>탈퇴일</li>
	<li>승인여부</li>
	
	<c:forEach var="creatorList" items="${creatorList }">
	<li>${creatorList.rownum }</li>
	<li>${creatorList.category}</li>
	<li>${creatorList.nickname}</li>
	<li><a href="/gachi/adminCreatorView">${creatorList.userid }</a></li>
	<li>${creatorList.tel }</li>
	<li>${creatorList.signupdate }</li>
	<li><c:if test="${creatorList.withdrawdate eq null}">x</c:if><c:if test="${creatorList.withdrawdate ne null}">${creatorList.withdrawdate }</c:if></li>
	<li><c:if test="${creatorList.creator_state eq 0 }">미승인</c:if>
		<c:if test="${creatorList.creator_state eq 1 }">승인</c:if>
		<c:if test="${creatorList.creator_state eq 2 }">승인거절</c:if></li>
	</c:forEach>
</ul>
</div>	
<div id="paging">
	<ul>
		<li>prev</li>
		<li>1</li>
		<li>2</li>
		<li>3</li>
		<li>4</li>
		<li>5</li>
		<li>next</li>
	</ul>
</div>
</div>