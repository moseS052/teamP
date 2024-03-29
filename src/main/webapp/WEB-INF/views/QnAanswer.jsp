<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon"
	href="<c:url value="/resources/assets/img/favicon.ico"/>">

<title>자주 묻는 질문</title>

<link href="<c:url value="/resources/assets/css/bootstrap.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/assets/css/animate.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/assets/css/prettyPhoto.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/assets/css/pe-icons.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/assets/css/style.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/assets/css/font-awesome.min.css"/>"
	rel="stylesheet">
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
	$(document).ready(
			function() {
				jQuery('#headerwrap').backstretch(
						[ "resources/assets/img/bg/q.png","resources/assets/img/bg/q2.png"
								 ], {
							duration : 8000,
							fade : 500
						});

			});
</script>
<style>
	@font-face {
    font-family: 'Binggrae';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	body{
		font-family: 'Binggrae';
	}
	h2{
		font-family: 'Binggrae';
	}
	a{
		font-family: 'Binggrae';
	}
	.form-control:focus {
        border-color: #28a745;
        box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
    }
   a#meminfo, #btnSendNote, #goList{
 	display:inline; 
	font-size:18px;
	color:#007979;
	font-family: 'GangwonEdu_OTFBoldA';
}
a#goList{
margin-left: 4px

}
a#yesyes{
	display:inline;
	font-size:14px;
	color:#007979;
	font-family: 'Binggrae';
}
#firstAvatar{
	display:inline; 
	margin-left: -3px;
	margin-top: 0px;
}
#firstNick{
	margin-left:18px;
	display:inline; 
	font-size:16px;
	font-family: 'Binggrae';
}
#menu-logo{
	margin-top:-8px;
}
#undm{
	padding-top: 8px !important;
}
#undk,#undd{
	display:inline; 
	font-size:14px;
	margin-left:-8px;
}
#avaung{
	margin-top:-13px;
	margin-right:-18px;
}
#alarmDiv{
	width:100%;
}
.img-responsive3{
	width: 100%;
    height: 100px;
}
.img-responsive4{
	width: 100%;
    height: 250px;
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
    <nav class="menu" id="theMenu">
		<div class="menu-wrap">
			<i class="fa fa-bars menu-close"></i>
			<div id="menu-logo">
				<h2 id="undm"><span class="fa fa-smile-o logo-icon"></span><span style="font-family:'Binggrae';">재능드림</span></h2>
				<c:if test="${m_no!=null}">
				<h2 ><a href='' id="firstAvatar"><img src=<c:url value="${avatar}"/> width="35px" height="35px" id='meminfo' seq="${m_no}" /></a>
				<a href='' id="firstNick">${nick }&nbsp;님</a>
				<div class="dropdown pull-right" id="avaung">
				<a href="#" class="dropdown-toggle menu-icon" data-toggle="dropdown" id="alarmClick"></a>
		        <div id="alarmInto" class="dropdown-menu" style="width:740px; opacity: 1; left: 0; padding:10px 10px 10px 10px;">
				</div>
				</div>
				<br><a href='logout' align=left>Logout</a></h2>
				
				</c:if>				
			 	<c:if test="${m_no==null}">
				<a href="login" style="font-size:14px;">login</a><a href="signup" style="font-size:14px;">회원가입</a>
				</c:if>				
			</div>
			
			<ul id="main-menu">
			<c:if test="${userinfo!=null}">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">개인정보<i
						 class="fa fa-user menu-icon" aria-hidden="true"></i></a>
					<ul class="dropdown-menu">
						<li><a href="privacy?m_no=${m_no}">개인정보수정</a></li>
						<li><a href="pwchange?m_no=${m_no}">비밀번호변경</a></li>
						<li><a href="MyPost?m_no=${m_no}">내가쓴게시물찾기</a></li>
						<li><a href="Mysubs?m_no=${m_no}">내가신청한게시물찾기</a></li>
					</ul></li>
					</c:if>
				<li class="dropdown"><a href="/pj" class="dropdown-toggle">Home 
					<i class="fa fa-home menu-icon"></i></a>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Pages <i class="fa fa-file menu-icon"></i></a>
					<ul class="dropdown-menu">	
						<li>
						<c:if test="${m_no==null}">
						<a href="login">봉사활동기획서</a>
						</c:if>
						<c:if test="${m_no!=null}">
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
						<li><a id='question' href="#">1:1 질문</a></li>
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
                <h2 class="main-title">${qtitle}</h2>
                <hr>                
            </div>
		</div><!-- /container -->
	</div><!-- /headerwrap -->

	<div id="content-wrapper">
	    <section id="about">
	   		<div class="container">
		    	<div class="gap"></div>
                    <div class="row gap">
                        <div class="fade-up col-md-10 fade-up" style="margin:20px 20px 20px 60px;">
                            <div class="centered">
                                <p><input type="text" class="form-control" name="website" id="website" value="${qcontent }" style="text-align:center; font-size:20px;" readonly /></p>
                                <p><textarea class="form-control"  readonly style="height:600px; padding:60px 30px 30px 60px; font-size:20px; resize:none">${qa }</textarea></p>
                        	</div>
                        </div>
                    </div><!-- row -->
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
	</div>
	
	<a id="gototop" class="gototop no-display" href="#"><i class="fa fa-angle-up"></i></a> -->
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
var popup;
$(document)
.ready(function(){
	if(`${m_no}`!=''){
		alarmList()
	}
})
.on('click','#firstNick',function(){
	$('#meminfo').trigger('click');
	return false;
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
	popup=window.open("note?m_no="+m_no+"&m_pa_no="+m_pa_no, "_blank", "width=350, height=400, top=110, left=1700");
	
	popup.onbeforeunload=function(){
		location.reload(); 
	}
	}
	return false;
})
 .on('click','#question',function(){	
	if(`${m_no}`==''){
		alert('로그인 후 사용가능합니다.');
		return false;
	}else{
		document.location='/pj/question';
	}
})
.on('click','#goList, #btnSendNote, #yesyes',function(){ //alarm counting
	let ms=$(this).parent().parent().attr("alseq");
	console.log(ms);
	$.ajax({
		type:'get',url:'alarmCheck',data:{al_no:ms},dataType:'text',
		success:function(){
			
		},
		error:function(){
		},
		complete:function(){}
	})
})


