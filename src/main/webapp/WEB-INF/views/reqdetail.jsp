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
<title>Detail</title>
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
	.form-control:focus {
        border-color: #28a745;
        box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
    }
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
    <nav class="menu" id="theMenu">
        <div class="menu-wrap">
            <i class="fa fa-bars menu-close"></i>
            <div id="menu-logo">
                <h2><span class="pe-7s-chat logo-icon"></span> Q</h2>
                <c:if test="${m_no==null}">
				<a href="login">login</a><a href="signup">회원가입</a>
				</c:if>
				<c:if test="${m_no!=null}">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${id}&nbsp;님<a href='logout'>Logout</a>
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
						<li><a href="<%= request.getContextPath() %>/freeboard">Free Board</a></li>
						<li><a href="<%= request.getContextPath() %>/reqboard">Request Board</a></li>
						
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
                <h2 class="main-title">Detail</h2>
                <hr>
                <p></p>
            </div>
		</div>
	</div>
 
	<div id="content-wrapper">
	    <section id="about">
	   		<div class="container">
		    	<div class="gap"></div>
				<div class="row gap">

					<div class="col-md-12">
					<table class="table table-striped" style="">
					<input type=hidden name=b_no value="${bdto.b_no }">
					<input type=hidden name=bdto.m_no value="${bdto.m_no }">
					<tr><td colspan="2">제목: <input type=text id=b_title name=b_title size=90 style="border:none; background-color:transparent;" value="${bdto.b_title }" readonly></td>
					<tr><td colspan="2">내용: <textarea id=b_con name=b_con rows=10 cols=90 style="border:none; background-color:transparent; resize:none;" readonly>${bdto.b_con }</textarea></td>
					<tr><td>작성자 :&nbsp;&nbsp;<a href='' id='meminfo' seq='${bdto.m_no}'>${bdto.nick}</a></td>
					<td>작성일자: <input type=text id=b_date name=b_date style="border:none; background-color:transparent;"  value="${bdto.b_date }" readonly></td></tr>
					</table>
					<br><input type=button value='목록으로 돌아가기' id=btnReset class="btn btn-primary btn-outlined"<%--  onclick="location.href='<%= request.getContextPath() %>/freeboard'" --%>>
					<input type=hidden id="m_no" name="m_no" value="${m_no}">
					<input type=hidden id="bdto.m_no" name="bdto.m_no" value="${bdto.m_no }">
					<c:if test="${m_no==bdto.m_no }">
					<form id=frmup method=get action="requpdetail">
					<input type=hidden id="b_no" name="b_no" value="${bdto.b_no }">
					<input type=submit value='수정' class="btn btn-primary btn-outlined"></form>					
					<input type=hidden id="b_no" name="b_no" value="${bdto.b_no }">
					<input type=button id="del" value='글삭제' class="btn btn-primary btn-outlined">
					</c:if>
					
					
					</div>
					<input type="hidden" readonly id="comment_cno">
					<div class="col-md-10">
					<input type="hidden" id="page" value="${bdto.b_no }">
					<div id="comments">
						<div id="comments-list gap">
							<div class="media">
								<div class="media-body fade-left" id="replyList"></div>
								<input type=hidden value=1 id="pagenum">
										<div id="commentPaging"></div>
							</div>
						</div>
						<!--/#comments-list-->

						<div id="comment-form" class="mt fade-up">
							<form class="form-horizontal" role="form">
								<div class="form-group">
									<div class="col-sm-6">
										<!-- <input type="text" class="form-control" placeholder="작성자"
											id="writer_1" readonly> -->
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<textarea rows="8" class="form-control" style="resize: none;"
											placeholder="Comment" id="c_con"></textarea>
									</div>
								</div>
								<input type="button" id="submit"
									class="btn btn-primary btn-outlined" value="댓글등록">
							</form>
						</div>
						<!--/#comment-form-->
					</div>
					<!--/#comments-->





				</div>
					
				</div>
			</div>	
	    </section>
	    <input type="hidden" id="potato1" value="${bdto.m_no}">
	    <input type="hidden" id="potato">
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
let doo = 4;
$(document)
.ready(function() {
	let a=`${countComment}`/5;
	console.log(a);
	html='';
	for(let i=1;i<a+1;i++){
		html+='<a class=btn seq="'+i+'" id="commentPagingnation">'+i+'</a>';
		
	}
	$('#commentPaging').append(html);
	commentLIst();
})
.on('click','#commentPagingnation',function(){
		let seq=$(this).attr('seq');
		$('#pagenum').val(seq);
		commentLIst();
	})
