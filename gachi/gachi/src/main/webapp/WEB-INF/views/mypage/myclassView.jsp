<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
	/* 클래스 보기 */
	
	#myclassView{
		overflow:auto;
		margin:10px 50px 40px;
	}
	#myclassView>li{
		width:45%;
		float:left;
		height:30px;
		overflow:hidden;
		margin:5px 20px;
		line-height:25px;
	}
	#myclassView>li:first-child{
		height:300px;
	}
	#myclassView>li:first-child img{
		width:100%;
		height:100%;
		object-fit: cover;
	}
	#myclassView>li:nth-child(2){
		margin-top:20px;
		font-size:1.5em;
	}
	#myclassView>li:nth-child(2)>label:first-child{
		font-size:0.5em;
		margin-right:10px;
	}

	#myclassView>li:nth-child(4){
		width:15%;
		float:left;
	}
	#myclassView>li:nth-child(5){
		width:30%;
	}
	#myclassView>li:nth-child(6) progress{
		width:100%;
	}
	#myclassView>li:nth-child(7){
		height:40px;
	}
	#myclassView>li:nth-child(7)>button{
		background-color:#ABCEE3;
	}
	#myclassView>li:last-child{
		height:40px;
		magrin:0;
		padding:0;
	}
	#myclassView>li:last-child>button{
		width:49%;
		background-color:#eee;
		color:#000;
		margin:0;
	}
	#myclassView>li:last-child>button:first-child{
		float:left;
		margin-right:5px;
	}

	/* 클래스썸네일 */
	#myclassView img{
		width:400px;
		height:300px;
		object-fit:cover;
	}
	
	/* 클래스 목차 */
	ol>li{
		list-style-type:decimal;
	}
	#myclassVideoLst label{
		font-size:1.3em;
	}
	#myclassVideoLst ul{
		overflow:auto;
		margin-bottom:50px;
	}
	#myclassVideoLst>ul>li>label{
		padding:0 20px;
		color:gray;
		width:100%;
		background-color:#fbdfd3;
	}
	#myclassVideoLst ol>li{
		line-height:20px;
		margin:20px 0;
	}
	#myclassVideoLst ol>li:last-child{
		margin-bottom:40px;
	}
	#myclassVideoLst ol label{
		float:right;
		color:gray;
		font-size:1em;
		margin-right:20px;
	}
	
	/* 수강후기 */
	#myclassReview{
		margin-bottom:50px;
		overflow:auto;
	}
	#myclassReview ul{
		overflow:auto;
	}
	#myclassReview>label{
		font-size:1.3em;
	}	
	#myclassReview>button{
		float:right;
		background-color:#ABCEE3;
	}	
	#myclassReview li{
		float:left;
		text-align:center;
		padding:0 10px;
	}
	#myclassReview li:first-child{
		color:#F4BFA9;
	}
	#myclassReview li:nth-child(2){
		text-align:left;
		font-weight:bold;
		color:gray;
	}
	#myclassReview li:nth-child(3),
	#myclassReview li:nth-child(4){
		font-size:0.8em;
	}
	#myclassReview li:last-child{
		width:100%;
		text-align:left;
		padding:15px;
	}
	
	#myclassReviewPg a{
		color:#ABCEE3;
		margin-bottom:50px;
	}
	
	/* 질문게시판 */
	#myclassQna{
		margin-bottom:50px;
		overflow:auto;
	}
	#myclassQna>ul{
		overflow:auto;
		margin-bottom:20px;
		border:3px solid #eee;
		padding:15px;
	}
	#myclassQna>label{
		font-size:1.3em;
	}
	#myclassQnaSearch{
		float:right;
	}
	#myclassQnaSearch input{
		border:none;
		outline:none;
		border-bottom:1px solid #000;
	}
	#myclassQnaSearch button:nth-child(2){
		background-color:#eee;
		color:#000;
	}
	#myclassQnaFrm{
		background-color:#ABCEE3;
	}	
	#myclassQna li{
		float:left;
		text-align:center;
		padding:0 10px;
	}
	#myclassQna>ul>li:first-child{
		float:left;
		text-align:left;
		padding:0 15px;
		font-weight:bold;
		color:gray;
	}
	#myclassQna>ul>li:first-child>label{
		font-size:1em;
		color:#F4BFA9;
		font-weight:bold;
		margin-right:10px;
	}
	#myclassQna li:nth-child(2),
	#myclassQna li:nth-child(3){
		font-size:0.8em;
	}
	#myclassQna li:nth-child(4){
		width:100%;
		text-align:left;
		padding:0 15px;
	}
	#myclassQna>ul>li:last-child{
		padding:10px;
	}
	#myclassQna>ul>li:last-child label{
		font-size:1em;
		color:#ABCEE3;
		font-weight:bold;
		margin-right:10px;
	}
	#myclassQna li:last-child{
		width:100%;
		text-align:left;
		float:left;
		padding:0 10px;
	}
	#myclassQna>ul>li>ul>li:last-child{
		font-size:1em;
	}
	
	/* 모달 */
	#myclassModalR, 
	#myclassModalQ{
		display:none;
		position:absolute;
		width:100%;
		height:100vh;
		z-index:1;
	}
	#myclassModalR input, 
	#myclassModalR textarea, 
	#myclassModalQ input, 
	#myclassModalQ textarea{
		border:none;
		border-bottom:2px solid #ABCEE3;
		text-align:left;
		margin-top:10px;
		padding:10px;
	}
	.myclassModal_content{
		width:500px;
		height:600px;
		margin:100px auto;
		padding:20px 10px;
		background-color:#fff;
		border:3px solid #ABCEE3;
	}
	.myclassModal_content>div{
		padding:5px 10px;
	}
	.myclassModal_content>div:nth-child(2){
		float:left;
	}
	.myclassModal_content>label{
		width:100%;
		padding:10px;
		font-weight:;
		background-color:#e3eef6;
		text-align:center;
		font-size:1.3em;
	}
	.myclassModal_content input{
		width:100%;
		margin-bottom:10px;
		outline:none;
	}
	.myclassModal_content textarea{
		width:100%;
		height:300px;
		margin-bottom:30px;
		outline:none;
	}
	#myclassReviewWrite,
	#myclassQnaWrite{
		background-color:#ABCEE3;
		margin:0 auto;
		margin-top:20px;
		border:none;
	}
	#myclassQnaWrite{
		margin-top:50px;
	}
	.myclassModal_layer{
		position:fixed;
		top:0;
		left:0;
		width:100%;
		height:100%;
		background-color:rgba(0,0,0,0.5);
		z-index:-1;
	}
	
