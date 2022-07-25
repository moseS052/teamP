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
	<img src=<c:url value="resources/assets/img/avatar1.png"/> width="200px" height="200px" />
</div>
<c:if test="${m_no==semno }">
<a class="btn btn-primary btn-outlined" href="#" id="btnChangeAvatar">아바타 변경</a>
</c:if>
<c:if test="${m_no!=semno }">
<a class="btn btn-primary btn-outlined" href="#" id="btnSendNote">쪽지 보내기</a>
</c:if>
</body>
<script>
$(document)
.ready(function(){
	console.log(`${id}`)
	console.log(`${m_no}`)
	console.log(`${nick}`)
})


.on('click','#btnSendNote',function(){
	window.open("note?m_no=1&m_pa_no=3", "_blank", "width=350, height=400, top=110, left=1700");
})














</script>
</html>