.on('click','#btnReset',function(){
	document.location='/pj/reqboard';
})
.on('click','#del',function(){
	if(!confirm("정말로 글을 삭제 할까요?")) return false;

	$.ajax({
		type:'get',dataType:'text',url:'delete_free',
		data:{b_no:$('#b_no').val()},
		beforeSend:function(){
			console.log("b_no:"+$('#b_no').val());
		},
		success:function(){	
			alert('글을 삭제하였습니다');
			window.location.href="<%= request.getContextPath() %>/reqboard";
		}
	}) 
})
.on('click', '#submit', function() {
	let str = $('#c_con').val();
	if (str.replace(/\s| /gi, "").length == 0) {
		alert('내용작성해주세요');
	} else if(`${sessionm_no}`=="") {
		alert('로그인후 댓글작성 가능합니다.');
	}else{
		insertComment();
	}
})
.on('click', '#delete_comment', function() {
	console.log($(this).attr('value'));
	let s = $(this).attr('value');
	let comm_no = $(this).attr('seq');
	if(`${sessionm_no}`==comm_no){
		if (confirm('댓글을 삭제하시겠습니까')) {
			$.ajax({
				url : 'delete_comment',
				data : {
					c_no : s
				},
				dataType : 'json',
				type : 'get',
				success : function(data) {
					console.log(data);
					commentLIst();
				}
			});
		}
	}else{
		alert('삭제 권한이 없습니다.')
	}

})
.on('click', '#update_comment',	function() {
	let s = $(this).attr('seq');
	let t = $(this).attr('value');
	if(s==`${sessionm_no}`){
	$('#comment_cno').val(t);
	console.log(t);
	let p = $('#page').val();
	let str = $('#comment_content' + t).text();
	let html = '<textarea id="modifycomment" tseq="'+t+'" style="width:800px; height:100px; resize:none;">'
			+ str
			+ '</textarea><br>'
			+ '<a class="pull-left btn btn-primary btn-outlined" id="reply_revice">댓글수정</a>';
	$('#comment_board' + t).html(html);
	}else{
		alert('수정 권한이 없습니다.')
	}

})
.on('click', '#reply_revice', function() {
	console.log('버튼 눌리나요');
	console.log($('#modifycomment').attr('tseq'));
	console.log($('#modifycomment').val());
	$.ajax({
		url : 'update_comment',
		data : {
			c_no : $('#comment_cno').val(),
			c_con : $('#modifycomment').val()
		},
		dataType : 'json',
		type : 'post',
		success : function(data) {
			commentLIst();
		}
	});
})
.on('click', '#btndoo', function() {
	let s = $(this).attr('seqnum');
	doo += 5;
	console.log(s);
	rerplyList(s, doo);
})
.on('click','#re_reply',function() {
	let s = parseInt($(this).attr('reseq'));
	$('#potato').val($(this).attr('mno'));
	let t = $(this).text().split('&nbsp;');
	console.log($('#reply_controll' + s).val());

	if ($('#reply_controll' + s).val() == 'close') {
		rerplyList(s, doo);
		$('#reply_controll' + s).val('open');
		let strs = '<div style="display:inline-block; overflow:hiddlen; white-space:nowrap;"><textarea style="width:400px; height:50px; resize:none;" id="re_replytextArea"></textarea>'
				+ '&nbsp;&nbsp;<input type="button" id="re_replyaddbtn" class="btn btn-primary btn-outlined" value="답글추가"><input type="hidden" id="re_replynum" value="'+s+'">'
				+ '</div>';
		$('#re_replyadd' + s).append(strs);
		$('#re_replynum').val(s);
	} else if ($('#reply_controll' + s).val() == 'open') {
		$('#re_replylist' + s).empty();
		$('#re_replyadd' + s).empty();
		$('#re_replynum').val('');
		$('#reply_controll' + s).val('close');
		minus();
	};
})
.on('click','#re_replyaddbtn',function() {
	let str = $('#re_replytextArea').val();
	if (str.replace(/\s| /gi, "").length == 0) {
		alert('내용없음');
	} else if (str.indexOf('@') == 0) {
		let tag = str.substr(str.indexOf('@'), str
				.indexOf(' '));
		let sliceStr = str.substr(str.indexOf(' '),
				str.length - 1);
		let s = $('#re_replynum').val();
		insertRe_ReplyTag(s, tag, sliceStr);
		let sum = parseInt($('#counts' + s).text()) + 1;
		$('#counts' + s).text(sum);
	} else {
		let s = $('#re_replynum').val();
		insertRe_Reply(s);
		let sum = parseInt($('#counts' + s).text()) + 1;
		$('#counts' + s).text(sum);
	}
})
.on('click', '#deletere_reply', function() {
	let m_no=$(this).attr('seq');
	console.log(m_no);
	if(m_no==`${sessionm_no}`){
	if (confirm('답글삭제 하시겠습니까')) {
		let s = $('#re_replynum').val();
		let sum = parseInt($('#counts' + s).text()) - 1;
		$('#counts' + s).text(sum);
		let num = $(this).attr('value');
		deleteRe_Reply(num);
	}
	}else{
		alert('권한이 없습니다.');
	}
})
.on('click','#updatere_reply',	function() {
			let c_no = $(this).attr('seq1');
			let c_pa_no = $(this).attr('seq2');
			let b_no = $(this).attr('seq3');
			let m_no = $(this).attr('seq4');
		if(m_no==`${sessionm_no}`){
			let str = $('#rerplycontent' + c_no).text();
			let html = '<textarea id="rereplyUpdateContent" style="width:500px; resize:none;">'
					+ str
					+ '</textarea>&nbsp;&nbsp;&nbsp;'
					+ '<a class="btn btn-primary btn-outlined" id="rerply_update"'
	 				+'seq1="' + c_no +'"'+ 'seq2="' + c_pa_no + '"' + 'seq3="' + b_no + '"' + 'seq4="' + m_no
	 				+'">답글수정</a>';
			$('#replycontentBoard' + c_no).html(html)
		}else{
			alert('권한이 없습니다.');
		}
})
.on('click', '#rerply_update', function() {
	let c_no = $(this).attr('seq1');
	console.log(c_no);
	let c_pa_no = $(this).attr('seq2');
	let b_no = $(this).attr('seq3');
	let m_no = $(this).attr('seq4');
	let c_con = $('#rereplyUpdateContent').val();
	$.ajax({
		url : 're_replyupdate',
		data : {
			c_no : c_no,
			b_no : b_no,
			c_con : c_con,
			m_no : m_no,
			c_pa_no : c_pa_no
		},
		dataType : 'json',
		type : 'post',
		success : function(data) {
			console.log(data);
			rerplyList(c_pa_no);
		}
	});
})
.on('click', '#ansercomment', function() {
	let str = '@' + $(this).attr('seq') + ' ';
	$('#potato').val($(this).attr('mno'));
	$('#re_replytextArea').val(str);
	console.log();
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

//대댓글 리스트 불러오기
function rerplyList(num, doo) {
	$.ajax({
		url : 're_reply',
		data : {
			c_no : num
		},
		dataType : 'json',
		type : 'get',
		beforeSend : function() {
			$('#re_replylist' + num).empty();
		},
		success : function(data) {
			let html = '';
			for (let i = 0; i < data.length; i++) {
				let com = data[i];
				html = '<div class="well" style="margin:0 50px 0px 50px;">'
						+ '<div class="media-heading">'
						+ '<a href=#><strong>'
						+ com['nick']
						+ '</strong></a>&nbsp;'
						+ '<small>'
						+ com['c_date']
						+ '</small>'
						+ '<div class="dropdown pull-right">'
						+ '<a href="#" class="dropdown-toggle fa fa-gear menu-icon" data-toggle="dropdown"></a>'
						+ '<div class="dropdown-menu" style="opacity: 0.5; left: 0; padding:10px 10px 10px 10px;">'
						+ '<a class="btn dropdown-item" id="updatere_reply" seq1="'+com['c_no']+'"'+ 'seq2="'+com['c_pa_no']+'"'+'seq3="'+com['b_no']+'"'+'seq4="'+com['m_no']+'">수정</a><br>'
						+ '<a class="btn dropdown-item" id="deletere_reply" value="'+com['c_no']+'" seq="'+com['m_no']+'">삭제</a>'
						+ '</div></div></div><div id="replycontentBoard'+com['c_no']+'"><p id="rerplycontent'+com['c_no']+'">'
						+ com['c_con']
						+ '</p><a id="ansercomment" seq="'
						+ com['nick']+'" mno="'+com['m_no']
						+ '" href="javascript:void(0);">답글</a></div>'
						+ '</div>';
				$('#re_replylist' + num).append(html);
				if (i == doo) {
					$('#re_replylist' + num)
							.append('<input type="button" id="btndoo" seqnum="'+num+'" value="더보기">');
					break;
				}
			};
		}
	});
}
function minus() {
	doo = 5;
}
function deleteRe_Reply(num) {
	let s = $('#re_replynum').val();
	$.ajax({
		url : 're_replydelete',
		data : {
			c_no : num
		},
		type : 'post',
		dataType : 'json',
		success : function(data) {
			console.log(data);
			rerplyList(s);
		}

	}); 
}

	

function insertRe_Reply(s) {
	$.ajax({
		url : 're_replyinsert',
		data : {
			b_no : $('#page').val(),
			c_pa_no : $('#realc_no' + s).val(),
			c_con : $('#re_replytextArea').val()
		},
		type : 'post',
		dataType : 'json',
		success : function(data) {
			console.log(data);
			$('#re_replytextArea').val('');
			rerplyList(s);
			alarmComTnt($('#page').val());
		}

	});
}
function insertRe_ReplyTag(s, tag, sliceStr) {
	let html = '<a href=# style="font-weight:bold">' + tag + '</a>'
			+ sliceStr;
	$.ajax({
		url : 're_replyinsert',
		data : {
			b_no : $('#page').val(),
			c_pa_no : $('#realc_no' + s).val(),
			m_no : 3,
			c_con : html
		},
		type : 'post',
		dataType : 'json',
		success : function(data) {
			console.log(data);
			$('#re_replytextArea').val('');
			rerplyList(s);
			alarmComTnt($('#page').val());
		}
	});
}

function insertComment() {
	$.ajax({
		url : 'insertcomment',
		data : {
			b_no : $('#page').val(),
			c_con : $('#c_con').val()
		},
		type : 'post',
		success : function() {
			commentLIst();
			$('#c_con').val('');
			alarmComT($('#page').val());
		}
	});
}
function commentLIst() {
	$.ajax({
		url : 'comment',
		data : {
			pagenum : $('#pagenum').val(),
			page : $('#page').val()

		},
		dataType : 'json',
		type : 'get',
		beforeSend : function() {
			$('#replyList').empty();
		},
		success : function(data) {
			for (let i = 0; i < data.length; i++) {
				com = data[i];
				let list = '<div class="well" ><div class="media-heading" >'
						+ '<strong>'
						+ com['nick']
						+ '</strong>&nbsp; <small><input type="hidden" value="close" id="reply_controll'+com['c_no']+'"><input type="hidden" id="realc_no'+com['c_no']+'" value="'+com['c_no']+'">'
						+ com['c_date']
						+ '</small><div class="dropdown pull-right">'
						+ '<a href="#" class="dropdown-toggle fa fa-gear menu-icon" data-toggle="dropdown"></a>'
						+ '<div class="dropdown-menu" style="opacity: 0.5; left: 0; padding:10px 10px 10px 10px;">'
						+ '<a class="btn dropdown-item" id="update_comment" seq="'+com['m_no']+'" value="'+com['c_no']+'">수정</a><br>'
						+ '<a class="btn dropdown-item" id="delete_comment" seq="'+ com['m_no'] +'" value="'+com['c_no']+'">삭제</a></div>'
						+ '</div></div>'
						+ '<div id="comment_board'+com['c_no']+'"><p id="comment_content'+com['c_no']+'">'
						+ com['c_con']
						+ '</p>'
						+ '<a class="pull-left btn btn-primary btn-outlined" id="re_reply" reseq="'+com['c_no']+'" mno="'+com['m_no']+'">답글&nbsp;'
						+ '<span id="counts'+com['c_no']+'">'
						+ com['count']
						+ '</span>'
						+ '</a><div><br><br><div style="margin:0 30px 0px 50px;"'
		    			  +'id="re_replyadd'+com['c_no']+'"></div><div id="re_replylist'+com['c_no']+'"></div></div>';
				$('#replyList').append(list);
			}
		}
	});
}
function alarmComT(bno){
	console.log(bno);
	$.ajax({
		type:'get',url:'alarmComT',dataType:'text',data:{b_no:bno,m_no:$('#potato1').val(),boardName:'Q'},
		success:function(){
		},
		error:function(){
		},
		complete:function(){}
	})
}
function alarmComTnt(bno){
	$.ajax({
		type:'get',url:'alarmComTnt',dataType:'text',data:{b_no:bno,m_no:$('#potato').val(),boardName:'Q'},
		success:function(){
		},
		error:function(){
		},
		complete:function(){}
	})
}
</script>
</html>
