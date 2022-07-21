<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"> -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon"
	href="<c:url value="/resources/assets/img/favicon.ico"/>">
<title>Team Project</title>
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
<script src="<c:url value="/resources/assets/js/jquery.js"/>"></script>
<script src="<c:url value="/resources/assets/js/modernizr.custom.js"/>"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<script type="text/javascript">
	$(document).ready(
			function() {
				jQuery('#headerwrap').backstretch(
						[ "resources/assets/img/bg/bg1.jpg",
								"resources/assets/img/bg/bg2.jpg",
								"resources/assets/img/bg/bg3.jpg" ], {
							duration : 8000,
							fade : 500
						});

			})
</script>

</head>
<style>

</style>
<body class="single single-post">

	<div id="preloader"></div>

	<div id="search-wrapper">
		<div class="container">
			<input id="search-box" placeholder="Search"><span
				class="close-trigger"><i class="fa fa-angle-up"></i></span>
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
			</div>
			<ul id="main-menu">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Home <i class="fa fa-home menu-icon"></i></a>
					<ul class="dropdown-menu">
						<li><a href="index.html">Home Agency</a></li>
						<li><a href="index-blog.html">Home Blog</a></li>
						<li><a href="index-single-page.html">Home Single Page</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Pages <i class="fa fa-file menu-icon"></i></a>
					<ul class="dropdown-menu">
						<li><a href="about-us.html">About Us</a></li>
						<li><a href="contact-us.html">Contact Us</a></li>
						<li><a href="404.html">404</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Blog <i class="fa fa-folder menu-icon"></i></a>
					<ul class="dropdown-menu">
						<li><a href="single-post.html">Single Post</a></li>
						<li><a href="single-post-sidebar.html">Single Post
								Sidebar</a></li>
						<li><a href="category.html">Category Page</a></li>
						<li><a href="category-alt.html">Category Page Alt</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Portfolio <i
						class="fa fa-camera menu-icon"></i></a>
					<ul class="dropdown-menu">
						<li><a href="single-project.html">Single Project</a></li>
						<li><a href="portfolio-4-column.html">Portfolio 4 Column</a></li>
						<li><a href="portfolio-3-column.html">Portfolio 3 Column</a></li>
						<li><a href="portfolio-2-column.html">Portfolio 2 Column</a></li>
					</ul></li>
				<li><a href="#" class="search-trigger">Search <i
						class="fa fa-search menu-icon"></i></a></li>
			</ul>

			<ul id="social-icons">
				<li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
				<li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
				<li class="dribbble"><a href="#"><i class="fa fa-dribbble"></i></a></li>
			</ul>
		</div>
	</nav>
	<!-- END NAV -->
	
	<!-- MAIN IMAGE SECTION -->
	<div id="headerwrap" class="half">
		<div class="container">
			<div class="gap"></div>
			<div id="bannertext" class="centered fade-down section-heading">
				<h2 class="main-title">About Us</h2>
				<hr>
				<p>She evil face fine calm have now. Separate screened he
					outweigh of distance landlord.</p>
			</div>
		</div>
		<!-- /container -->
	</div>
	<input type="text" readonly id="comment_cno">
	<div id="content-wrapper">
		<section id="about"></section>
		<div class="container">
			<div class="gap"></div>
			<div class="row gap">
				<div class="col-md-10">
					<input type="text" id="page"><input type="button"
						id="page_btn">
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
									<div class="col-sm-6">
										<input type="text" class="form-control" placeholder="작성자"
											id="writer_1">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<textarea rows="8" class="form-control" style="resize:none;" placeholder="Comment"
											id="c_con"></textarea>
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
	</div>
	</div>
	</section>
	</div>

	<!-- MAIN FOOTER -->
	<div id="footerwrap">
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
				</div>
				<!--col-lg-4-->
				<div class="col-lg-4">
					<h4 class="widget-title">Global Coverage</h4>
					<p>The point of using Lorem Ipsum is that it has a more-or-less
						normal distribution of letters, as opposed to using 'Content here,
						content here', making it look like readable English.</p>
				</div>
				<!--col-lg-4-->
				<div class="col-lg-4">
					<h4 class="widget-title">Find Us</h4>
					<p>
						New York Office,<br /> New York.<br /> F: +458 4808-5489<br />
						E: <a href="mailto:#">hello@quoteguys.com</a>
					</p>
				</div>
				<!--col-lg-4-->
			</div>
			<!-- row -->
		</div>
		<!-- container -->
		<div id="footer-copyright">
			<div class="container">Created With Love By Distinctive Themes
			</div>
		</div>
	</div>

	
	<!-- END MAIN FOOTER -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<c:url value="/resources/assets/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/plugins.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/imagesloaded.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/prettyPhoto.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/init.js"/>"></script>
	<!-- <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script> -->
