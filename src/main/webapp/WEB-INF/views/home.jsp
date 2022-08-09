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
<script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>  
<script type="text/javascript">

$(document)
.ready(
	function() {
		jQuery('#headerwrap').backstretch(
				[ "resources/assets/img/bg/main.jpg", "resources/assets/img/bg/main4.jpg",
					"resources/assets/img/bg/main3.png" ], {
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
	a{
		font-family: 'Binggrae';
	}
	h2{
		font-family: 'Binggrae';
	}	
a#meminfo, #btnSendNote, #goList{
 	display:inline; 
	font-size:18px;
	color:#007979;
}
a#goList{
margin-left: 4px
}
a#yesyes{
	display:inline;
	font-size:14px;
	color:#007979;
}
#firstAvatar{
	display:inline; 
	margin-left: -3px;
	margin-top: 0px;
}
#firstNick{
	display:inline; 
	font-size:16px;
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
#avaung{ /* alarm position */
	margin-top:-13px;
	margin-right:-18px;
}
/* #lout{
	padding-left:25px;
	padding-top:400px;
} */
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
				<h2 id="undm"><span class="fa fa-smile-o logo-icon"></span><span style="font-family:'Binggrae';">재능드림</span></h2>
				<c:if test="${m_no!=null}">
				<h2 ><a href='' id="firstAvatar"><img src=<c:url value="${avatar}"/> width="35px" height="35px" id='meminfo' seq="${m_no}" /></a>
				<a href='' id="firstNick">&nbsp;${nick }&nbsp;님</a>
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
						<c:if test="${userinfo==null}">
						<a href="login">봉사활동기획서</a>
						</c:if>
						<c:if test="${userinfo!=null}">
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
			<%-- <div id="lout">
			<c:if test="${m_no!=null}">
			<h2 ><a href='logout' id="undk">Logout</a><a href='' id="undd"></a></h2>
			</c:if>
			</div> --%>
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
					<h2 class="fade-up"><select id='selSearch'><option>제목+내용</option><option>작성자</option></select> 
					<input type='text' id='searching'><input type='button' id='btnSearch' value='검색 알고리즘'></h2>
					
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
							<h4>mooooooo</h4>
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
					<h2 class="main-title">이제부터 사진</h2>
					<hr>
				</div>
				<!--/#portfolio-filter-->
				<ul class="portfolio-items col-3 isotope fade-up gap">
				<c:forEach var="p_list" items="${p_list}">
					<li class="portfolio-item apps isotope-item">
						<a href="/pj/ReadPhoto?seq=${p_list.b_no}">
						<div class="item-inner">
							<img src=<c:url value="${p_list.b_route}"/> alt="" class="img-responsive4">
						</div>
						</a>
					</li>
				</c:forEach>
					<!--/.portfolio-item-->
					
				</ul>
			</div>
		</section>

		<section id="testimonials" class="divider-wrapper">
		<div class="centered gap fade-down section-heading">
					<h2 class="main-title">신청</h2>
					<hr>
				</div>
		<div class="col-md-12">
		<div class="row gap">
					<c:forEach var="l_list" items="${l_list}">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12 post fade-up">
							<div class="row">
								<div class="col-md-12">
									<h3>
										<a href="l_Read?l_no=${l_list.l_no}" class="post-title">${l_list.l_title}</a>
									</h3>
								</div>
							</div>
							<div class="row post-content">
								<div class="col-md-3">
									<div class="item-inner">
										<img src=<c:url value="${l_list.l_route}"/> alt="" class="img-responsive3">
									</div>
								</div>
								<div class="col-md-9">
									<p>${l_list.l_con}</p>
									<p>
										<a class="btn btn-outlined btn-primary pull-right"
											href="l_Read?l_no=${l_list.l_no}">Read more</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		</section>

		<!-- BLOG POSTS -->
		<div class="container">
			<div class="row mt">
				<div class="centered gap fade-down section-heading">
					<h2 class="main-title">여기인가?</h2>
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
						<a href="#">슈벌탱</a>
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
						<a href="#">Blog </a>
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
						<a href="#">Blog Article </a>
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
						<li class="plan-name">기획서작성</li>
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
						<li class="plan-name">사진게시판</li>
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
						<li class="plan-name">질문게시판</li>
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
						<li class="plan-name">기획서목록</li>
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
<input type="hidden" id="phpp">
</body>
<script>
var popup;
var popop;
$(document)
.ready(function(){
	if(`${userinfo}`!=''){
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
	popop=window.open("meminfo?m_no="+seq, "_blank", "width=400, height=400, top=40, left=1340");
	
	popop.onbeforeunload=function(){
		if($('#phpp').val()==1) {
			location.reload(); 
		}
	}
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

.on('keyup','#searching',function(key){ // search connect enter
	if(key.keyCode==13){
		$('#btnSearch').trigger('click');
	}
})

.on('click','#btnSearch',function(){
	//검색하는 게시판의 내용이 들어가야함  view 이용해서 사용할 것!
	let table='listSearch';  // view 이름
	let search=$('#searching').val(); //검색값
	if($('#searching').val()==''){
		alert('검색값이 없습니다.');
		return false;
	}
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
						let str='<textarea cols="27" rows="3">'+jo['nick']+', '+jo['title']+', '+jo['date']+', '+jo['seqno']+'</textarea>'
						$('#bannertext').append(str);
	// 					console.log(str);
					}
				}
			},
			error:function(){
			},
			complete:function(){}
		})
	} else {
		
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
						let str='<textarea cols="27" rows="3">'+jo['nick']+', '+jo['title']+', '+jo['date']+', '+jo['seqno']+', '+jo['con']+'</textarea>'
						$('#bannertext').append(str);
					}
					
				}
			},
			error:function(){
			},
			complete:function(){}
		})
	}
	
})


