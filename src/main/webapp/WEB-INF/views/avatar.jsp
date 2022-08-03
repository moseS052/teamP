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
#btnDiv {
	text-align: right;
	padding-right : 15px;
}
#avtarView {
	margin-top : 5px;
	text-align: right;
	padding-right : 15px;
	margin-left:-58px;
}
#avatarMain {
	margin-right : 50px;
	margin-bottom : -90px;
	
}
	@font-face {
    font-family: 'Binggrae';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	a{
		font-family: 'Binggrae';
	}
</style>
<body>
<input id='avatarChanger' type='hidden' value="1">
<div id='avtarView'>
	<img id='avatarMain' src=<c:url value="${myAvatarRoute}"/> width="200px" height="200px" />
	<a href='' sbc="resources/assets/img/avatar/avatar1.png"><img src=<c:url value="resources/assets/img/avatar/avatar1.png"/> width="80px" height="80px" /></a>&nbsp;&nbsp;
	<a href='' sbc="resources/assets/img/avatar/avatar2.png"><img src=<c:url value="resources/assets/img/avatar/avatar2.png"/> width="80px" height="80px" /></a><br>
	<a href='' sbc="resources/assets/img/avatar/avatar3.png"><img src=<c:url value="resources/assets/img/avatar/avatar3.png"/> width="80px" height="80px" /></a>&nbsp;&nbsp;
	<a href='' sbc="resources/assets/img/avatar/avatar4.png"><img src=<c:url value="resources/assets/img/avatar/avatar4.png"/> width="80px" height="80px" /></a><br><br>
</div>
<div id='btnDiv'>
<a class="btn btn-primary btn-outlined" href="#" id="btnChangeAvatar">아바타 변경</a>&nbsp;<a class="btn btn-primary btn-outlined" href="#" id="btnCancle">취 소</a>
</div>
<div style="margin:10px 100px 0 0 ;">
<input  class="btn btn-primary btn-outlined" type="file" name="file1" id="file1" accept="image/*" id="uploadAvatar">
</div>
</body>
<script>
$(document)
.ready(function(){
	console.log(`${m_no}`);
})
.on('click','a',function(){
	console.log($(this).attr("sbc"))
	$('#avatarMain').attr("src",$(this).attr("sbc"));
	return false;
})
.on('change','#file1',function(){
	$('#avatarChanger').val('2');
	 $('#avatarMain').attr("src",window.URL.createObjectURL(this.files[0]));
})
.on('click','#btnChangeAvatar',function(){
	if(confirm('아바타를 변경하시겠습니까?')){
		if($('#avatarChanger').val()=='1'){
			$.ajax({
				type:'post',url:'avatarChange',data:{avaRoute:$('#avatarMain').attr("src")},dataType:'text',
				success:function(){
					alert('아바타가 변경되었습니다.');
					window.close();
				},
				error:function(){
					alert('아바타 변경 실패');
				},
				complete:function(){}
			})
	 	
		}else if($('#avatarChanger').val()=='2'){
			let form = new FormData();
			form.append("file1", $('#file1')[0].files[0]);
			console.log(form);
		 	$.ajax({
				url:'avatarChange_01',
				processData : false,
				contentType : false,
				data : form,
				type : 'POST',
				success:function(){
					alert('아바타가 변경되었습니다.');
					window.close();
				}
			
			}); 
		}
	}else return false;
 	 
}) 
.on('click','#btnCancle',function(){
	window.close();
})
.keydown(function(event) {
    if ( event.keyCode == 27 || event.which == 27 ) {
    	window.close();
    }
});












</script>
</html>