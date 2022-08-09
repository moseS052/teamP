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
<style>
	@font-face {
    font-family: 'Binggrae';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	a{
		font-family: 'Binggrae';
	}
	body{
		margin:0;
		padding:0;
	}
	#ma{
		margin-top:-30px;
	}
</style>
</head>
<body>
<input type="hidden" id="chp">
<div class="container" id="ma">
			<div class="row mt">
				<div class="centered gap fade-down section-heading">
					<h2 class="main-title">회원정보</h2>
					<div>
						<img src=<c:url value="${avaRoute}"/> width="200px" height="200px" />
					</div>
					<c:if test="${m_no==semno }">
					<a class="btn btn-primary btn-outlined" href="#" id="btnChangeAvatar">아바타 변경</a>
					</c:if>
					<strong>닉네임:${nick1}</strong> &nbsp;&nbsp;
					<c:if test="${m_no!=semno }">
					<a class="btn btn-primary btn-outlined" href="#" id="btnSendNote" myseq='${m_no}' yourseq='${semno}'>쪽지 보내기</a>
					</c:if><br>
					<strong>이메일주소:</strong><strong>${mail}</strong>
				</div>
			</div>
			<!-- row -->
				<div>
						<h3 class="main-title">최근활동내역</h3>
						<br>
						<h4>기획서부분</h4>
						<table id='mytable' class="table table-striped">
						<thead><tr><th>제목</th><th></th><th></th><th>조회수</th></tr></thead>
							<tbody></tbody>
							<c:if test="${lst!=null}">
							<c:forEach var="lst" items="${lst}">
							<tr><td>${lst.l_title}</td><td></td><td></td><td>${lst.l_views}</td></tr>
							</c:forEach>
							</c:if>
						</table>
						<h4>참여부분</h4>
						<table id='mytable' class="table table-striped">
						<thead><tr><th>제목</th><th></th><th></th><th></th></tr></thead>
							<tbody></tbody>
							<c:if test="${ast!=null}">					
							<c:forEach var="ast" items="${ast}">
							<tr><td>${ast.l_title}</td><td></td><td></td><td></td></tr>
							</c:forEach>
							</c:if>
							
						</table>
              	</div>
			
			<!-- row -->
		</div>
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
		console.log("ss="+$('#chp').val())
		if($('#chp').val()==1) {
			opener.$('#phpp').val('1');
			location.reload(); 
		}
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