</style>
<script>

	//스크롤이동
	function moveToReview(){
		var locaR = document.querySelector("#myclassReview").offsetTop;
		window.scrollTo({top:locaR, behavior:'smooth'});
	}
	function moveToQna(){
		var locaQ = document.querySelector("#myclassQna").offsetTop;
		window.scrollTo({top:locaQ, behavior:'smooth'});
	}
	$(function(){
		
		//모달창 띄우기(수강평)
	    $("#myclassReviewFrm").click(function(){
    		$("#myclassModalR").css({
               "top": (($(window).height()-$("#myclassModalR").outerHeight())/2+$(window).scrollTop())+"px",
               "left": (($(window).width()-$("#myclassModalR").outerWidth())/2+$(window).scrollLeft())+"px"
               //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
            
            });
	        $("#myclassModalR").fadeIn();
	    });
	    $("#myclassReviewWrite, .myclassModal_layer").click(function(){
	       $("#myclassModalR").fadeOut();
	    });  
	  //모달창 띄우기(질문)
	    $("#myclassQnaFrm").click(function(){
    		$("#myclassModalQ").css({
               "top": (($(window).height()-$("#myclassModalQ").outerHeight())/2+$(window).scrollTop())+"px",
               "left": (($(window).width()-$("#myclassModalQ").outerWidth())/2+$(window).scrollLeft())+"px"
               //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
            
            });
	        $("#myclassModalQ").fadeIn();
	    });
	    $("#myclassQnaWrite, .myclassModal_layer").click(function(){
	       $("#myclassModalQ").fadeOut();
	    });  
	    
	    //평점에 별넣기 https://www.wbotelhos.com/raty 참고
	    $(".classRating").raty({
	    		score:5,
	    		path:"img/starImages",
	    		half:true,
	    		width:"100%",
	    		space:false
	    });
	    $(".myclassStars").raty({
    		score:5,
    		path:"img/starImages",
    		half:true,
    		width:"100%",
    		readOnly:true,
    		space:false
   		});
	    
	});

