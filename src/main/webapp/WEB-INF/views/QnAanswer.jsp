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
						[ "resources/assets/img/bg/bg1.jpg",
								"resources/assets/img/bg/bg2.jpg",
								"resources/assets/img/bg/bg3.jpg" ], {
							duration : 8000,
							fade : 500
						});

			});
</script>

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
				<a href="login">login</a><a href="signup">회원가입</a>
				</c:if>
				<c:if test="${userinfo!=null}">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${userinfo }&nbsp;님<a href='logout'>Logout</a>
				</c:if>
			</div>
			<div>
				<a href='#'><img src=<c:url value="resources/assets/img/avatar1.png"/> width="20px" height="20px" id='meminfo' /></a>
			</div>
			<ul id="main-menu">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Home <i class="fa fa-home menu-icon"></i></a>
					<ul class="dropdown-menu">
						<li><a href="/pj">Home Agency</a></li>
						<li><a href="index-blog.html">Home Blog</a></li>
						<li><a href="index-single-page.html">Home Single Page</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Pages <i class="fa fa-file menu-icon"></i></a>
					<ul class="dropdown-menu">
						<li><a href="proposal?m_no=45">봉사활동 기획서</a></li>
						<li><a href="proposal_list">봉사활동 현황목록</a></li>
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
					data-toggle="dropdown">Q&nbsp;&&nbsp;A <i class="fa fa-solid fa-question menu-icon"></i></a>
					<ul class="dropdown-menu">
						<li><a href="/pj/qna">자주 묻는 질문</a></li>
						<li><a id="question" href="#">1:1 질문</a></li>
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
                <h2 class="main-title"></h2>
                <hr>
                <p>${qtitle}</p>
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
				</div><!--col-lg-4-->
				<div class="col-lg-4">
					<h4 class="widget-title">Global Coverage</h4>
					<p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
				</div><!--col-lg-4-->
				<div class="col-lg-4">
					<h4 class="widget-title">Find Us</h4>
					<p>New York Office,<br/>
					New York.<br/>
					F: +458 4808-5489<br/>
					E: <a href="mailto:#">hello@quoteguys.com</a>
					</p>
				</div><!--col-lg-4-->
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
  </body>

<script>
$(document)
 .on('click','#question',function(){
			if(`${userinfo}`==null){
				alert('로그인 후 사용가능합니다.')
			}else{
			document.location='/pj/question';
			}
		})
	
</script>
</html>
