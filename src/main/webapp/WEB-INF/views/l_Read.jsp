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
<title>Team Project</title>
<link href="<c:url value="/resources/assets/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/animate.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/prettyPhoto.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/pe-icons.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/style.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/font-awesome.min.css"/>" rel="stylesheet">
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
				[ "resources/assets/img/bg/hand.jpg","resources/assets/img/bg/bg1.jpg",
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
	h3{
		font-family: 'Binggrae';
	}
	a{
		font-family: 'Binggrae';
	}
	.form-control:focus {
        border-color: #28a745;
        box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
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
				<h2>
					<span class="pe-7s-chat logo-icon"></span> Quote
				</h2>
			 	<c:if test="${userinfo==null}">
				<a href="login">login</a><a href="signup">????????????</a>
				</c:if>
				<c:if test="${userinfo!=null}">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${userinfo}&nbsp;???<a href='logout'>Logout</a>
				</c:if>
			</div>
			<div>
				<c:if test="${m_no!=null}">
				<a href=''><img src=<c:url value="resources/assets/img/avatar1.png"/> width="20px" height="20px" id='meminfo' seq="${m_no}" /></a>
				<a href='alarm'><img src=<c:url value="resources/assets/img/all.png"/> width="30px" height="30px" /></a>
				<a href='#'><img src=<c:url value="resources/assets/img/all1.png"/> width="30px" height="30px" /></a>
				</c:if>
			</div>
			<ul id="main-menu">
			<c:if test="${userinfo!=null}">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">????????????<i
						 class="fa fa-user menu-icon" aria-hidden="true"></i></a>
					<ul class="dropdown-menu">
						<li><a href="privacy?m_no=${m_no}">??????????????????</a></li>
						<li><a href="pwchange?m_no=${m_no}">??????????????????</a></li>
						<li><a href="MyPost?m_no=${m_no}">????????????????????????</a></li>
						<li><a href="Mysubs?m_no=${m_no}">??????????????????????????????</a></li>
					</ul></li>
					</c:if>
				<li class="dropdown"><a href="/pj" class="dropdown-toggle">Home 
					<i class="fa fa-home menu-icon"></i></a>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Pages <i class="fa fa-file menu-icon"></i></a>
					<ul class="dropdown-menu">	
						<li>
						<c:if test="${userinfo==null}">
						<a href="login">?????????????????????</a>
						</c:if>
						<c:if test="${userinfo!=null}">
						<a href="proposal?m_no=${m_no}">???????????? ?????????</a>
						</c:if>
						</li>
						<li><a href="proposal_list">???????????? ????????????</a></li>
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
						<li><a href="/pj/qna">?????? ?????? ??????</a></li>
						<li><a href="/pj/question">1:1 ??????</a></li>
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
                <h2 class="main-title">???????????? ?????? ??????</h2>
                <hr>
                <p></p>
            </div>
		</div><!-- /container -->
	</div><!-- /headerwrap -->

		<div id="content-wrapper">
	    <section id="about">
	   		<div class="container">
		    	<div class="gap"></div>
				<div class="row gap">
				

					<div class="col-lg-1"></div><div class="col-lg-1"></div><div class="col-lg-8">
						<h3></h3>
						
                        <div class="well">
                        <input type="hidden" id="l_no" value="${l_no}">
                        <input type="hidden" id="user_name" value="${userinfo}">
                        <p><a href='' id='meminfo' seq='${l_mno}'>${l_nick}</a><div class="square pull-right">${l_views}</div></p>
                        <h3>${l_title}</h3><div class="square pull-right"><img src=<c:url value="/resources/assets/img/portfolio/folio13.jpg"/> width="150px" height="135px"/></div>
                        <h3>??????${l_date}</h3>                        
                        <h3>??????${l_name}</h3>
                        <h3 id="cbox">??????:${l_addr}</h3><input class="btn btn-outlined btn-primary" type="button" id="map" value="????????????" />
                        </div>
						<p>??????:${l_con}</p>
                        <div class="square pull-right" id="but">
							<p>????????????<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${lookapp}/${nop}</p>
						
							<c:if test="${userinfo!=null && l_mno eq m_no}">	
							????????????(?????????)<select id="l_name" class="form-control"></select> 
							</c:if>
                        </div>
						<div class="col-md-10">
							<input type="hidden" readonly id="comment_cno">
							<input type="hidden" id="page" value="${b_no}">
							<div id="comments">
								<div id="comments-list gap">
									<div class="media">
										<div class="media-body fade-left" id="replyList"></div>
									</div>
								</div>
								<!--/#comments-list-->
								<div id="comment-form" class="mt fade-up">
									<form class="form-horizontal" role="form">
										<div class="form-group">
											<div class="col-sm-12">
												<textarea rows="8" class="form-control" style="resize: none;"
													placeholder="Comment" id="c_con"></textarea>
											</div>
										</div>
										<input type="button" id="submit"
											class="btn btn-primary btn-outlined" value="????????????">
									</form>
								</div>
								<!--/#comment-form-->
							</div>
							<!--/#comments-->
						</div>
					</div>
				</div>
			</div>
				
	    </section>
	    
	    
	    
	</div>
	<!-- MAIN FOOTER -->
	<div id="footerwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-1"></div><div class="col-lg-1"></div><!--col-lg-1-->
				<div class="col-lg-8">
									</div><!--col-lg-8-->
			</div><!-- row -->
		</div><!-- container -->
		<div id="footer-copyright">
			<div class="container">
				Created With Love By Distinctive Themes
			</div>
		</div>
	</div>
	
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
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f3db20354b85124212a8809df35284b&libraries=services"></script>
</body>
<script>
let doo = 4;
$(document)
.ready(function(){
	commentLIst();
	console.log('??????'+getToday());
	console.log('??????'+`${l_date}`)
	shwocheck();
	applylist()
	if(`${l_mno}`==`${m_no}`){
		if(getToday()>`${l_date}`){
			let str="<a href='???????????????jsp??????'><input class='btn btn-outlined btn-primary' type='button' id='0' value='??????????????????' /></a><input class='btn btn-outlined btn-primary' type='button' id='??????????????????' value='????????????' />"
			$('#but').append(str);
			}else{let str="<input class='btn btn-outlined btn-primary' type='button' id='l_retouch' value='????????????' />"
			+"<input class='btn btn-outlined btn-primary' type='button' id='l_del' value='????????????' />"
			$('#but').append(str);}
			
	}else if(`${userinfo}`== ""){
		if(getToday()>`${l_date}`){
			let str="<a href='???????????????jsp??????'><input class='btn btn-outlined btn-primary' type='button'  value='??????????????????'/></a><a href='login'><input class='btn btn-outlined btn-primary' type='button'  value='????????????' /></a>"
			$('#but').append(str);
		}else{
			if(`${lookapp}`==`${nop}`){
				let str ="<input class='btn btn-outlined btn-primary' type='button'  value='????????????' />"
					$('#but').append(str);
			}else if(`${lookapp}`<=`${nop}`){
					let str ="<a href='login'><input class='btn btn-outlined btn-primary' type='button'  value='????????????' /></a>"
						$('#but').append(str);	
			}
		}
		
	}else if(`${l_mno}`!=`${m_no}`){
		if(getToday()>`${l_date}`){
			let str="<a href='???????????????jsp??????'><input class='btn btn-outlined btn-primary' type='button'  value='??????????????????'/></a><input class='btn btn-outlined btn-primary' type='button' id='donationReview'  value='????????????' />"
				$('#but').append(str);
		}else{
			if(`${lookapp}`==`${nop}`){
				$.ajax({
					type:'get',url:'butdiff',data:{l_no:$('#l_no').val(),m_no:`${m_no}`},
						dataType:'json',
				  		success:function(data){
				  			console.log('????????????='+data)
				  			if(data==1){
				  				let str="<input class='btn btn-outlined btn-primary'  type='button' value='????????????' />"
				  				+"<input class='btn btn-outlined btn-primary' type='button' id='apdel' value='????????????' />"
				  					$('#but').append(str);
				  			}else{
				  				let str="<input class='btn btn-outlined btn-primary' id='called' type='button' value='????????????' />"
				  					$('#but').append(str);
				  			}
			    		},
			    		error:function(){
			    			alert('????????????');
			    		},
			    		complete:function(){}
			    	});
			}else if(`${lookapp}`<=`${nop}`){
				$.ajax({
					type:'get',url:'butdiff',data:{l_no:$('#l_no').val(),m_no:`${m_no}`},
						dataType:'json',
				  		success:function(data){
				  			console.log('????????????='+data)
				  			if(data==1){
				  				let str="<input class='btn btn-outlined btn-primary' type='button' value='????????????' />"
				  				+"<input class='btn btn-outlined btn-primary' type='button' id='apdel' value='????????????' />"
				  					$('#but').append(str);
				  			}else{
				  				let str="<input class='btn btn-outlined btn-primary' id='called' type='button' value='????????????' />"
				  					$('#but').append(str);
				  			}
			    		},
			    		error:function(){
			    			alert('????????????');
			    		},
			    		complete:function(){}
			    	});
			}
		}
		
	
	}
		
	
})
//avatar click <a href='' id='meminfo' seq='???'>nick</a>
.on('click','#meminfo',function(){
	let seq=$(this).attr('seq');
	window.open("meminfo?m_no="+seq, "_blank", "width=400, height=400, top=40, left=1340");
	return false;
})
//note click  <a href='' id='btnSendNote' myseq='??????' yourseq='???'>?????????</a>
.on('click','#btnSendNote',function(){
	let m_no=$(this).attr('myseq');
	let m_pa_no=$(this).attr('yourseq');
	if(`${m_no}`==''){
		alert('????????? ??? ????????? ?????????');
		return false;
	}else{
	window.open("note?m_no="+m_no+"&m_pa_no="+m_pa_no, "_blank", "width=350, height=400, top=110, left=1700");
	}
	return false;
})
.on('click','#map',function(){
	let a=`${l_addr}`
	let ar =a.split("("); 
	console.log(ar[0]);
	console.log('"'+'map?key='+ar[0]+'"');
 	window.open('http://192.168.0.2:8080/pj/map?key='+ar[0],"_blank", "width=800, height=580, top=40, left=1340");
	return false;
	// ?????? ?????? ????????? ?????????????????????, ????????? ?????? ??? ?????? ??????
})
.on('click','#l_del',function(){
	console.log($('#l_no').val());
	$.ajax({
		type:'get',url:'l_del',data:{l_no:$('#l_no').val()},
			dataType:'json',
	  		success:function(data){
	  			console.log(data);
	  			alert('?????????????????????');
	  			document.location='/pj/proposal_list'
    		},
    		error:function(){
    			alert('????????????');
    		},
    		complete:function(){}
    	});
})

.on('click','#l_retouch',function(){
	console.log($('#l_no').val());
	
	document.location='/pj/l_retouch?l_no='+$('#l_no').val()
})
.on('click','#called',function(){
	console.log(`${m_no}`);
	console.log(`${l_no}`);
	$.ajax({
		type:'get',url:'applynew',data:{l_no:$('#l_no').val(),m_no:`${m_no}`},
			dataType:'text',
	  		success:function(){
	  			alert('???????????????????????????')
	  			document.location='/pj/l_Read?l_no='+$('#l_no').val()
    		},
    		error:function(){
    			alert('?????????????????????');
    		},
    		complete:function(){}
    	});
})
.on('click','#apdel',function(){
	console.log(`${m_no}`);
	console.log(`${l_no}`);
	$.ajax({
		type:'get',url:'applydel',data:{l_no:$('#l_no').val(),m_no:`${m_no}`},
			dataType:'text',
	  		success:function(){
	  			alert('??????????????????????????????')
	  			document.location='/pj/l_Read?l_no='+$('#l_no').val()
    		},
    		error:function(){
    			alert('?????????????????????');
    		},
    		complete:function(){}
    	});
})
.on('click', '#donationReview', function() {
		if (`${userinfo}` == '') {
			alert('????????? ??? ?????????????????????.')
		} else {
			document.location = '/pj/donationReviwe';
		}

	})
.on('click', '#submit', function() {
	let str = $('#c_con').val();
	if (str.replace(/\s| /gi, "").length == 0) {
		alert('????????????????????????');
	} else if(`${userinfo}`=="") {
		alert('???????????? ???????????? ???????????????.');
	}else{
		insertComment();
	}
})
.on('click', '#delete_comment', function() {
	console.log($(this).attr('value'));
	let s = $(this).attr('value');
	let comm_no = $(this).attr('seq');
	if(`${sessionm_no}`==comm_no){
		if (confirm('????????? ????????????????????????')) {
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
		alert('?????? ????????? ????????????.')
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
			+ '<a class="pull-left btn btn-primary btn-outlined" id="reply_revice">????????????</a>';
	$('#comment_board' + t).html(html);
	}else{
		alert('?????? ????????? ????????????.')
	}

})
.on('click', '#reply_revice', function() {
	console.log('?????? ????????????');
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
	console.log($(this).attr('reseq'));
	let t = $(this).text().split('&nbsp;');
	console.log($('#reply_controll' + s).val());

	if ($('#reply_controll' + s).val() == 'close') {
		rerplyList(s, doo);
		$('#reply_controll' + s).val('open');
		let strs = '<div style="display:inline-block; overflow:hiddlen; white-space:nowrap;"><textarea style="width:400px; height:50px; resize:none;" id="re_replytextArea"></textarea>'
				+ '&nbsp;&nbsp;<input type="button" id="re_replyaddbtn" class="btn btn-primary btn-outlined" value="????????????"><input type="hidden" id="re_replynum" value="'+s+'">'
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
		alert('????????????');
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
	if (confirm('???????????? ??????????????????')) {
		let s = $('#re_replynum').val();
		let sum = parseInt($('#counts' + s).text()) - 1;
		$('#counts' + s).text(sum);
		let num = $(this).attr('value');
		deleteRe_Reply(num);
	}
	}else{
		alert('????????? ????????????.');
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
	 				+'">????????????</a>';
			$('#replycontentBoard' + c_no).html(html)
		}else{
			alert('????????? ????????????.');
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
	$('#re_replytextArea').val(str);
	console.log();
})
//avatar click <a href='' id='meminfo' seq='???'>nick</a>
.on('click','#meminfo',function(){
	let seq=$(this).attr('seq');
	window.open("meminfo?m_no="+seq, "_blank", "width=400, height=400, top=40, left=1340");
	return false;
})
//note click  <a href='' id='btnSendNote' myseq='??????' yourseq='???'>?????????</a>
.on('click','#btnSendNote',function(){
	let m_no=$(this).attr('myseq');
	let m_pa_no=$(this).attr('yourseq');
	if(`${m_no}`==''){
		alert('????????? ??? ????????? ?????????');
		return false;
	}else{
	window.open("note?m_no="+m_no+"&m_pa_no="+m_pa_no, "_blank", "width=350, height=400, top=110, left=1700");
	}
	return false;
})

function shwocheck(){
	let ar=`${sd}`.split(',');
	let str="";
// 	console.log(ar[1]);
	for(let i=0; i<ar.length; i++){
		str+=ar[i];
	}
		$('#cbox').append('<h3>??????:'+str+'</h3>');
}
function usercheck(){
	$.ajax({
		type:'get',url:'user_check',data:{l_no:$('#l_no').val()},
			dataType:'json',
	  		success:function(){
	  			console.log(data);
	  			alert('?????????????????????');
	  			document.location='/pj/proposal_list'
    		},
    		error:function(){
    			alert('????????????');
    		},
    		complete:function(){}
    	});
}
function applylist(){
	$.ajax({
		type:'get',url:'applylist',data:{l_no:$('#l_no').val()},
			dataType:'json',
	  		success:function(data){
	  			$('#l_name').empty();
	  			for(let i=0;i<data.length;i++){
					let jo=data[i];
					let str='<option>'+jo['appnick']+'</option>';
					$('#l_name').append(str);
	  			}
    		},
    		error:function(){
    			alert('?????????????????????');
    		},
    		complete:function(){}
    	});
}
function getToday(){
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

    return year + "-" + month + "-" + day;
}
//????????? ????????? ????????????
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
						+ '<a class="btn dropdown-item" id="updatere_reply" seq1="'+com['c_no']+'"'+ 'seq2="'+com['c_pa_no']+'"'+'seq3="'+com['b_no']+'"'+'seq4="'+com['m_no']+'">??????</a><br>'
						+ '<a class="btn dropdown-item" id="deletere_reply" value="'+com['c_no']+'" seq="'+com['m_no']+'">??????</a>'
						+ '</div></div></div><div id="replycontentBoard'+com['c_no']+'"><p id="rerplycontent'+com['c_no']+'">'
						+ com['c_con']
						+ '</p><a id="ansercomment" seq="'
						+ com['nick']
						+ '" href="javascript:void(0);">??????</a></div>'
						+ '</div>';
				$('#re_replylist' + num).append(html);
				if (i == doo) {
					$('#re_replylist' + num)
							.append('<input type="button" id="btndoo" seqnum="'+num+'" value="?????????">');
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
		}
	});
}
function commentLIst() {
	$.ajax({
		url : 'comment',
		data : {
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
						+ '<a class="btn dropdown-item" id="update_comment" seq="'+com['m_no']+'" value="'+com['c_no']+'">??????</a><br>'
						+ '<a class="btn dropdown-item" id="delete_comment" seq="'+ com['m_no'] +'" value="'+com['c_no']+'">??????</a></div>'
						+ '</div></div>'
						+ '<div id="comment_board'+com['c_no']+'"><p id="comment_content'+com['c_no']+'">'
						+ com['c_con']
						+ '</p>'
						+ '<a class="pull-left btn btn-primary btn-outlined" id="re_reply" reseq="'+com['c_no']+'">??????&nbsp;'
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
</script>
</html>