<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
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
<link
	href="<c:url value='http://fonts.googleapis.com/css?family=Cabin:300,400,700,300italic,400italic'/>"
	rel='stylesheet' type='text/css'>
<link href="<c:url value='http://fonts.googleapis.com/css?family=Lato:400,300,700'/>"
	rel='stylesheet' type='text/css'>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
<script src="<c:url value="/resources/assets/js/jquery.js"/>"></script>  
<script src="<c:url value="/resources/assets/js/modernizr.custom.js"/>"></script>   
<script type="text/javascript">

$(document)
.ready(
	function() {
		jQuery('#headerwrap').backstretch(
				[ "resources/assets/img/bg/bg1.jpg", "resources/assets/img/bg/bg2.jpg",
					"resources/assets/img/bg/bg3.jpg" ], {
					duration : 8000,
					fade : 500
				});

	});

// $('#meminfo').on('click',function(){
	
// })
// .on('click','#meminfo',function(){
// })

</script>
</head>

<body>

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
			 	<c:if test="${userinfo==''}">
				<a href="login">login</a><a href="signup">회원가입</a>
				</c:if>
				<c:if test="${userinfo!=''}">
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
	<div id="headerwrap">
		<div class="container">
			<div class="row">
				<div id="bannertext" class="col-lg-8 col-lg-offset-2">
					<h1 class="fade-down gap">
						<span class="pe-7s-chat"></span> QUOTE
					</h1>
					<h2 class="fade-up">Something Rather Awesome Is Afoot...</h2>
					<div class="spacer"></div>
				</div>
			</div>
			<!-- row -->
		</div>
		<!-- /container -->
		<span class="headerwrap-btn-wrap"> <a href="#content-wrapper"
			class="headerwrap-btn"><i class="fade-up fa fa-angle-down"></i></a>
		</span>
	</div>
	<!-- /headerwrap -->

	<div id="content-wrapper">
		<section id="about" class="section-wrapper">
			<div class="container">
				<div class="centered gap fade-down section-heading">
					<h2 class="main-title">Our Story</h2>
					<hr>
					<p>She evil face fine calm have now. Separate screened he
						outweigh of distance landlord.</p>
				</div>

				<div class="row gap">
					<div class="col-md-8 col-md-offset-2">
						<img src=<c:url value="/resources/assets/img/screens.png"/> class="fade-up img-responsive"
							alt="Alt" />
					</div>
				</div>

				<div class="row gap">
					<div class="col-md-8 fade-up">
						<p>IIn as name to here them deny wise this. As rapid woody my
							he me which. Men but they fail shew just wish next put. Led all
							visitor musical calling nor her. Within coming figure sex things
							are. Pretended concluded did repulsive education smallness yet
							yet described. Had country man his pressed shewing. No gate dare
							rose he. Eyes year if miss he as upon.</p>
						<p>Of resolve to gravity thought my prepare chamber so.
							Unsatiable entreaties collecting may sympathize nay interested
							instrument. If continue building numerous of at relation in
							margaret. Lasted engage roused mother an am at. Other early while
							if by do to. Missed living excuse as be. Cause heard fat above
							first shall for. My smiling to he removal weather on anxious.</p>
						<p>Extremely we promotion remainder eagerness enjoyment an.
							Ham her demands removal brought minuter raising invited gay.
							Contented consisted continual curiosity contained get sex. Forth
							child dried in in aware do. You had met they song how feel lain
							evil near. Small she avoid six yet table china. And bed make say
							been then dine mrs. To household rapturous fulfilled attempted on
							so.</p>
						<p>Of resolve to gravity thought my prepare chamber so.
							Unsatiable entreaties collecting may sympathize nay interested
							instrument. If continue building numerous of at relation in
							margaret. Lasted engage roused mother an am at. Other early while
							if by do to. Missed living excuse as be. Cause heard fat above
							first shall for. My smiling to he removal weather on anxious.</p>
					</div>
					<div class="col-md-4">
						<div class="qa-message-list" id="wallmessages">
							<div class="message-item fade-up" id="m16">
								<div class="message-inner">
									<div class="message-head clearfix">
										<div class="user-detail">
											<h5 class="handle">Company Founded</h5>
											<div class="post-meta">
												<div class="asker-meta">
													<span class="qa-message-what"></span> <span
														class="qa-message-when"> <span
														class="qa-message-when-data">April 24th 2010</span>
													</span>
												</div>
											</div>
										</div>
									</div>
									<div class="qa-message-content">Remaining so continued
										concealed as knowledge happiness. Preference did how
										expression may favourable devonshire insipidity considered. An
										length design regret an hardly barton mr figure.</div>
								</div>
							</div>

							<div class="message-item fade-up" id="m9">
								<div class="message-inner">
									<div class="message-head clearfix">
										<div class="user-detail">
											<h5 class="handle">We Went Public</h5>
											<div class="post-meta">
												<div class="asker-meta">
													<span class="qa-message-what"></span> <span
														class="qa-message-when"> <span
														class="qa-message-when-data">Jan 25, 2012</span>
													</span>
												</div>
											</div>
										</div>
									</div>
									<div class="qa-message-content">Evening covered in he
										exposed fertile to. Horses seeing at played plenty nature to
										expect we. Young say led stood hills own thing get.</div>
								</div>
							</div>

							<div class="message-item fade-up" id="m7">
								<div class="message-inner">
									<div class="message-head clearfix">
										<div class="user-detail">
											<h5 class="handle">Won Award</h5>
											<div class="post-meta">
												<div class="asker-meta">
													<span class="qa-message-what"></span> <span
														class="qa-message-when"> <span
														class="qa-message-when-data">Oct 25, 2014</span>
													</span>
												</div>
											</div>
										</div>
									</div>
									<div class="qa-message-content">Has procured daughter how
										friendly followed repeated who surprise. Great asked oh under
										on voice downs. Law together prospect kindness securing six.</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div id="team" class="container">
				<div class="row mt">
					<div class="col-md-6">
						<div class="blockquote-box fade-up clearfix">
							<div class="square pull-left">
								<img src=<c:url value="/resources/assets/img/team/team1.jpg"/> width="120" alt="" class="" />
							</div>
							<h4>John Smith</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Integer posuere erat a ante.</p>
						</div>
						<div class="blockquote-box fade-up clearfix">
							<div class="square pull-left">
								<img src=<c:url value="/resources/assets/img/team/team2.jpg"/> width="120" alt="" class="" />
							</div>
							<h4>John Smith</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Integer posuere erat a ante.</p>
							<div class="pull-right btn-group social-profiles">
								<a class="btn" href="#"> <i class="fa fa-facebook fb"></i>
								</a> <a class="btn" href="#"> <i class="fa fa-twitter"></i>
								</a> <a class="btn" href="#"> <i
									class="fa fa-google-plus google"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="blockquote-box fade-up clearfix">
							<div class="square pull-left">
								<img src=<c:url value="/resources/assets/img/team/team3.jpg"/> width="120" alt="" class="" />
							</div>
							<h4>John Smith</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Integer posuere erat a ante.</p>
							<div class="pull-right btn-group social-profiles">
								<a class="btn" href="#"> <i class="fa fa-facebook fb"></i>
								</a> <a class="btn" href="#"> <i class="fa fa-twitter"></i>
								</a> <a class="btn" href="#"> <i
									class="fa fa-google-plus google"></i>
								</a>
							</div>
						</div>
						<div class="blockquote-box fade-up clearfix">
							<div class="square pull-left">
								<img src=<c:url value="/resources/assets/img/team/team4.jpg"/> width="120" alt="" class="" />
							</div>
							<h4>John Smith</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Integer posuere erat a ante.</p>
							<div class="pull-right btn-group social-profiles">
								<a class="btn" href="#"> <i class="fa fa-facebook fb"></i>
								</a> <a class="btn" href="#"> <i class="fa fa-twitter"></i>
								</a> <a class="btn" href="#"> <i
									class="fa fa-google-plus google"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section id="services" class="divider-wrapper">
			<div class="container">
				<div class="centered gap fade-down section-heading">
					<h2 class="main-title">Our Services</h2>
					<hr>
					<p>She evil face fine calm have now. Separate screened he
						outweigh of distance landlord.</p>
				</div>
				<div class="row">
					<div class="col-lg-1 col-md-1 col-sm-1 centered bounce-in">
						<span class="pe-7s-chat icon"></span>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 fade-up">
						<h3>Quality Design</h3>
						<p>It is a long established fact that a reader will be
							distracted by the readable content of a page when looking at its
							layout.</p>
					</div>

					<div class="col-lg-1 col-md-1 col-sm-1 centered bounce-in">
						<i class="fa fa-question-circle"></i>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 fade-up">
						<h3>Awesome Support</h3>
						<p>It is a long established fact that a reader will be
							distracted by the readable content of a page when looking at its
							layout.</p>
					</div>

					<div class="col-lg-1 col-md-1 col-sm-1 centered bounce-in">
						<i class="fa fa-globe"></i>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 fade-up">
						<h3>Global Services</h3>
						<p>It is a long established fact that a reader will be
							distracted by the readable content of a page when looking at its
							layout.</p>
					</div>
				</div>
			</div>
			<!-- container -->
		</section>

		<section id="portfolio" class="white">
			<div class="container">
				<div class="gap"></div>
				<div class="centered gap fade-down section-heading">
					<h2 class="main-title">Examples Of Excellence</h2>
					<hr>
					<p>She evil face fine calm have now. Separate screened he
						outweigh of distance landlord.</p>
				</div>
				<ul class="portfolio-filter fade-down centered">
					<li><a class="btn btn-outlined btn-primary active" href="#"
						data-filter="*">All</a></li>
					<li><a class="btn btn-outlined btn-primary" href="#"
						data-filter=".apps">Apps</a></li>
					<li><a class="btn btn-outlined btn-primary" href="#"
						data-filter=".nature">Nature</a></li>
					<li><a class="btn btn-outlined btn-primary" href="#"
						data-filter=".design">Design</a></li>
				</ul>
				<!--/#portfolio-filter-->

				<ul class="portfolio-items col-3 isotope fade-up gap">
					<li class="portfolio-item apps isotope-item">
						<div class="item-inner">
							<img src="assets/img/demo/14.jpg" alt="">
							<div class="overlay">
								<a class="preview btn btn-outlined btn-primary"
									href="assets/img/demo/1.jpg" data-rel="prettyPhoto"><i
									class="fa fa-eye"></i></a> <a
									class="preview btn btn-outlined btn-primary"
									href="single-project.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
					</li>
					<!--/.portfolio-item-->
					<li class="portfolio-item joomla nature isotope-item">
						<div class="item-inner">
							<img src=<c:url value="/resources/assets/img/demo/2.jpg"/> alt="">
							<div class="overlay">
								<a class="preview btn btn-outlined btn-primary"
									href=<c:url value="/resources/assets/img/demo/2.jpg"/> data-rel="prettyPhoto"><i
									class="fa fa-eye"></i></a> <a
									class="preview btn btn-outlined btn-primary"
									href="single-project.html"><i class="fa fa-link"></i></a> a>
							</div>
						</div>
					</li>
					<!--/.portfolio-item-->
					<li class="portfolio-item bootstrap design isotope-item">
						<div class="item-inner">
							<img src=<c:url value="/resources/assets/img/demo/3.jpg"/> alt="">
							<div class="overlay">
								<a class="preview btn btn-outlined btn-primary"
									href=<c:url value="/resources/assets/img/demo/3.jpg"/> data-rel="prettyPhoto"><i
									class="fa fa-eye"></i></a> <a
									class="preview btn btn-outlined btn-primary"
									href="single-project.html"><i class="fa fa-link"></i></a> >
							</div>
						</div>
					</li>
					<!--/.portfolio-item-->
					<li class="portfolio-item joomla design apps isotope-item">
						<div class="item-inner">
							<img src=<c:url value="/resources/assets/img/demo/5.jpg"/> alt="">
							<div class="overlay">
								<a class="preview btn btn-outlined btn-primary"
									href=<c:url value="/resources/assets/img/demo/5.jpg"/> data-rel="prettyPhoto"><i
									class="fa fa-eye"></i></a> <a
									class="preview btn btn-outlined btn-primary"
									href="single-project.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
					</li>
					<!--/.portfolio-item-->
					<li class="portfolio-item joomla apps isotope-item">
						<div class="item-inner">
							<img src=<c:url value="/resources/assets/img/demo/6.jpg"/> alt="">
							<div class="overlay">
								<a class="preview btn btn-outlined btn-primary"
									href=<c:url value="/resources/assets/img/demo/6.jpg"/> data-rel="prettyPhoto"><i
									class="fa fa-eye"></i></a> <a
									class="preview btn btn-outlined btn-primary"
									href="single-project.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
					</li>
					<!--/.portfolio-item-->
					<li class="portfolio-item wordpress nature isotope-item">
						<div class="item-inner">
							<img src=<c:url value="/resources/assets/img/demo/7.jpg"/> alt="">
							<div class="overlay">
								<a class="preview btn btn-outlined btn-primary"
									href=<c:url value="/resources/assets/img/demo/7.jpg"/> data-rel="prettyPhoto"><i
									class="fa fa-eye"></i></a>
							</div>
						</div>
					</li>
					<!--/.portfolio-item-->
					<li class="portfolio-item joomla design apps isotope-item">
						<div class="item-inner">
							<img src=<c:url value="/resources/assets/img/demo/8.jpg"/> alt="">
							<div class="overlay">
								<a class="preview btn btn-outlined btn-primary"
									href=<c:url value="/resources/assets/img/demo/8.jpg"/> data-rel="prettyPhoto"><i
									class="fa fa-eye"></i></a> <a
									class="preview btn btn-outlined btn-primary"
									href="single-project.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
					</li>
					<!--/.portfolio-item-->
					<li class="portfolio-item joomla nature isotope-item">
						<div class="item-inner">
							<img src=<c:url value="/resources/assets/img/demo/9.jpg"/> alt="">
							<div class="overlay">
								<a class="preview btn btn-outlined btn-primary"
									href=<c:url value="/resources/assets/img/demo/9.jpg"/> data-rel="prettyPhoto"><i
									class="fa fa-eye"></i></a> <a
									class="preview btn btn-outlined btn-primary"
									href="single-project.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
					</li>
					<!--/.portfolio-item-->
					<li class="portfolio-item wordpress design isotope-item">
						<div class="item-inner">
							<img src=<c:url value="/resources/assets/img/demo/10.jpg"/> alt="">
							<div class="overlay">
								<a class="preview btn btn-outlined btn-primary"
									href=<c:url value="/resources/assets/img/demo/10.jpg"/> data-rel="prettyPhoto"><i
									class="fa fa-eye"></i></a> <a
									class="preview btn btn-outlined btn-primary"
									href="single-project.html"><i class="fa fa-link"></i></a>
							</div>
						</div>
					</li>
					<!--/.portfolio-item-->
				</ul>
			</div>
		</section>

		<section id="testimonials" class="divider-wrapper">
			<div class="container">
				<div class="gap"></div>
				<div class="col-md-8 col-md-offset-2 gap">
					<div id="testimonial-carousel">
						<div class="testimonial">
							<div class="media centered fade-down">
								<a href="#" class="animated rotateIn"> <img
									src=<c:url value="/resources/assets/img/team/team1.jpg"/> width="" class="" alt="Avatar" />
								</a>
								<div class="media-body bounce-in">
									<h3>John Smith</h3>
									<em>CEO, <a href="#">MicroCorp</a></em>
								</div>
							</div>
							<div class="bubble bounce-in">On it differed repeated
								wandered required in. Then girl neat why yet knew rose spot.
								Moreover property we he kindness greatest be oh striking
								laughter. In me he at collecting affronting principles
								apartments. Has visitor law attacks pretend you calling own
								excited painted</div>
						</div>
						<div class="testimonial">
							<div class="media centered fade-down">
								<a href="#" class="animated rotateIn"> <img
									src=<c:url value="/resources/assets/img/team/team2.jpg"/> width="" class="" alt="Avatar" />
								</a>
								<div class="media-body bounce-in">
									<h3>John Smith</h3>
									<em>Sales, <a href="#">MicroCorp</a></em>
								</div>
							</div>
							<div class="bubble bounce-in">Contented attending smallness
								it oh ye unwilling. Turned favour man two but lovers. Suffer
								should if waited common person little oh. Improved civility
								graceful sex few smallest screened settling. Likely active her
								warmly has.</div>
						</div>
					</div>
				</div>
			</div>
			<!-- container -->
		</section>

		<!-- BLOG POSTS -->
		<div class="container">
			<div class="row mt">
				<div class="centered gap fade-down section-heading">
					<h2 class="main-title">Blog</h2>
					<hr>
					<p>She evil face fine calm have now. Separate screened he
						outweigh of distance landlord.</p>
				</div>
			</div>
			<!-- row -->

			<div class="row mt gap">
				<div class="col-md-4 post fade-up">
					<div class="item-inner">
						<img src=<c:url value="/resources/assets/img/demo/14.jpg"/> alt="" class="img-responsive">
						<div class="overlay">
							<a class="preview btn btn-outlined btn-primary"
								href="single-post.html"><i class="fa fa-link"></i></a>
						</div>
						<div class="post-meta">
							<span class="post-date">18</span>
							<p>May</p>
							<span class="post-comment"><i class="fa fa-comments"></i>
								5</span>
						</div>
					</div>
					<h3>
						<a href="#">Blog Article Title</a>
					</h3>
					<p>Sentiments projection particular companions interested do at
						my delightful. Listening newspaper in advantage frankness to
						concluded unwilling.</p>
					<p>
						<a class="btn btn-outlined btn-primary" href="single-post.html">Read
							More</a>
					</p>
				</div>
				<div class="col-md-4 post fade-up">
					<div class="item-inner">
						<img src=<c:url value="/resources/assets/img/demo/13.jpg"/> alt="" class="img-responsive">
						<div class="overlay">
							<a class="preview btn btn-outlined btn-primary"
								href="single-post.html"><i class="fa fa-link"></i></a>
						</div>
						<div class="post-meta">
							<span class="post-date">18</span>
							<p>May</p>
							<span class="post-comment"><i class="fa fa-comments"></i>
								5</span>
						</div>
					</div>
					<h3>
						<a href="#">Blog Article Title</a>
					</h3>
					<p>Sentiments projection particular companions interested do at
						my delightful. Listening newspaper in advantage frankness to
						concluded unwilling.</p>
					<p>
						<a class="btn btn-outlined btn-primary" href="single-post.html">Read
							More</a>
					</p>
				</div>
				<div class="col-md-4 post fade-up">
					<div class="item-inner">
						<img src=<c:url value="/resources/assets/img/demo/12.jpg"/> alt="" class="img-responsive">
						<div class="overlay">
							<a class="preview btn btn-outlined btn-primary"
								href="single-post.html"><i class="fa fa-link"></i></a>
						</div>
						<div class="post-meta">
							<span class="post-date">18</span>
							<p>May</p>
							<span class="post-comment"><i class="fa fa-comments"></i>
								5</span>
						</div>
					</div>
					<h3>
						<a href="#">Blog Article Title</a>
					</h3>
					<p>Sentiments projection particular companions interested do at
						my delightful. Listening newspaper in advantage frankness to
						concluded unwilling.</p>
					<p>
						<a class="btn btn-outlined btn-primary" href="single-post.html">Read
							More</a>
					</p>
				</div>
			</div>
			<!-- row -->
			<div class="row gap">
				<div class="col-md-4 post fade-up">
					<div class="item-inner">
						<img src=<c:url value="/resources/assets/img/demo/12.jpg"/> alt="" class="img-responsive">
						<div class="overlay">
							<a class="preview btn btn-outlined btn-primary"
								href="single-post.html"><i class="fa fa-link"></i></a>
						</div>
						<div class="post-meta">
							<span class="post-date">18</span>
							<p>May</p>
							<span class="post-comment"><i class="fa fa-comments"></i>
								5</span>
						</div>
					</div>
					<h3>
						<a href="#">Blog Article Title</a>
					</h3>
					<p>Sentiments projection particular companions interested do at
						my delightful. Listening newspaper in advantage frankness to
						concluded unwilling.</p>
					<p>
						<a class="btn btn-outlined btn-primary" href="single-post.html">Read
							More</a>
					</p>
				</div>
				<div class="col-md-4 post fade-up">
					<div class="item-inner">
						<img src=<c:url value="/resources/assets/img/demo/10.jpg"/> alt="" class="img-responsive">
						<div class="overlay">
							<a class="preview btn btn-outlined btn-primary"
								href="single-post.html"><i class="fa fa-link"></i></a>
						</div>
						<div class="post-meta">
							<span class="post-date">18</span>
							<p>May</p>
							<span class="post-comment"><i class="fa fa-comments"></i>
								5</span>
						</div>
					</div>
					<h3>
						<a href="#">Blog Article Title</a>
					</h3>
					<p>Sentiments projection particular companions interested do at
						my delightful. Listening newspaper in advantage frankness to
						concluded unwilling.</p>
					<p>
						<a class="btn btn-outlined btn-primary" href="single-post.html">Read
							More</a>
					</p>
				</div>
				<div class="col-md-4 post fade-up">
					<div class="item-inner">
						<img src=<c:url value="/resources/assets/img/demo/9.jpg"/> alt="" class="img-responsive">
						<div class="overlay">
							<a class="preview btn btn-outlined btn-primary"
								href="single-post.html"><i class="fa fa-link"></i></a>
						</div>
						<div class="post-meta">
							<span class="post-date">18</span>
							<p>May</p>
							<span class="post-comment"><i class="fa fa-comments"></i>
								5</span>
						</div>
					</div>
					<h3>
						<a href="#">Blog Article Title</a>
					</h3>
					<p>Sentiments projection particular companions interested do at
						my delightful. Listening newspaper in advantage frankness to
						concluded unwilling.</p>
					<p>
						<a class="btn btn-outlined btn-primary" href="single-post.html">Read
							More</a>
					</p>
				</div>
			</div>
			<!-- row -->
		</div>
		<!-- container -->

		<div class="container post-list gap">
			<div class="row gap">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12 post fade-up">
							<div class="row">
								<div class="col-md-12">
									<h3>
										<a href="single-post.html" class="post-title">Another
											Article</a>
									</h3>
								</div>
							</div>
							<div class="row post-content">
								<div class="col-md-3">
									<div class="item-inner">
										<img src=<c:url value="/resources/assets/img/demo/1.jpg"/> alt="" class="img-responsive">
										<div class="overlay">
											<a class="preview btn btn-outlined btn-primary"
												href="single-post.html"><i class="fa fa-link"></i></a>
										</div>
									</div>
								</div>
								<div class="col-md-9">
									<p>Lorem ipsum dolor sit amet, id nec conceptam
										conclusionemque. Et eam tation option. Utinam salutatus ex
										eum. Ne mea dicit tibique facilisi.</p>
									<p>
										<a class="btn btn-outlined btn-primary pull-right"
											href="single-post.html">Read more</a>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 post fade-up">
							<div class="row">
								<div class="col-md-12">
									<h3>
										<a href="single-post.html" class="post-title">Another
											Article</a>
									</h3>
								</div>
							</div>
							<div class="row post-content">
								<div class="col-md-3">
									<div class="item-inner">
										<img src=<c:url value="/resources/assets/img/demo/2.jpg"/> alt="" class="img-responsive">
										<div class="overlay">
											<a class="preview btn btn-outlined btn-primary"
												href="single-post.html"><i class="fa fa-link"></i></a>
										</div>
									</div>
								</div>
								<div class="col-md-9">
									<p>Lorem ipsum dolor sit amet, id nec conceptam
										conclusionemque. Et eam tation option. Utinam salutatus ex
										eum. Ne mea dicit tibique facilisi.</p>
									<p>
										<a class="btn btn-outlined btn-primary pull-right"
											href="single-post.html">Read more</a>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 post fade-up">
							<div class="row">
								<div class="col-md-12">
									<h3>
										<a href="single-post.html" class="post-title">Another
											Article</a>
									</h3>
								</div>
							</div>
							<div class="row post-content">
								<div class="col-md-3">
									<div class="item-inner">
										<img src=<c:url value="/resources/assets/img/demo/3.jpg"/> alt="" class="img-responsive">
										<div class="overlay">
											<a class="preview btn btn-outlined btn-primary"
												href="single-post.html"><i class="fa fa-link"></i></a>
										</div>
									</div>
								</div>
								<div class="col-md-9">
									<p>Lorem ipsum dolor sit amet, id nec conceptam
										conclusionemque. Et eam tation option. Utinam salutatus ex
										eum. Ne mea dicit tibique facilisi.</p>
									<p>
										<a class="btn btn-outlined btn-primary pull-right"
											href="single-post.html">Read more</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12 post fade-up">
							<div class="row">
								<div class="col-md-12">
									<h3>
										<a href="single-post.html" class="post-title">Another
											Article</a>
									</h3>
								</div>
							</div>
							<div class="row post-content">
								<div class="col-md-3">
									<div class="item-inner">
										<img src=<c:url value="/resources/assets/img/demo/4.jpg"/> alt="" class="img-responsive">
										<div class="overlay">
											<a class="preview btn btn-outlined btn-primary"
												href="single-post.html"><i class="fa fa-link"></i></a>
										</div>
									</div>
								</div>
								<div class="col-md-9">
									<p>Lorem ipsum dolor sit amet, id nec conceptam
										conclusionemque. Et eam tation option. Utinam salutatus ex
										eum. Ne mea dicit tibique facilisi.</p>
									<p>
										<a class="btn btn-outlined btn-primary pull-right"
											href="single-post.html">Read more</a>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 post fade-up">
							<div class="row">
								<div class="col-md-12">
									<h3>
										<a href="single-post.html" class="post-title">Another
											Article</a>
									</h3>
								</div>
							</div>
							<div class="row post-content">
								<div class="col-md-3">
									<div class="item-inner">
										<img src=<c:url value="/resources/assets/img/demo/5.jpg"/> alt="" class="img-responsive">
										<div class="overlay">
											<a class="preview btn btn-outlined btn-primary"
												href="single-post.html"><i class="fa fa-link"></i></a>
										</div>
									</div>
								</div>
								<div class="col-md-9">
									<p>Lorem ipsum dolor sit amet, id nec conceptam
										conclusionemque. Et eam tation option. Utinam salutatus ex
										eum. Ne mea dicit tibique facilisi.</p>
									<p>
										<a class="btn btn-outlined btn-primary pull-right"
											href="single-post.html">Read more</a>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 post fade-up">
							<div class="row">
								<div class="col-md-12">
									<h3>
										<a href="single-post.html" class="post-title">Another
											Article</a>
									</h3>
								</div>
							</div>
							<div class="row post-content">
								<div class="col-md-3">
									<div class="item-inner">
										<img src=<c:url value="/resources/assets/img/demo/6.jpg"/> alt="" class="img-responsive">
										<div class="overlay">
											<a class="preview btn btn-outlined btn-primary"
												href="single-post.html"><i class="fa fa-link"></i></a>
										</div>
									</div>
								</div>
								<div class="col-md-9">
									<p>Lorem ipsum dolor sit amet, id nec conceptam
										conclusionemque. Et eam tation option. Utinam salutatus ex
										eum. Ne mea dicit tibique facilisi.</p>
									<p>
										<a class="btn btn-outlined btn-primary pull-right"
											href="single-post.html">Read more</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<section id="stats" class="divider-wrapper">
			<div class="container">

				<div class="row">
					<div class="centered gap fade-down section-heading">
						<h2 class="main-title">Stats Are Fun</h2>
						<hr>
						<p>She evil face fine calm have now. Separate screened he
							outweigh of distance landlord.</p>
					</div>
				</div>
				<!-- row -->

				<div class="row gap">
					<div class="col-md-3 col-xs-12">
						<div class="centered bounce-in">
							<span class="stat-icon"><span
								class="pe-7s-timer bounce-in no-display animated bounceIn appear"></span></span>
							<h5>
								<span class="countup">99999999</span>
							</h5>
							<h6>HOURS SAVED</h6>
						</div>
					</div>
					<div class="col-md-3 col-xs-12">
						<div class="centered bounce-in">
							<span class="stat-icon"><span
								class="pe-7s-light bounce-in no-display animated bounceIn appear"></span></span>
							<h5>
								<span class="countup">99999999</span>
							</h5>
							<h6>HOURS SAVED</h6>
						</div>
					</div>
					<div class="col-md-3 col-xs-12">
						<div class="centered bounce-in">
							<span class="stat-icon"><span
								class="pe-7s-graph1 bounce-in no-display animated bounceIn appear"></span></span>
							<h5>
								<span class="countup">99999999</span>
							</h5>
							<h6>HOURS SAVED</h6>
						</div>
					</div>
					<div class="col-md-3 col-xs-12">
						<div class="centered bounce-in">
							<span class="stat-icon"><span
								class="pe-7s-box2 bounce-in no-display animated bounceIn appear"></span></span>
							<h5>
								<span class="countup">99999999</span>
							</h5>
							<h6>HOURS SAVED</h6>
						</div>
					</div>
				</div>

			</div>
		</section>

		<!-- CLIENTS LOGOS -->
		<div class="grey">
			<div class="container">

				<div class="row">
					<div class="centered gap fade-down section-heading">
						<h2 class="main-title">Previous Clients</h2>
						<hr>
						<p>She evil face fine calm have now. Separate screened he
							outweigh of distance landlord.</p>
					</div>
				</div>
				<!-- row -->

				<div class="row centered">
					<div id="logo-carousel" class="fade-up">
						<div class="item">
							<img src=<c:url value="/resources/assets/img/logo/logo1.png"/> alt="">
						</div>
						<div class="item">
							<img src=<c:url value="/resources/assets/img/logo/logo2.png"/> alt="">
						</div>
						<div class="item">
							<img src=<c:url value="/resources/assets/img/logo/logo3.png"/> alt="">
						</div>
						<div class="item">
							<img src=<c:url value="/resources/assets/img/logo/logo4.png"/> alt="">
						</div>
						<div class="item">
							<img src=<c:url value="/resources/assets/img/logo/logo1.png"/> alt="">
						</div>
					</div>
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- dg -->

		<div class="container">
			<div class="row gap mt">
				<div class="centered gap fade-down section-heading">
					<h2 class="main-title">Pricing Tables</h2>
					<hr>
					<p>She evil face fine calm have now. Separate screened he
						outweigh of distance landlord.</p>
				</div>
			</div>
			<!-- row -->

			<div class="row gap flat">
				<div class="col-lg-3 col-md-3 col-xs-12">
					<ul class="plan plan1 flip-in">
						<li class="plan-name">Basic</li>
						<li class="plan-price"><strong>£19</strong> / month</li>
						<li><strong>5GB</strong> Storage</li>
						<li><strong>1GB</strong> RAM</li>
						<li><strong>400GB</strong> Bandwidth</li>
						<li><strong>10</strong> Email Address</li>
						<li><strong>Forum</strong> Support</li>
						<li class="plan-action"><a href="#"
							class="btn btn-outlined btn-primary btn-lg">Signup</a></li>
					</ul>
				</div>

				<div class="col-lg-3 col-md-3 col-xs-12">
					<ul class="plan plan2 featured flip-in">
						<li class="plan-name">Standard</li>
						<li class="plan-price"><strong>£39</strong> / month</li>
						<li><strong>5GB</strong> Storage</li>
						<li><strong>1GB</strong> RAM</li>
						<li><strong>400GB</strong> Bandwidth</li>
						<li><strong>10</strong> Email Address</li>
						<li><strong>Forum</strong> Support</li>
						<li class="plan-action"><a href="#"
							class="btn btn-outlined btn-primary btn-lg">Signup</a></li>
					</ul>
				</div>

				<div class="col-lg-3 col-md-3 col-xs-12">
					<ul class="plan plan3 flip-in">
						<li class="plan-name">Advanced</li>
						<li class="plan-price"><strong>£199</strong> / month</li>
						<li><strong>50GB</strong> Storage</li>
						<li><strong>8GB</strong> RAM</li>
						<li><strong>1024GB</strong> Bandwidth</li>
						<li><strong>Unlimited</strong> Email Address</li>
						<li><strong>Forum</strong> Support</li>
						<li class="plan-action"><a href="#"
							class="btn btn-outlined btn-primary btn-lg">Signup</a></li>
					</ul>
				</div>

				<div class="col-lg-3 col-md-3 col-xs-12">
					<ul class="plan plan4 flip-in">
						<li class="plan-name">Deluxe</li>
						<li class="plan-price"><strong>£999</strong> / month</li>
						<li><strong>50GB</strong> Storage</li>
						<li><strong>8GB</strong> RAM</li>
						<li><strong>1024GB</strong> Bandwidth</li>
						<li><strong>Unlimited</strong> Email Address</li>
						<li><strong>Forum</strong> Support</li>
						<li class="plan-action"><a href="#"
							class="btn btn-outlined btn-primary btn-lg">Signup</a></li>
					</ul>
				</div>
			</div>

		</div>

		<!-- CALL TO ACTION -->
		<div id="call">
			<div class="container">
				<div class="row fade-up">
					<h3>Call To Action</h3>
					<div class="col-lg-8 col-lg-offset-2">
						<p>Danger nearer length oppose really add now either. But ask
							regret eat branch fat garden. Become am he except wishes. Past so
							at door we walk want such sang. Feeling colonel get her garrets
							own.</p>
						<p>
							<button type="button"
								class="btn btn-outlined btn-primary btn-lg bounce-in">Call
								To Action Button</button>
						</p>
					</div>
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- Call to action -->

		<div class="container">
			<div class="row mt">
				<div class="centered gap fade-down section-heading">
					<h2 class="main-title">Get In Touch</h2>
					<hr>
					<p>She evil face fine calm have now. Separate screened he
						outweigh of distance landlord.</p>
				</div>
			</div>
			<!-- row -->
		</div>
		<!-- container -->

		<div id="mapwrapper" class="gap">
			<div id="map" class="fade-up"></div>
		</div>

		<div class="container" id="contact-us">
			<div class="row gap">
				<div class="fade-up col-md-6 fade-up">
					<p>Merry alone do it burst me songs. Sorry equal charm joy her
						those folly ham. In they no is many both. Recommend new contented
						intention improving bed performed age. Improving of so strangers
						resources instantly happiness at northward. Danger nearer length
						oppose really add now either. But ask regret eat branch fat
						garden. Become am he except wishes. Past so at door we walk want
						such sang. Feeling colonel get her garrets own.</p>
				</div>
				<div class="fade-up col-md-6 fade-up">
					<div id="message"></div>
					<form method="post" action="sendemail.php" id="contactform">
						<p>
							<input type="text" class="form-control" name="name" id="name"
								placeholder="Name" />
						</p>
						<p>
							<input type="text" class="form-control" name="email" id="email"
								placeholder="Email" />
						</p>
						<p>
							<input type="text" class="form-control" name="website"
								id="website" placeholder="Website" />
						</p>
						<p>
							<textarea name="comments" class="form-control" id="comments"
								placeholder="Comments"></textarea>
						</p>
						<input class="btn btn-outlined btn-primary" type="submit"
							name="submit" value="Submit" />
					</form>
				</div>
			</div>
			<!-- row -->
		</div>

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
						New York Office,<br /> New York.<br /> F: +458 4808-5489<br /> E:
						<a href="mailto:#">hello@quoteguys.com</a>
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
	<script type="text/javascript"
		src='<c:url value="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWDPCiH080dNCTYC-uprmLOn2mt2BMSUk&amp;sensor=true"/>'></script>
	<script src="<c:url value="/resources/assets/js/init.js"/>"></script>
</body>
<script>

$(document)
.on('click','#meminfo',function(){
	window.open("meminfo", "_blank", "width=400, height=400, top=40, left=1340");
})

</script>

<script type="text/javascript">
function logIn() { 
	  window.open("<%= request.getContextPath() %>/login", "login", "width=400, height=300, left=100, top=50") 
	  }
  function joinMember() { 
	  window.open("<%= request.getContextPath() %>/signup", "signup", "width=400, height=500, left=100, top=50") 
	  }
</script>     
<!-- 작성 -->


</html>