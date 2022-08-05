<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
  <head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="<c:url value="/resources/assets/img/favicon.ico"/>">
<title>Free Board</title>
<link href="<c:url value="/resources/assets/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/animate.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/prettyPhoto.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/pe-icons.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/style.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/font-awesome.min.css"/>" rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Cabin:300,400,700,300italic,400italic'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lato:400,300,700'
	rel='stylesheet' type='text/css'>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
<script src="<c:url value="/resources/assets/js/jquery.js"/>"></script>  
<script src="<c:url value="/resources/assets/js/modernizr.custom.js"/>"></script>   
<script type="text/javascript">
    $(document).ready(function(){
    	jQuery('#headerwrap').backstretch(
				[ "resources/assets/img/bg/board2.jpg"
					 ], {
					duration : 8000,
					fade : 500
				});

		// Map Position And Settings
		$("#mapwrapper").gMap({ 
			controls: false,
			scrollwheel: false,
			draggable: false,
			latitude:40.7566,
			longitude: -73.9863,
			zoom: 11

		});
	});
    </script>
<style>
	@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	@font-face {
    font-family: 'Binggrae';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	body{
		font-family: 'GangwonEdu_OTFBoldA';
	}
	table{
		text-align:center;
	}
	th {
    	text-align:center;
	}
	#searchDIV{
		text-align:right;
		margin-top:25px;
		font-family: 'GangwonEdu_OTFBoldA';
	}
	#boxboxq{
		margin-top:-45px;
		font-family: 'GangwonEdu_OTFBoldA';
	}
 	#btnSearch, #btnAll{ 
 		height:24px;
 		margin-top:-4px;
 		margin-left:5px;
 		font-family: 'Binggrae';
 	} 
 	#searc,#all1{
 		margin-top:-7px;
 	}
 	#selSearch{
 		padding-top:1px;
 		font-size:15px;
 		margin-right:-2px;
 		font-family: 'Binggrae';
 	}
 	#searching{
 		font-size:17px;
 		font-family: 'Binggrae';
 	}
	.menu,#theMenu{
		font-family: 'Binggrae';
	}
	h2{
		font-family: 'Binggrae';
	}
</style>	
  </head>


  <body class="single single-post"> 

  	<div id="preloader"></div>

    <div id="search-wrapper">
        <div class="container">
            <input id="search-box" placeholder="Search"><span class="close-trigger"><i class="fa fa-angle-up"></i></span>
        </div>
    </div>

    <!-- END NAV -->
    <nav class="menu" style="background-color:#fde3e9;" id="theMenu">
        <div class="menu-wrap">
            <i class="fa fa-bars menu-close"></i>
            <div id="menu-logo">
                <h2><span class="pe-7s-chat logo-icon"></span> Q</h2>
                <c:if test="${m_no==null}">
				<a href="login">login</a><a href="signup">회원가입</a>
				</c:if>
				<c:if test="${m_no!=null}">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${nick}&nbsp;님<a href='logout'>Logout</a>
				</c:if>
            </div>
            <div>
				<c:if test="${m_no!=null}">
				<a href=''><img src=<c:url value="resources/assets/img/avatar1.png"/> width="20px" height="20px" id='meminfo' seq="${m_no}" /></a>
				<div class="dropdown pull-right">
				<a href="#" class="dropdown-toggle menu-icon" data-toggle="dropdown" id="alarmClick"></a>
		        <div id="alarmInto" class="dropdown-menu" style="width:707px; opacity: 1; left: 0; padding:10px 10px 10px 10px;">
		        
