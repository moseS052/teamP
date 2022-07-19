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
											id="writer_1"><input type="text" id="commentNumber">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<textarea rows="8" class="form-control" placeholder="Comment"
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

	<a id="gototop" class="gototop no-display" href="#"><i
		class="fa fa-angle-up"></i></a>
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
	let b_no = '${detail.b_no}';//게시글 번호
	$(document).ready(function() {
	}).on('click', '#page_btn', function() {
		commentLIst();
	}).on('click', '#submit', function() {
		insertComment();
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
		let p =$('#page').val();
		console.log(s);
		$('#writer_1').val(s)
		$('#commentNumber').val(t);
		$('#submit').val('댓글수정');
		
	}) 
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
				$('#page').val('');
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
					        		  +'<strong>'+com['m_no']+'</strong>&nbsp; <small>'
					            	  +com['c_date']+'</small><div class="dropdown pull-right">'
					            	  +'<a href="#" class="dropdown-toggle fa fa-gear menu-icon" data-toggle="dropdown"></a>'
					                  +'<div class="dropdown-menu" style="opacity: 0.5; left: 0; padding:10px 10px 10px 10px;">'
					                  +'<a href=# class="dropdown-item" id="update_comment" seq='+com['m_no']+' value="'+com['c_no']+'">수정</a><br>'
					                  +'<a href=# class="dropdown-item" id="delete_comment" value="'+com['c_no']+'">삭제</a></div>'
					            	  +'</div></div>'
					    			  +'<p>'+com['c_con']+'</p>'
					    			  +'<a class="pull-left btn btn-primary btn-outlined" href="#">답글</a></div>';
					    	console.log(list);
							$('#replyList').append(list);
						}

					}
				});
	}
</script>
</html>
