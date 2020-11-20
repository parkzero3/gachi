<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device, initial-scale=1"/>  
<link rel="stylesheet" href ="resources/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/bootstrap.js"></script>
<link href="<c:url value="/css/style.css" />" rel="stylesheet" type=text/css>
<script src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
<style>
#creatortop img {
	widht: 100px;
	height: 50px;
	padding: 15px;
}

#creatortop {
	overflow: auto;
	height : 50px;
	line-height: 50px;
}

#creatortop a {
	width: 10%;
	text-decoration: none;
	color: white;
	float: right;
}

#creatorMenu>li, #creatorMenu>li a {
	color: white;
	text-decoration: none;
}
/*
#creatorMenu>li a:hover {text-decoration: none;color: red;}
*/
#creatorMenu {
	height: auto;
}

#headerDiv>ul>li {
	line-height: 50px;
}

#headerDiv>ul>li>ul {
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
	position: relative;
}

#headerDiv>ul>li>ul>li {
	height: 50px;
	line-height: 50px;
	text-align: center;
}

.submenu li {
	line-height: 50px;
	background-color: #437299;
	margin-left: 25px;
}

#headerDiv, #adminMenu {
	background-color: #437299;
	height: 50px;
	width: 100%;
	font-size: 20px;
}

#headerDiv {
	z-index: 1000;
	position: relative;
	width: 10%;
	float: left;
	overflow: hidden;
	height: auto;
}

#creatorMenu>li {
	line-height: 50px;
	color: white;
	margin-left: 15px;
}

.submenu {
	position: relative;
}

.container {
	margin-top: 50px;
	padding: 20px;
	animation: fadein 3s;
}

@font-face {
	font-family: 'NanumBarunpen';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumBarunpen.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

a, h1, li {
	font-family: 'NanumBarunpen';
}
@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
</style>

<title>크리에이터 관리 페이지</title>

</head>
<body style="background-color:#E4E6DA">
<div id="creatortop" style="background-color:#2d383f">
		<a href="/gachi">고객센터</a>
		<a href="/gachi">홈페이지 이동</a>
		<a href="/gachi">마이페이지</a>
		<a href="/gachi">로그아웃</a>
</div>
<div id="headerDiv">
	<ul id="creatorMenu">
		<li><a href="/gachi/creatorDashboard">대시보드</a></li>
		<li data-target="#menu1" data-toggle="collapse"><a href="#">클래스 관리</a>
		<div id="menu1" class="collapse">
			<ul class="submenu">
				<li><a href="/gachi/creatorMyClass">내 클래스 관리</a></li>
				<li><a href="/gachi/creatorVideo">동영상 관리</a></li>
	            <li><a href="/gachi/creatorStatClass">클래스 통계</a></li>
	             <li><a href="/gachi/creatorClassQuestion">클래스 문의 </a></li>
			</ul>
		</div>
		<li data-target="#menu2" data-toggle="collapse"><a href="#">개인정보 관리</a>
		<div id="menu2" class="collapse">
			<ul class="submenu">
				<li><a href="/gachi/creatorSettle">정산관리</a></li>
				<li><a href="/gachi/creatorEdit">개인정보 수정</a></li>
	            <li><a href="/gachi/creatorOut">회원 탈퇴</a></li>
			</ul>
		</div>
		</li>
		<li data-target="#menu3" data-toggle="collapse"><a href="#">공지/문의하기</a>
		<div id="menu3" class="collapse">
			<ul class="submenu">
				<li><a href="/gachi/creatorNotice">공지사항 </a></li>
	            <li><a href="/gachi/creator1on1">1:1문의 </a></li>
			</ul>
		</div>
		</li>
		<li><a href="/gachi/creatorGuide">이용안내</a></li>
		<li><a href="/gachi/testdb">데이터베이스테스트</a></li>
	</ul>
</div>