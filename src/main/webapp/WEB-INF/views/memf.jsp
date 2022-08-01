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
<body>
<div>
	<img src=<c:url value="${avaRoute}"/> width="200px" height="200px" />
</div>
<c:if test="${m_no==semno }">
<a class="btn btn-primary btn-outlined" href="#" id="btnChangeAvatar">아바타 변경</a>
</c:if>
<c:if test="${m_no!=semno }">
<a class="btn btn-primary btn-outlined" href="#" id="btnSendNote" myseq='${m_no}' yourseq='${semno}'>쪽지 보내기</a>
</c:if>
</body>
<script>
var popup;
$(document)
.ready(function(){
	console.log(`${id}`)
	console.log(`${m_no}`)
	console.log(`${nick}`)
})


.on('click','#btnSendNote',function(){
	let m_no=$(this).attr('myseq');
	let m_pa_no=$(this).attr('yourseq');
	if(`${m_no}`==''){
		alert('로그인 후 이용해 주세요');
		return false;
	}else{
	window.open("note?m_no="+m_no+"&m_pa_no="+m_pa_no, "_blank", "width=350, height=400, top=110, left=1700");
	}
	return false;
})

.on('click','#btnChangeAvatar',function(){
	popup=window.open("avatar", "_blank", "width=460, height=400, top=110, left=1700");
	
	popup.onbeforeunload=function(){
		location.reload();
	}
	return false;
})

.keydown(function(event) {
    if ( event.keyCode == 27 || event.which == 27 ) {
    	window.close();
    }
});








</script>
</html>