</body>
<script>
/* let name='<a href=#>'+ +'</a>' */
	let b_no = '${detail.b_no}';//게시글 번호
	$(document).ready(function() {
	})
	/* .on('click','a',function(){
		preventDefault();
	}) */
	
	
	.on('click', '#page_btn', function() {
		commentLIst();
	}).on('click', '#submit', function() {
		let str=$('#c_con').val();
		if(str.replace(/\s| /gi, "").length==0){
			alert('내용없음');
		}else{
			insertComment();	
		}
	})
	.on('click','#delete_comment',function(){
		console.log($(this).attr('value'));
		let s = $(this).attr('value');
		if(confirm('댓글을 삭제하시겠습니까')){
		 	$.ajax({
				url:'delete_comment',
				data:{c_no:s},
				dataType:'json',
				type:'get',
				success:function(data){
					console.log(data);
					commentLIst();
				}
			});
		}
	})
	 .on('click','#update_comment',function(){
		let s=$(this).attr('seq');
		let t=$(this).attr('value');
		$('#comment_cno').val(t);
		console.log(t);
		let p =$('#page').val();
		let str=$('#comment_content'+t).text();
		let html='<textarea id="modifycomment" tseq="'+t+'" style="width:800px; height:100px; resize:none;">'+str+'</textarea><br>'
				 +'<a class="pull-left btn btn-primary btn-outlined" id="reply_revice">댓글수정</a>';
		$('#comment_board'+t).html(html);
		
	})
	.on('click','#reply_revice',function(){
		console.log('버튼 눌리나요');
		console.log($('#modifycomment').attr('tseq'));
		console.log($('#modifycomment').val());
		  $.ajax({
			url:'update_comment',
			data:{
				c_no:$('#comment_cno').val(),
				c_con:$('#modifycomment').val()	
			},
			dataType : 'json',
			type:'post',
			success:function(data){
				commentLIst();
			}
		});  
	})
	.on('click','#re_reply',function(){
		let s=parseInt($(this).attr('reseq'));
		console.log($(this).attr('reseq'));
		let t=$(this).text().split('&nbsp;');
		console.log($('#reply_controll'+s).val());
		if($('#reply_controll'+s).val()=='close'){
			rerplyList(s);
			
			$('#reply_controll'+s).val('open');
			let strs='<div style="display:inline-block; overflow:hiddlen; white-space:nowrap;"><textarea style="width:400px; height:50px; resize:none;" id="re_replytextArea"></textarea>'
				 +'&nbsp;&nbsp;<input type="button" id="re_replyaddbtn" class="btn btn-primary btn-outlined" value="답글추가"><input type="hidden" id="re_replynum" value="'+s+'"></div>';
			$('#re_replyadd'+s).append(strs);
			$('#re_replynum').val(s);
	  	}else if($('#reply_controll'+s).val()=='open'){
		  	$('#re_replylist'+s).empty();
		  	$('#re_replyadd'+s).empty();
		  	$('#re_replynum').val('');
		  	$('#reply_controll'+s).val('close');
	  	};
	})
	.on('click','#re_replyaddbtn',function(){
		let str=$('#re_replytextArea').val();
		if(str.replace(/\s| /gi, "").length==0){
			alert('내용없음');
		}else if(str.indexOf('@')==0) {
			let tag=str.substr(str.indexOf('@'), str.indexOf(' '));
			let sliceStr=str.substr(str.indexOf(' '), str.length-1);
			let s = $('#re_replynum').val();
			insertRe_ReplyTag(s, tag, sliceStr);
			let sum=parseInt($('#counts'+s).text())+1;
			$('#counts'+s).text(sum);
		}
		else {
			let s = $('#re_replynum').val();
			insertRe_Reply(s);
			let sum=parseInt($('#counts'+s).text())+1;
			$('#counts'+s).text(sum);
		}
	})
	.on('click','#deletere_reply',function(){
		if(confirm('답글삭제')){
			let s = $('#re_replynum').val();
			let sum=parseInt($('#counts'+s).text())-1;
			$('#counts'+s).text(sum);
			let num = $(this).attr('value');
			deleteRe_Reply(num);
		}
	})
	.on('click','#updatere_reply',function(){
		let c_no = $(this).attr('seq1');
		let c_pa_no = $(this).attr('seq2');
		let b_no = $(this).attr('seq3');
		let m_no = $(this).attr('seq4');
		let str=$('#rerplycontent'+c_no).text();
		let html='<textarea id="rereplyUpdateContent" style="width:500px; resize:none;">'+str+'</textarea>&nbsp;&nbsp;&nbsp;'
				 +'<a class="btn btn-primary btn-outlined" id="rerply_update"'
				 +'seq1="' + c_no +'"'+ 'seq2="' + c_pa_no + '"' + 'seq3="' + b_no + '"' + 'seq4="' + m_no
				 +'">답글수정</a>';
		$('#replycontentBoard'+c_no).html(html)
	})
	.on('click','#rerply_update',function(){
		let c_no = $(this).attr('seq1');
		console.log(c_no);
		let c_pa_no = $(this).attr('seq2');
		let b_no = $(this).attr('seq3');
		let m_no = $(this).attr('seq4');
		let c_con=$('#rereplyUpdateContent').val();
		$.ajax({
			url:'re_replyupdate',
			data:{
				c_no : c_no,
				b_no : b_no,
				c_con : c_con,
				m_no : m_no,
				c_pa_no : c_pa_no
				},
			dataType:'json',
			type:'post',
			success:function(data){
				console.log(data);
				rerplyList(c_pa_no);
			}
			
		});
	})
 	.on('click','#ansercomment',function(){
 		let str='@'+$(this).attr('seq')+' ';
 		$('#re_replytextArea').val(str);
	 	console.log();
 	})
	//대댓글 리스트 불러오기
	function rerplyList(num){
		$.ajax({
			url:'re_reply',
			data:{c_no:num},
			dataType:'json',
			type:'get',
			beforeSend : function() {
				$('#re_replylist'+num).empty();
			},
			success : function(data) {
				let html='';
				for(let i=0; i<data.length;i++){
					let com = data[i];
					html='<div class="well" style="margin:0 50px 0px 50px;">'
		    			 +'<div class="media-heading">'
		        		 +'<a href=#><strong>'+com['m_no']+'</strong></a>&nbsp;'
		        		 +'<small>'+com['c_date']+'</small>'
		        		 +'<div class="dropdown pull-right">'
		            	 +'<a href="#" class="dropdown-toggle fa fa-gear menu-icon" data-toggle="dropdown"></a>'
		            	 +'<div class="dropdown-menu" style="opacity: 0.5; left: 0; padding:10px 10px 10px 10px;">'
		                 +'<a href=# class="dropdown-item" id="updatere_reply" seq1="'+com['c_no']+'"'+ 'seq2="'+com['c_pa_no']+'"'+'seq3="'+com['b_no']+'"'+'seq4="'+com['m_no']+'">수정</a><br>'
		                 +'<a href=# class="dropdown-item" id="deletere_reply" value="'+com['c_no']+'">삭제</a>'
		                 +'</div></div></div><div id="replycontentBoard'+com['c_no']+'"><p id="rerplycontent'+com['c_no']+'">'+com['c_con']+'</p><a id="ansercomment" seq="'+com['m_no']+'" href="javascript:void(0);">답글</a></div></div>';
					 $('#re_replylist'+num).append(html);
				};
				
			}
		});
	}
	function deleteRe_Reply(num){
		let s = $('#re_replynum').val();
		$.ajax({
			url:'re_replydelete',
			data:{
				c_no:num
				  },
			type:'post',
			dataType:'json',
			success:function(data){
				console.log(data);
				rerplyList(s);
			}
		});
	}
	
	function insertRe_Reply(s){
		
		$.ajax({
			url:'re_replyinsert',
			data:{
				b_no:$('#page').val(),
				c_pa_no:$('#realc_no'+s).val(),
				m_no:55,
				c_con:$('#re_replytextArea').val()
				  },
			type:'post',
			dataType:'json',
			success:function(data){
				console.log(data);
				$('#re_replytextArea').val('');
				rerplyList(s);
			}
			
		});
	}
	function insertRe_ReplyTag(s, tag, sliceStr){
		let html='<a href=# style="font-weight:bold">'+tag+'</a>'+sliceStr;
		$.ajax({
			url:'re_replyinsert',
			data:{
				b_no:$('#page').val(),
				c_pa_no:$('#realc_no'+s).val(),
				m_no:55,
				c_con:html
				  },
			type:'post',
			dataType:'json',
			success:function(data){
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
				c_con : $('#c_con').val(),
				m_no : $('#writer_1').val()
			},
			type : 'post',
			success : function() {
				commentLIst();
				$('#c_con').val('');
				$('#writer_1').val('');
			}
		});
	}
	function commentLIst() {
		$
				.ajax({
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
					        		  +'<strong>'+com['m_no']+'</strong>&nbsp; <small><input type="hidden" value="close" id="reply_controll'+com['c_no']+'"><input type="hidden" id="realc_no'+com['c_no']+'" value="'+com['c_no']+'">'
					            	  +com['c_date']+'</small><div class="dropdown pull-right">'
					            	  +'<a href="#" class="dropdown-toggle fa fa-gear menu-icon" data-toggle="dropdown"></a>'
					                  +'<div class="dropdown-menu" style="opacity: 0.5; left: 0; padding:10px 10px 10px 10px;">'
					                  +'<a href=# class="dropdown-item" id="update_comment" seq='+com['m_no']+' value="'+com['c_no']+'">수정</a><br>'
					                  +'<a href=# class="dropdown-item" id="delete_comment" value="'+com['c_no']+'">삭제</a></div>'
					            	  +'</div></div>'
					    			  +'<div id="comment_board'+com['c_no']+'"><p id="comment_content'+com['c_no']+'">'+com['c_con']+'</p>'
					    			  +'<a class="pull-left btn btn-primary btn-outlined" id="re_reply" reseq="'+com['c_no']+'">답글&nbsp;'+'<span id="counts'+com['c_no']+'">'+com['count']+'</span>'
					    			  +'</a><div><br><br><div style="margin:0 30px 0px 50px;"'
					    			  +'id="re_replyadd'+com['c_no']+'"></div><div id="re_replylist'+com['c_no']+'"></div></div>';
					    	console.log(list);
							$('#replyList').append(list);
						}

					}
				});
	}
</script>
</html>