<!-- 		        <div class="well"><div class="square pull-right" id="but">헬로</div><h4>I'm Kim</h4></div> -->
<!-- 				<a href='#'><img src=<c:url value="resources/assets/img/all.png"/> width="30px" height="30px" /></a> -->
<!-- 				<a href='#'><img src=<c:url value="resources/assets/img/all1.png"/> width="30px" height="30px" /></a> -->
				</div></div>
				</c:if>
			</div>
            <ul id="main-menu">
            <c:if test="${m_no!=''}">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">개인정보<i
						 class="fa fa-user menu-icon" aria-hidden="true"></i></a>
					<ul class="dropdown-menu">
						<li><a href="privacy?m_no=${m_no}">개인정보수정</a></li>
						<li><a href="pwchange?m_no=${m_no}">비밀번호변경</a></li>
						<li><a href="MyPost?m_no=${m_no}">내가쓴게시물찾기</a></li>
					</ul></li>
					</c:if>
				<li class="dropdown"><a href="/pj" class="dropdown-toggle">Home 
					<i class="fa fa-home menu-icon"></i></a>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Pages <i class="fa fa-file menu-icon"></i></a>
					<ul class="dropdown-menu">	
						<li>
						<c:if test="${m_no==''}">
						<a href="login">봉사활동기획서</a>
						</c:if>
						<c:if test="${m_no!=''}">
						<a href="proposal?m_no=${m_no}">봉사활동 기획서</a>
						</c:if>
						</li>
						<li><a href="proposal_list">봉사활동 현황목록</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Board <i class="fa fa-pencil menu-icon"></i></a>
					<ul class="dropdown-menu">
						<li><a href="<%= request.getContextPath() %>/freeboard?pagenum=1">Free Board</a></li>
						<li><a href="<%= request.getContextPath() %>/reqboard?pagenum=1">Request Board</a></li>
						
					</ul></li>
				<li class="dropdown"><a href="/pj/photoBoard?stanum=1&endnum=6" class="dropdown-toggle">Photo 
					<i class="fa fa-camera menu-icon"></i></a>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Q&nbsp;&&nbsp;A <i class="fa fa-solid fa-question menu-icon"></i></a>
					<ul class="dropdown-menu">
						<li><a href="/pj/qna">자주 묻는 질문</a></li>
						<li><a href="/pj/question">1:1 질문</a></li>
					</ul></li>	
				
			</ul>
		</div>
	</nav>
    <!-- END NAV -->
	
	<!-- MAIN IMAGE SECTION -->
	 <div id="headerwrap" class="half">
   		<div class="container">
	    	<div class="gap"></div> 
        	<div id="bannertext" class="centered fade-down section-heading">
                <br><br><br><br><br>
                <h2 class="main-title">Free Board</h2>
                <hr>
                <p></p>
            </div>
		</div>
	</div>
 
	<div id="content-wrapper">
	    <section id="about">
	   		<div class="container">
		    	<div class="gap">
		    	<div id="searchDIV">
		    	<h5 class="fade-up" id="showAll"><select id='selSearch'><option>제목+내용</option><option>작성자</option></select> 
					<input type='text' id='searching'><a class="btn btn-primary btn-outlined" href="" id="btnSearch"><p id="searc">검 &nbsp; 색</p></a></h5>
		    	</div></div>
				<div class="row gap" id="boxboxq">

					<div class="col-md-12">
					<!-- <h1 align="center">Free Board</h1> -->
					<table class="table table-striped" style="">
					<thead id="thd"><tr><th>게시번호</th><th>제목</th><th>작성자</th><th>작성일자</th><th>조회수</th></tr></thead>
					<tbody id="tbd">
					<c:forEach var="boardDTO" items="${boardlist }">
					<tr><td>${boardDTO.b_no }</td><td><a href='freedetail?b_no=${boardDTO.b_no}'>${boardDTO.b_title }</a></td>
					<td><a href='' id='meminfo' seq='${boardDTO.m_no}'>${boardDTO.nick}</a></td>
					<td>${boardDTO.b_date }</td><td>${boardDTO.views }</td>
					<%-- <td><form id=frmup method=get action="updetail">
					<input type=hidden id="b_no" name="b_no" value="${boardDTO.b_no }">
					<input type=submit value='수정'></form></td><td>
					<form id=frmdel method=get action="delete_free">
					<input type=hidden id="b_no" name="b_no" value="${boardDTO.b_no }">
					<input type=submit value='삭제'></form></td> --%>
					</tr>
					</c:forEach></tbody>
					</table>
					<div align="center">
						<nav aria-label="Page navigation example">
							<ul class="pagination" id="paginationClass">
								
							</ul>
						</nav>
					</div>
					<c:if test="${m_no!=null}">
					<p align="center"><a href='newpost_fb'>새글쓰기</a></p>
					</c:if>
					</div>
				</div>
			</div>	
	    </section>
	</div>

	<!-- MAIN FOOTER -->
	<!-- <div id="footerwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<h4 class="widget-title">Tags</h4>
					<ul class="tag-widget">
						<li><a class="btn btn-primary btn-outlined" href="#">News</a></li>
						<li><a class="btn btn-primary btn-outlined" href="#">Blog</a></li>
						<li><a class="btn btn-primary btn-outlined" href="#">Photos</a></li>
						<li><a class="btn btn-primary btn-outlined" href="#">Gallery</a></li>
						<li><a class="btn btn-primary btn-outlined" href="#">Celeb</a></li>
						<li><a class="btn btn-primary btn-outlined" href="#">Video</a></li>
						<li><a class="btn btn-primary btn-outlined" href="#">Social</a></li>
					</ul>	
				</div>col-lg-4
				<div class="col-lg-4">
					<h4 class="widget-title">Global Coverage</h4>
					<p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
				</div>col-lg-4
				<div class="col-lg-4">
					<h4 class="widget-title">Find Us</h4>
					<p>New York Office,<br/>
					New York.<br/>
					F: +458 4808-5489<br/>
					E: <a href="mailto:#">hello@quoteguys.com</a>
					</p>
				</div>col-lg-4
			</div>row
		</div>container
		<div id="footer-copyright">
			<div class="container">
				Created With Love By Distinctive Themes
			</div>
		</div>
	</div> -->
	
	<a id="gototop" class="gototop no-display" href="#"><i class="fa fa-angle-up"></i></a>
	<!-- END MAIN FOOTER -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="<c:url value="/resources/assets/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/plugins.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/imagesloaded.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/prettyPhoto.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/init.js"/>"></script>

