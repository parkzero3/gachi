<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#eventTitle{
	margin-top:50px;
}

/* 1:1문의 상단 제목, 날짜 */
#adminNoticeView_Div{
	border-top:2px solid black;
	border-bottom:1px solid #E5E5E5;
}
#adminNoticeView_Subject{
	border-bottom:1px solid #E5E5E5;
}
#adminNoticeView_DateDiv{
	margin: 10px 0;
}
/* 1:1문의 상단 제목, 날짜 끝*/

/* 1:1문의 상세 내용*/
#adminNoticeView_Content{
	min-height: 500px;
	overflow:auto;
	text-align:center;
	padding: 50px;
	border: 3px solid #437299;
	border-radius: 10px;
}
/* 1:1문의 상세 내용 끝*/
/* 댓글 입력 폼*/
#adminNoticeView_ReplyForm{
	width:100%;
	margin: 20px 0; 
	float: left;
}
#adminNoticeView_ReplyForm>textarea{
	width:100%;
	resize:none;
}
#adminNoticeView_ReplyForm>div{
	float:right;
}
/* 댓글 입력 폼 끝*/
/*버튼*/
#adminNoticeView_BtnDiv{
	clear: both;
	margin: 10px 0;
	background-color: oragin;
}
/*댓글 리스트*/
#adminNoticeView_ReplyDiv{
	clear: both;
	overflow: auto;
	margin-bottom: 50px;
	border:3px solid #437299;
	border-radius: 10px;
	overflow: auto;
}
#adminNoticeView_ReplyDiv li{
	float:left;
	line-height:50px;
	border-bottom: 1px solid gray;
	margin-bottom: 10px;
}
#adminNoticeView_ReplyDiv li:nth-child(4n+1){
	padding-left:5px;
	width: 13%;
}
#adminNoticeView_ReplyDiv li:nth-child(4n+3){
	width: 10%;
}
#adminNoticeView_ReplyDiv li:nth-child(4n+4){
	width: 7%;
}
#adminNoticeView_ReplyDiv li:nth-child(4n+2){
	width: 70%;
}
</style>
<div class="container ad_font">
	<div >
		<h3>공지사항</h3>
		<div id="adminNoticeView_Div">
			<div id="adminNoticeView_Subject">
				<h3>${vo.subject}</h3>
				<div id="admin1on1View_DateDiv"><span>${vo.writer}</span> <span>${vo.writedate}</span></div>
			</div>
			<!-- 1:1문의 내용 -->
			<div id="adminNoticeView_Content">
			<!-- <img src="/gachi/img/event_sample.png"/> -->			
			<!-- <p>	
				<b>1. 영상출력방식이 맞지 않아 발생할 수 있습니다.</b><br/>
				재생화면에 마우스를 올려 놓으시고 마우스 오른쪽 버튼을 누르면 메뉴가 나옵니다.<br/>
				메뉴중 [비디오]->[출력방식]->[VMR9] 순으로 변경해 보시기 바랍니다.<br/><br/>
				
				<b>2. 그래픽카드 드라이브 문제일 수 있습니다.</b><br/>
				3DP 프로그램을 통해 그래픽카드를 검색하여 설치하시기 바랍니다.<br/>
				3DP는여기를 통해 다운받아 설치하시고 프로그램을 실행하면 이용하는<br/>
				PC의 그래픽카드에 맞춰 드라이브를 찾아 다운 받을 수 있습니다.<br/><br/>
				
				잘 안되시거나 어려우시면 고객센터(1500-0000)으로 연락주세요.<br/>
				원격지원을 통해 도움 드리도록 하겠습니다. 감사합니다. </p>
				 -->
				${vo.content}
			</div>
		</div>
		
	</div>
	<!-- 버튼 -->
	<div id="adminNoticeView_BtnDiv" style="width:50%;float:left;">
		<button type="button" class="btn">이전</button>
		<button type="button" class="btn">다음</button>
		<a href="/gachi/adminNotice?nowPage=${nowPage}"><button type="button" class="btn">목록</button></a>
	</div>
	<div style="text-align: right;width:50%;float:left; margin-top:10px;">
		<a href="/gachi/adminNoticeEdit?notice_num=${vo.notice_num}&nowPage=${nowPage}"><button type="button" class="btn">수정</button></a>
		<a href="/gachi/adminNoticeDel?notice_num=${vo.notice_num}&nowPage=${nowPage}"><button type="button" class="btn">삭제</button></a>
	</div>
</div>