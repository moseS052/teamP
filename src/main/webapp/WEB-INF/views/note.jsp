<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
.message-item:after {
    border-radius: 50%;
    content:"";
/*     background-image:url(resources/assets/img/avatar2.png); */
    background-size:21px 21px;
/*     font-family: 'Fontawesome'; */
    height: 21px;
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
</style>
<body  >
<div id="divadd" style="margin-bottom:-3px;" >
<!-- 	<div class="message-item fade-up"  > -->
<!-- 		<div class="message-inner" > -->
<!-- 			<div class="message-head clearfix" > -->
<!-- 				<div class="user-detail" > -->
<!-- 						<h5 class="handle" >aaaa</h5> -->
<!-- 							<div class="post-meta" > -->
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
	<div style="margin-left:-35px">
	<table >
	<tr><td><textarea cols="27" rows="3" ></textarea></td>
		<td style="padding:5px;"><a class="btn btn-primary btn-outlined" href="#" id="btnChangeAvatar">보내기</a></td></tr>
	</table>
	</div>
</body>


<script>
$(document)
.ready(function(){
	noteCon();
})







function noteCon(){
	$.ajax({
		type:'get',url:'noteUp',dataType:'json',data:{m_no:${mno},m_pa_no:${mpano}},
		success:function(data){
			$('#divadd').empty();
			for(let i=0;i<data.length;i++){
				notetem=data[i];
				$('.message-item:after').css("background-image","url(resources/assets/img/avatar2.png)");
				// 제이쿼리 css적용하기 = 아바타
// 				console.log(notetem["n_con"]);

				let str='<div class="message-item fade-up" style="margin-bottom:5px;"><div class="message-inner">'
					+'<div class="message-head clearfix"><div class="user-detail">'
					+'<h5 class="handle">'+notetem["n_con"]+'</h5><div class="post-meta">'
					+'<div class="asker-meta"><span class="qa-message-what"></span>'
					+'<span	class="qa-message-when"><span class="qa-message-when-data">'+notetem["n_date"]+'</span>'
					+'</span></div></div></div></div></div></div>'
				$('#divadd').append(str);
			} 
			noteCon()
		},
		error:function(){
			alert('연결실패');
		},
		complete:function(){}
	})
}

</script>
</html>