.on('click','#question',function(){
	console.log(`${userinfo}`=='')
	if(`${userinfo}`==''){
		alert('로그인 후 사용가능합니다.')
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
<script type="text/javascript">
        var naver_id_login = new naver_id_login("w9CWsYucH5U3OO9SqFPI", "http://localhost:8080/pj/"); // 역시 마찬가지로 'localhost'가 포함된 CallBack URL
        
        // 접근 토큰 값 출력
        const token=naver_id_login.oauthParams.access_token;
        
        // 네이버 사용자 프로필 조회
        naver_id_login.get_naver_userprofile("naverSignInCallback()");
        
        // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
        function naverSignInCallback() {
            let mail=naver_id_login.getProfileData('email');
            let nickname=naver_id_login.getProfileData('nickname');
        	let name=naver_id_login.getProfileData('name');
        	let phone=naver_id_login.getProfileData('mobile');
        	console.log("mail: "+mail);
        	console.log("nickname: "+nickname);
        	console.log("name: "+name);
        	console.log("phone: "+phone);
        	
        	var a=[];
        	a.push(mail);
        	a.push(nickname);
        	a.push(name);
        	a.push(phone);
        	for(let i=0;i<a.length;i++){
        		if(a[i]==null||a[i]==''||a[i]==undefined){
            		a[i]="0";
            		console.log("처리 후 a["+i+"]는"+a[i]);
            	}
        	}
        	
        	$.ajax({
        		type:'post',url:'navercheck',dataType:'text',async: false,
        		data:{mail:mail},
        		success:function(data){
        			console.log("navercheck_count: "+data);
        			alert('naver로 로그인합니다');        			
        			if(parseInt(data) == 0){//new member
        				//nickname overlap check
        				$.ajax({
        					type:'post',url:'nickcheck',async: false,
        					data:{nick:a[1]},
        					success:function(data){
        						console.log("닉넴중복 수는 "+data);
        						if(parseInt(data)!=0){//nickname overlap
        	        				for(i=0;i<data.length;i++){
        	        					a[1]=a[1]+'.';
        	        				}
        	        			} 
        	        		},
        	        		error:function(){
        	        			alert('닉넴중복 체크불가');
        	        		},
        	        		complete:function(){}
        				})
        				$.ajax({
        	        		type:'post',url:'naversign',async: false,
        	        		data:{
        	        			mail:a[0],
        	        			nick:a[1],
        	        			name:a[2],        	        			
        	        			phone:a[3] },
        	        		beforeSend:function(){
        	        			console.log("보내기 전 naver 완전신규 id는"+a[0]);
        	        			console.log("보내기 전 naver 완전신규 nick는"+a[1]);
        	        			console.log("보내기 전 naver 완전신규 name는"+a[2]);
        	        			console.log("보내기 전 naver 완전신규 phone는"+a[3]);
        	        			
        	        			//alert('보내기전');
        	        		},
        	        		success:function(){
        	        			console.log("naver 완전신규 id는"+mail);
        	        			alert('naver로 접속하신 걸 환영합니다');  
        	        			
        	        		},
        	        		error:function(){
        	        			alert('error!!!!!!!naver로 로그인 불가'); 
        	        		},
        	        		complete:function(){}
        	        	})
        			} else{//existing member
        				$.ajax({
        	        		type:'post',url:'ex_member',dataType:'text',async: false,
        	        		data:{mail:mail},
        	        		success:function(){
        	        			
        	        			alert('기존회원이시네요 환영합니다');
        	        			
        	        		},
        	        		error:function(){
        	        		},
        	        		complete:function(){}
        	        	})
        			} 
        			window.location.href="<%= request.getContextPath() %>/"; 
        		},
        		error:function(){
        		},
        		complete:function(){}
        	})
        }
</script>
</html>