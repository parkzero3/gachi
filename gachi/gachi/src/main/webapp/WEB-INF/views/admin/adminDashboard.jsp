<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#ad_dash_board_ul>li {
	float: left;
	width: 20%;
	text-align: center;
	margin-left: 100px;
}

.ad_dash_board {
	border: 2px solid #437299;
	border-radius:10px;
	width: 250px;
	height: 200px;
	padding: 10px;
	margin-bottom: 50px;
}
b{
	margin-top:10px;
}

</style>    
    

<div class="container ad_dash_center text-center ad_font">
<h1 style="text-align:center;"> 관리자 대시보드 </h1>
<br/>
	<div id ="ad_dash_div">
		<form action="adminDashboard" method="post">
         <input type="month" id="startMonth" name="startMonth" value="${startMonth }" onchange="return chkPeriod();"/>
         -
         <input type="month" id="endMonth" name="endMonth" value="${endMonth }" onchange="return chkPeriod();"/>
         <input type ="submit" class="btn btn-outline-dark btn-sm" id="frm" value="조회"/>
         
		<ul id="ad_dash_board_ul">
			<li><div class="ad_dash_board"><input type="radio" name="ad_dash_User" value="전체" checked/>전체
					<input type="radio" name="ad_dash_User" value="회원"/>회원
					<input type="radio" name="ad_dash_User" value="크리에이터"/>크리에이터<br/>
						<b>신규 가입자 수</b><br/>
						<span style="font-size:50px;line-height:100px"> ${dashData} 명</span>
					</div></li>
			<li><div class="ad_dash_board"><input type="radio" name="ad_dash_pay" value="전체" checked/>전체
					<input type="radio" name="ad_dash_pay" value="스토어"/>스토어
					<input type="radio" name="ad_dash_pay" value="클래스"/>클래스<br/>
						<b>이번달 총 매출</b><br/>
						<span style="font-size:50px;line-height:100px">0 원</span>
					</div></li>
			<li><div class="ad_dash_board">
						<b>답변 대기 문의</b><br/>
						<span style="font-size:50px;line-height:120px">0 건</span>
					</div></li>							
		</ul>
		</form>
	</div>
	
	<canvas id="ad_dash_chart" style="margin:100px 0 ;"></canvas>
	<script type="text/javascript" src="resources/Chart.js"></script>
	<script type="text/javascript">

     
     var dashData = "${dashData}";
     var labelData = "${labelData}";
     var startMonth = "${startMonth}";
     var endMonth = "${endMonth}";
     
     $(function(){
 		console.log('loading');
 	    // 로딩될때
 	    if($('#startMonth').val() == '' && $('#endMonth').val() == '') {
 	    	
 			$('#startMonth').val();
 			$('#endMonth').val();
 			
 			console.log($('#startMonth').val());
 			console.log($('#endMonth').val());
 	    } else{
 	    	
 	    }
 	    $('#frm').on('submit',function(){
 	         frmSubmit();
 	         return false;
 	     });//submit
 	     
	$("#frm").click(function(){
		var url = "/adminStatMember";
		var data = ${dashData};
		$.ajax({
			url : url,
			data : data,
			success: function(data){
				$("#startMonth").append("${startMonth}");
				$("#endMonth").append("${endMonth}");
				
			},error:function(){
				console.log("ajax에러발생");
			}
		});
	});
 	              
  function addData(chart, label, data) {
 	 
 	    chart.data.labels.push(label);
 	    chart.data.datasets.forEach((dataset) => {
 	        dataset.data.push(data);
 	    });
 	    chart.update();
 	}
 	
  function chkPeriod(){
 		var startMonth = $('#startMonth').val();
 		var endMonth = $('#endMonth').val();
 		
 		if(startMonth >= endMonth) {
 			alert('기간을 다시 선택해주세요.');
 			return false;
 		} else {
 			return true;
 		}
 	} // chkPeriod

 	     
	
  });
	
	
	var ad_dash_context = document.getElementById('ad_dash_chart').getContext('2d');
	var ad_dash_chart = new Chart(ad_dash_context, {
	    type: 'line',
	    data: {
	        labels: ${labelData},
	        datasets: [{
	            label: '월별 매출 기록',
	            data: ${dashData},
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 120, 252, 0.2)',
	                'rgba(180, 111, 220, 0.2)',
	 
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255,1)',
	                'rgba(255, 159, 64,1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
	
	</script>
</div>