function alarmList() {
	let str='';
	let icon='<img src=<c:url value="resources/assets/img/all.png"/> width="30px" height="30px" />';
	
	$.ajax({
		type:'get',url:'alarm',data:{},dataType:'json',
		success:function(data){
			for(let i=0;i<data.length;i++){
				let jo=data[i];
				if(jo['al_check']==0){
					icon='<img src=<c:url value="resources/assets/img/all1.png"/> width="30px" height="30px" />';
					break;
				}else icon='<img src=<c:url value="resources/assets/img/all.png"/> width="30px" height="30px" />';
			}
			$('#alarmClick').append(icon);
			for(let i=0;i<7;i++){
				let jo=data[i];
				if(jo['al_check']==0){
					str='<div id="alarmDiv" alseq='+jo['al_no']+' class="well" style="height:35px; margin-bottom:5px; background-color:white"><div class="square pull-right" id="but" style="margin-top:-13px;"><a id="yesyes" href="">확인&nbsp;&nbsp;&nbsp;</a>'+jo['al_time']+'</div><h4 style="margin-top:-15px;margin-left:-20px;">'+jo['alarm']+'</h4></div>';
					$('#alarmInto').append(str);
				}else {
					str='<div id="alarmDiv" alseq='+jo['al_no']+' class="well" style="height:35px; margin-bottom:5px; background-color:#e4e4e4"><div class="square pull-right" id="but" style="margin-top:-4px;">'+jo['al_time']+'</div><h4 style="margin-top:-15px;margin-left:-20px;">'+jo['alarm']+'</h4></div>'
					$('#alarmInto').append(str);
				}
			}
		},
		error:function(){
		},
		complete:function(){}
	})
}	
</script>
</html>