</body>
<script>
let m=parseInt(`${pagenum}`);
let b=Math.ceil(`${countFree_board}`/20);
$(document)
.ready(function(){
	console.log(b);
	if(m>=b-2 && m>2) m=b-2;
	if(m<=b) m=1;
	shtt(m);
})
.on('click','#rightsheet',function(){
	if(m+2==b||m+2>b) return false;
	shtt(++m);
})
.on('click','#leftsheet',function(){
	if(m==1) return false;
	shtt(--m);
})
//avatar click <a href='' id='meminfo' seq='나'>nick</a>
.on('click','#meminfo',function(){
	let seq=$(this).attr('seq');
	window.open("meminfo?m_no="+seq, "_blank", "width=400, height=400, top=40, left=1340");
	return false;
})
//note click  <a href='' id='btnSendNote' myseq='상대' yourseq='나'>메세지</a>
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

.on('keyup','#searching',function(key){ // search connect enter
	if(key.keyCode==13){
		$('#btnSearch').trigger('click');
	}
	return false;
})
//search
.on('click','#btnSearch',function(){
	//검색하는 게시판의 내용이 들어가야함  view 이용해서 사용할 것!
	let table='bfsearch';  // view 이름
	let search=$('#searching').val(); //검색값
	if($('#searching').val()==''){
		alert('검색값이 없습니다.');
		return false;
	}
	$('#tbd').empty();
	$('#btnAll').detach();
	if($('#selSearch option:selected').text()=='작성자'){
		$.ajax({
			type:'post',url:'searchNick',data:{table:table,search:search},dataType:'json',
			success:function(data){
				//받은 데이터 보여줄 장소 지정, 실제 작성중 id 말고 닉네임이 맞을 듯
				if(data==''){
					alert('검색값이 없습니다');
				}else {
					for(let i=0;i<data.length;i++){
						let jo=data[i];
						let str='<tr><td>'+jo['seqno']+'</td><td><a href="freedetail?b_no='+jo['seqno']+'">'
								+jo['title']+'</a></td><td><a href="" id="meminfo" seq="'+jo['m_no']+'">'
								+jo['nick']+'</a></td><td>'+jo['date']+'</td><td>'+jo['views']+'</td>';
						$('#tbd').append(str);
					}
				}
			},
			error:function(){
			},
			complete:function(){}
		})
		$('#showAll').append('<a class="btn btn-primary btn-outlined" href="/pj/freeboard" id="btnAll"><p id="all1">전체보기</p></a>');
	} else {
		$('#thd').empty();
		$('#thd').append('<tr><th>게시번호</th><th>제목</th><th>작성자</th><th>내 용</th><th>작성일자</th><th>조회수</th></tr>');
		$.ajax({
			type:'post',url:'searchTNC',data:{table:table,search:search},dataType:'json',
			success:function(data){
				//받은 데이터 보여줄 장소 지정, 실제 작성중 id 말고 닉네임이 맞을 듯
				console.log(data);
				
				if(data==''){
					alert('검색값이 없습니다');					
				}else{
					for(let i=0;i<data.length;i++){
						let jo=data[i];
						let str='<tr><td>'+jo['seqno']+'</td><td><a href="freedetail?b_no='+jo['seqno']+'">'
						+jo['title']+'</a></td><td><a href="" id="meminfo" seq="'+jo['m_no']+'">'
						+jo['nick']+'</a></td><td>'+jo['con']+'</td><td>'+jo['date']+'</td><td>'+jo['views']+'</td>';
						$('#tbd').append(str);
					}
					
				}
			},
			error:function(){
			},
			complete:function(){}
		})
		$('#showAll').append('<a class="btn btn-primary btn-outlined" href="/pj/freeboard" id="btnAll"><p id="all1">전체보기</p></a>');
	}
	return false;
})
function shtt(a){
	$('#paginationClass').empty();
	let html='<li class="page-item"><a id="leftsheet" class="page-link" href="#"aria-label="Previous" onclick="return false;"><span aria-hidden="true">&laquo;</span></a></li>';
	html+=sheet(a);
	html+='<li class="page-item"><a id="rightsheet" class="page-link" href="#"	aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>';
	$('#paginationClass').append(html);
}
function sheet(a){
	var html='';
	 let k=0; 
	 if(a+3>b){
		k=b;
	}else if(a+3<=b){
		k=a+2;
	}
	
	for(let i=a; i<=k;i++){
	html+='<li class="page-item"><a class="page-link" href="freeboard?pagenum='+i+'">'+i+'</a></li>';
	};
	return html;
}
</script>

</html>
