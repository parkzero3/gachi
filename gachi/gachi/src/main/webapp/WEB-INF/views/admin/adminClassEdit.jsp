<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container ad_font">
<script type="text/javascript">
	$(function(){
		CKEDITOR.replace('class_info',{
			fliebrowserUploadUrl:'/gachi/imageUpload'
		});
		CKEDITOR.config.height=500;
		//CKEDITOR.config.extraPlugins='dragdrop'
		$("#ad_goods_writeForm>li").slice(2).css("width","100%");
		$("#ad_goods_writeForm>li:first-child li").css("margin","7px 0px");
		$("#ad_goods_write li").css("margin-top","10px");
		$("textarea").css("height","800px");
		
		$("#class_info")
	});
</script>
<div class="container">
<h1>클래스수정</h1>
<form method="post" action="">
<ul id="ad_goods_writeForm">
	<li>
		<ul>
			<li class="content_center">클래스코드</li>
			<li><input type="hidden" name="code" value="${vo.code}"/>${vo.code}</li>
			<li class="content_center">카테고리</li>
			<li>
				<select id="category" name="category">
					<option  value="공예/창작" 
						<c:if test="${vo.category eq '공예/창작'}"> selected</c:if>>공예/창작</option>
					<option value="요리" 
						<c:if test="${vo.category eq '요리'}"> selected</c:if>>요리</option>
					<option value="미술" 
						<c:if test="${vo.category eq '미술'}"> selected</c:if>>미술</option>
					<option value="음악" 
						<c:if test="${vo.category eq '음악'}"> selected</c:if>>음악</option>
					<option value="라이프스타일" 
						<c:if test="${vo.category eq '라이프스타일'}"> selected</c:if>>라이프스타일</option>
					<option value="운동" 
						<c:if test="${vo.category eq '운동'}"> selected</c:if>>운동</option>
					<option value="사진/영상" 
						<c:if test="${vo.category eq '사진/영상'}"> selected</c:if>>사진/영상</option>
				</select>
			</li>
			<li class="content_center">클래스명</li>
			<li><input type="text" id="" name="class_name" value="${vo.class_name}" size="40"/></li>
			<li class="content_center">난이도</li>
			<li>
				<select id="stage" name="stage">
					<option value="초급" 
						<c:if test="${vo.category eq '초급'}"> selected</c:if>>초급</option>
					<option value="중급" 
						<c:if test="${vo.category eq '중급'}"> selected</c:if>>중급</option>
					<option value="고급" 
						<c:if test="${vo.category eq '고급'}"> selected</c:if>>고급</option>
					<option value="마스터" 
						<c:if test="${vo.category eq '마스터'}"> selected</c:if>>마스터</option>
				</select>
			</li>
			<li class="content_center">원가격</li>
			<li><input type="text" id="" name="full_price" value="${vo.full_price}"/></li>
			<li class="content_center">가격</li>
			<li><input type="text" id="" name="real_price" value="${vo.real_price}"/></li>
			<li class="content_center">클래스상태</li>
			<li>
				<select id="stage" name="class_state">
					<option value="미승인" 
						<c:if test="${vo.class_state eq '미승인'}"> selected</c:if>>미승인</option>
					<option value="등록승인" 
						<c:if test="${vo.class_state eq '등록승인'}"> selected</c:if>>등록승인</option>
					<option value="판매중" 
						<c:if test="${vo.class_state eq '판매중'}"> selected</c:if>>판매중</option>
					<option value="판매종료" 
						<c:if test="${vo.class_state eq '판매종료'}"> selected</c:if>>판매종료</option>
				</select>
			</li>
		</ul>
	</li>
	<li class="text-center">
		대표이미지<br/>
		<img src="<%=request.getContextPath()%>/upload/classImg/${vo.class_img1}"/>
	</li>
</ul>
<ul id="ad_goods_write">
	<li>상품설명</li>
	<li><textarea name="class_info">${vo.class_info}</textarea></li>
	<li>첨부파일 <input type="file" name="class_img1" value="${vo.class_img1}"/></li>
	<li class="content_center">
		<input type="submit" class="btn" value="수정"/>
		<input type="reset" class="btn" value="다시쓰기"/>
	</li>
</ul>
</form>
</div>
</div>