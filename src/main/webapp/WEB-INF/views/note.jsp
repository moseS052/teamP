<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>재능드림</title>
<link href="<c:url value="/resources/assets/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/animate.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/prettyPhoto.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/pe-icons.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/memfstyle.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/font-awesome.min.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/assets/js/jquery.js"/>"></script>  
<script src="<c:url value="/resources/assets/js/modernizr.custom.js"/>"></script>   
</head>
<style>
.message-item#yourcss:after { 
    border-radius: 50%; 
    content:""; 
 	background-image:url(${youAvaRoute}); 
    background-size:21px 21px;height: 21px; 
    left: -35px; 
    position: absolute; 
    top: 10px; 
    width: 21px; 
    line-height: 10px; 
} 
.message-item#mycss:after { 
    border-radius: 50%; 
    content:""; 
 	background-image:url(${myAvaRoute}); 
    background-size:21px 21px;height: 21px; 
    left: -35px; 
    position: absolute; 
    top: 10px; 
    width: 21px; 
    line-height: 10px; 
} 
textarea {
    border: none;
    resize: none;
    overflow:hidden;
    background-color:#f4f4f4; 
    color:black; 
}
/* header { */
/* 	position:fixed; */
/* 	top:0; */
/* 	height:150px; */
/* 	display: flex; */
/* 	justify-content: space-between; */
/* } */
/* body { */
/* 	padding-top:100px; */
/* } */
	@font-face {
    font-family: 'Binggrae';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	body{
		font-family: 'Binggrae';
	}
</style>
<body  >

<div style="margin-left:-35px">
	<table>
	<tr><td><textarea cols="22" rows="3" id='n_con'></textarea></td>
		<td style="padding:5px;"><a class="btn btn-primary btn-outlined" href="#" id="btnSend">보내기</a><br>
								<a class="btn btn-primary btn-outlined" href="#" id="btnClose">닫 &nbsp; 기</a></td></tr>
	</table>
	</div>
<div id="divadd" style="margin-bottom:-3px;" >

<!-- 	<div class="message-item fade-up"  > -->
<!-- 		<div class="message-inner" > -->
<!-- 			<div class="message-head clearfix" > -->
<!-- 				<div class="user-detail" > -->
<!-- 						<h5 class="handle" >a<br><br><br>aaaa<br></h5> -->
<!-- 							<div class="post-meta"  > -->
<!-- 								<div class="asker-meta" > -->
<!-- 									<span class="qa-message-what"></span> <span -->
<!-- 										class="qa-message-when"> <span -->
<!-- 										class="qa-message-when-data">bbbb</span> -->
<!-- 									</span> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
				
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	</div>	
	
</body>


<script>
$(document)
.ready(function(){
	noteCon();
	
// 	$('<style>.message-item:after {
//  	background-image:url(resources/assets/img/avatar2.png);
// 	}</style>').appendTo('head');
// 	console.log($(".message-item::after").css("content"));
})
.on('keyup','#n_con',function(key){
	if(key.keyCode==13){
		$('#btnSend').trigger('click');
	}
})
.on('click','#btnClose',function(){
	window.close();
})

.on('click','#btnSend',function(){
	let note = $('#n_con').val();
	let youseq = `${mpano}`;
	$.ajax({
		type:'get',url:'noteSend',dataType:'text',data:{n_con:note,youseq:youseq},
		success:function(){
			$('#n_con').val('');
			noteCon();
		},
		error:function(){
			alert('메세지를 보내지 못합니다');
		},
		complete:function(){}
	})
})


.keydown(function(event) {
    if ( event.keyCode == 27 || event.which == 27 ) {
    	$('#btnClose').trigger('click');
    }
});

function noteCon(){
	$.ajax({
		type:'get',url:'noteUp',dataType:'json',data:{m_no:`${mno}`,m_pa_no:`${mpano}`},
		success:function(data){
			$('#divadd').empty();
			for(let i=0;i<data.length;i++){
				notetem=data[i];
// 				$('.message-item:after').css("background-image","url(resources/assets/img/avatar2.png)");
				// 제이쿼리 css적용하기 = 아바타
				if(notetem['m_no']==`${mno}`){
					let str='<div class="message-item fade-up" id="mycss" style="margin-bottom:5px;" ><div class="message-inner" style="background-color:#e4e4e4">'
						+'<div class="message-head clearfix" style="background-color:#e4e4e4"><div class="user-detail" >'
						+'<h5 class="handle">'+notetem["n_con"]+'</h5><div class="post-meta" >'
						+'<div class="asker-meta" ><span class="qa-message-what"></span>'
						+'<span	class="qa-message-when"><span class="qa-message-when-data">'+notetem["n_date"]+'</span>'
						+'</span></div></div></div></div></div></div>'
					$('#divadd').prepend(str);
					
				} else {
					let str='<div class="message-item fade-up" id="yourcss" style="margin-bottom:5px;" ><div class="message-inner" style="background-color:#d8d8d8">'
						+'<div class="message-head clearfix" style="background-color:#d8d8d8"><div class="user-detail" >'
						+'<h5 class="handle">'+notetem["n_con"]+'</h5><div class="post-meta" >'
						+'<div class="asker-meta" ><span class="qa-message-what"></span>'
						+'<span	class="qa-message-when"><span class="qa-message-when-data">'+notetem["n_date"]+'</span>'
						+'</span></div></div></div></div></div></div>'
					$('#divadd').prepend(str);
					
				}
			} 
			noteCon()
		},
		error:function(){
// 			alert('연결실패');
		},
		complete:function(){}
	})
}


</script>
</html>