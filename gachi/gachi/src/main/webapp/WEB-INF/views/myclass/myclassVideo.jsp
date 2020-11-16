<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/bootstrap.css" type="text/css" />
<title>Insert title here</title>
<style>
 	a:link, a:visited, a:hover{text-decoration:none;color:#000;}
 	a:hover{font-weight:bold;}
 	ul{margin:0;padding:0;list-style-type:none;}
	body{margin:0;padding:0;}
	
	#myclassVideoMain{width:70%;height:100vh;overflow:auto;float:left;	}
	#myclassVideoLst{width:30%;height:100vh;overflow:auto;border-left:1px solid gray;overflow-x:hidden;}
	
	/*상단 - 제목*/
	#myclassVideoTop{padding:0;margin:0;height:7.5%;font-size:1.5em;line-height:50px;}
	#myclassVideoTop>div:first-child{height:100%;margin:0;width:15%;background-color:#F4BFA9;float:left;text-align:center;}
	#myclassVideoTop>div:last-child{height:100%;margin:0;width:85%;background-color:#eee;float:left;overflow:auto;padding-left:20px;}
	
	/*영상재생*/
	#myclassVideoView{padding:10px;height:85%;overflow:hidden;}
	#myclassVideoView img{width:100%;height:100%;object-fit:cover;}
	
	/*하단 - 버튼*/
	#myclassVideoBtm{height:7.5%;background-color:#F4BFA9;text-align:center;}
	#myclassVideoBtm>button{margin:5px 10px;}
	
	/*목차*/
	#myclassVideoLst>label:first-child{font-size:1.5em;margin:10px 20px;}
	#myclassVideoLst>label:nth-child(2){width:30px;height:30px;float:right;margin:10px;font-size:1.3em;}
	#myclassVideoLst>label:nth-child(3){width:100%;font-size:1.5em;margin:10px 20px;}
	#myclassVideoLst>label:nth-child(4){width:100%;margin-left:20px;}
	#myclassVideoLst>label:nth-child(5){margin-left:20px;}
	
	#myclassVideoLst>ul>li>label{line-height:40px;padding:0 20px;width:100%;background-color:#eee;}
	#myclassVideoLst ol>li{line-height:20px;margin:20px 0;}
	#myclassVideoLst ol>li:last-child{margin-bottom:40px;}
	#myclassVideoLst ol label{padding-right:10px;float:right;color:gray;font-size:1em;}
	
	
</style>
</head>
<body>
	<div id="myclassVideoMain">
		<div id="myclassVideoTop">
			<div><a href="/gachi/myclassView">내 학습표</a></div>
			<div>프랑스 자수 클래스를 소개합니다!</div>
		</div>
		<div id="myclassVideoView">
			<img src="/gachi/img/video_test_image.png"/>
		</div>
		<div id="myclassVideoBtm">
			<button type="button" class="btn btn-light">이전 영상</button>
			<button type="button" class="btn btn-light">다음 영상</button>
		</div>
	</div>
	<div id="myclassVideoLst">
		<label>목차</label>
		<label class="badge badge-secondary">X</label>
		<label>카모마일 프랑스 자수</label>
		<label>수강기한 : 20.11.01 ~ 21.01.31</label>
		<label>진도율 : 0.00%</label>
		<label>수강시간 : 0분</label>
		<hr/>
		<ul>
			<li>
				<label>프랑스 자수 클래스 소개</label>
				<ol>
					<li><a href="/gachi/myclassVideo">프랑스 자수 클래스를 소개합니다!<label>02:00</label></a></li>
					<li><a href="/gachi/myclassVideo">클래스 준비물과 주의사항에 대해 알아볼까요?<label>04:00</label></a></li>
				</ol>
			</li>
			<li>
				<label>01 프랑스 자수의 기초</label>
				<ol>
					<li><a href="#">실을 다루는 방법과 매듭짓는 방법</a></li>
					<li><a href="#">작품에 사용될 5가지 스티치 연습하기</a></li>
				</ol>
			</li>
			<li>
				<label>02 베개 커버에 수놓기</label>
				<ol>
					<li><a href="#">곰돌이 수놓기1</a></li>
					<li><a href="#">곰돌이 수놓기2</a></li>
				</ol>
			</li>
			<li>
				<label>03 자수 블랭킷 만들기</label>
				<ol>
					<li><a href="#">블랭킷 도안선 그리고 위치잡기</a></li>
					<li><a href="#">달모양 수놓기</a></li>
					<li><a href="#">가글 보틀 수놓기</a></li>
					<li><a href="#">잠옷입은 곰돌이 수놓기</a></li>
					<li><a href="#">탁상조명 수놓기</a></li>
				</ol>
			</li>
			<li>
				<label>04 완성</label>
				<ol>
					<li><a href="#">세탁방법 알아보기</a></li>
					<li><a href="#">상쾌한 아침을 기다려요!</a></li>
				</ol>
			</li>
		</ul>
	</div>
</body>
</html>