</script>
<div class="container cfont">
	<%@ include file="../inc/userProfile.jspf" %>
	<div class="userMainDiv">
		<ul id="myclassView">
			<li><img src="/gachi/img/test_image.jpg"/></li>
			<li><label class="badge badge-info">공예/창작</label><label>카모마일 프랑스 자수</label></li>
			<li>크리에이터명 <a href="#">홍길동</a></li>
			<li><label>진도율 : 0.00%</label></li>
			<li><label>기한 : 20.11.01 ~ 21.01.31</label></li>
			<li><progress value="50" max="100"></progress></li>
			<li><button type="button" class="btn btn-outline-light btn-block" onclick="location.href='/gachi/myclassVideo'">수강하기</button></li>
			<li>
				<button type="button" class="btn btn-outline-light btn-block" onclick="moveToReview()">수강후기</button>
				<button type="button" class="btn btn-outline-light btn-block" onclick="moveToQna()">질문&답변</button>
			</li>
		</ul>
		<div id="myclassVideoLst">
			<label>클래스 목차</label>
			<hr style="background:#000"/>
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
						<li><a href="#">실을 다루는 방법과 매듭짓는 방법<label>00:00</label></a></li>
						<li><a href="#">작품에 사용될 5가지 스티치 연습하기<label>00:00</label></a></li>
					</ol>
				</li>
				<li>
					<label>02 베개 커버에 수놓기</label>
					<ol>
						<li><a href="#">곰돌이 수놓기1<label>00:00</label></a></li>
						<li><a href="#">곰돌이 수놓기2<label>00:00</label></a></li>
					</ol>
				</li>
				<li>
					<label>03 자수 블랭킷 만들기</label>
					<ol>
						<li><a href="#">블랭킷 도안선 그리고 위치잡기<label>00:00</label></a></li>
						<li><a href="#">달모양 수놓기<label>00:00</label></a></li>
						<li><a href="#">가글 보틀 수놓기<label>00:00</label></a></li>
						<li><a href="#">잠옷입은 곰돌이 수놓기<label>00:00</label></a></li>
						<li><a href="#">탁상조명 수놓기<label>00:00</label></a></li>
					</ol>
				</li>
				<li>
					<label>04 완성</label>
					<ol>
						<li><a href="#">세탁방법 알아보기<label>00:00</label></a></li>
						<li><a href="#">상쾌한 아침을 기다려요!<label>00:00</label></a></li>
					</ol>
				</li>
			</ul>
		</div>
		
		<div id="myclassReview">
			<label>수강평</label>
			<button type="button" class="btn btn-outline-light" id="myclassReviewFrm">수강평작성</button>
			<hr style="background:#000"/>
			<ul>
				<li><div class="myclassStars"></div></li>
				<li>추천합니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>첫 프랑수자수 작품으로 골랐는데 매우 만족스럽습니다 꽃자수가 너무 예쁘고 파스텔톤 하늘색인 것도 마음에 듭니다!</li>
			</ul>
			<hr/>
			<ul>
				<li><div class="myclassStars"></div></li>
				<li>추천합니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>하루만에 완성하신 분들 진짜 존경합니다. 3일동안 매달려서 간신히 완성했네요. 나뭇잎과 테두리,글씨부터 하고 목련꽃은 마지막에 해서 모양이 많이 이상하긴 해요. ㅠㅠ 색도 중간에 힘들어서 원하는 색으로 바꿔 작업했고, 그라데이션은 진짜 힘들었어요.ㅠㅠ</li>
			</ul>
			<hr/>
			<ul>
				<li><div class="myclassStars"></div></li>
				<li>추천합니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>손이 심심해서 그 전부터 배워보고 싶었던 프랑스자수를 하게 됐어요! 일단 뭐부터 시작해야할지 몰라서 하비풀 프랑스 자수 키트 중 젤 맘에 드는 걸로 선택해서 들었는데 너무 만족스럽습니다! 배송도 빨랐고 무엇보다 완성작이 너무 예뻐요!! 그리고 강의를 보면서 배우니까 더 손쉽게 따라할 수 있었어요. 과연 내가 할 수 있을까 싶었는데 왕초보도 강의 설명 보면 충분히 따라할 수 있어요! 진짜 너무너무 뿌듯하고 맘에 들어요! 완성해서 엄마께 선물 드렸는데 좋아하셨어요. 구매 왕추천합니다! :) #뿌듯챌린지</li>
			</ul>
			<hr/>
			<ul>
				<li><div class="myclassStars"></div></li>
				<li>추천합니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>조금 실수한 부분도 있었지만 만들고 나니 이쁘네요~ 재밌는 프랑수자수 계속 부탁해요 : )</li>
			</ul>
			<hr/>
			<ul>
				<li><div class="myclassStars"></div></li>
				<li>추천합니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>원래 프랑스자수 했었는데 너어무 디자인이뻐서 구매했어요:) 스티치자체는 크게 어렵지 않지만 꼼꼼하게 해야 예뻐요~ 완성하고 나니 예쁘고 뿌듯했어요^^ 주변에서도 예쁘다고 하더라구요. 파우치 요긴하게 잘 사용 중이에요!</li>
			</ul>
			<hr/>
		</div>
		<ul class="pagination justify-content-center" id="myclassReviewPg">
			<li class="page-item"><a class="page-link" href="#">Prev</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
		<div id="myclassQna">
			<label>질문&답변</label>
			<div id="myclassQnaSearch">
				<input type="text" name="searchWord"/>
				<button type="button" class="btn btn-outline-light btn-sm">검색</button>
				<button type="button" class="btn btn-outline-light" id="myclassQnaFrm">질문작성</button>
			</div>
			<hr style="background:#000"/>
			<ul>
				<li><label class="badge badge-light">Q</label>질문입니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>입문자도 충분히 가능한가요?? 난이도가 어느정도인지 궁금합니다.</li>
				<li>
				<hr/>
					<ul>
						<li><label class="badge badge-light">A</label>홍길동</li>
						<li>20.11.15</li>
						<li>네 처음 시작하시는 분들도 무리없이 따라오시는 난이도의 수업입니다 :)</li>
					</ul>
				</li>
			</ul>
			
			<ul>
				<li><label class="badge badge-light">Q</label>질문입니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>안녕하세요. 해당 강의 외에 입문자용 말고 초급 중급자용 강의도 있을까요?</li>
				<li>
				<hr/>
					<ul>
						<li><label class="badge badge-light">A</label>홍길동</li>
						<li>20.11.15</li>
						<li>현재 오픈 예정인 두번째 수업을 얼리버드 신청 받고있습니다. 검색창에 프랑스자수를 검색해주세요 :)</li>
					</ul>
				</li>
			</ul>
			
			<ul>
				<li><label class="badge badge-light">Q</label>질문입니다</li>
				<li>김유미</li>
				<li>20.11.15</li>
				<li>3월 26일 오픈 예정인 수업이랑 수준이 많이 다른가요? 프랑스 자수 처음인데 둘중에 어떤걸 해야할지 고민중이라서요... 3월 오픈 예정인 강의구성이나 완성품이 탐나긴하는데 지금 당장 신청도 하고싶고!! 고민이에요 ㅎㅎ </li>
				<li>
				<hr/>
					<ul>
						<li><label class="badge badge-light">A</label>홍길동</li>
						<li>20.11.15</li>
						<li>안녕하세요 :) 두번째 수업과는 만드는 작품과 진행하는 스티치의 개수에서 차이가 있고 두 수업 모두 처음 시작하시는 초보자 분들도 충분히 수강이 가능합니다!</li>
					</ul>
				</li>
			</ul>
			
		</div>
		<ul class="pagination justify-content-center" id="myclassReviewPg">
			<li class="page-item"><a class="page-link" href="#">Prev</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</div>
</div>
<div id="myclassModalR" class="cfont">
	<div class="myclassModal_content">
		<label>수강평작성</label>
		<div>만족도 : </div>
		<div class="classRating"></div>
		<input type="text" placeholder="제목"/>
		<textarea placeholder="내용을 입력해주세요."></textarea>
		<button type="button" class="btn btn-outline-light btn-block" id="myclassReviewWrite">등록</button>
	</div>
	<div class="myclassModal_layer"></div>
</div>
<div id="myclassModalQ" class="cfont">
	<div class="myclassModal_content">
		<label>질문작성</label>
		<input type="text" placeholder="제목"/>
		<textarea placeholder="내용을 입력해주세요."></textarea>
		<button type="button" class="btn btn-outline-light btn-block" id="myclassQnaWrite">등록</button>
	</div>
	<div class="myclassModal_layer"></div>
</div>