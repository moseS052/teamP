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
				[ "resources/assets/img/bg/bg1.jpg", "resources/assets/img/bg/bg2.jpg",
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
                <h2><span class="pe-7s-chat logo-icon"></span> Quote</h2>
            </div>
            <ul id="main-menu">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Home <i class="fa fa-home menu-icon"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="/pj">Home Agency</a></li>
                        <li><a href="index-blog.html">Home Blog</a></li>
                        <li><a href="index-single-page.html">Home Single Page</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages <i class="fa fa-file menu-icon"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="proposal?m_no=85">봉사활동 기획서</a></li>  
                        <li><a href="proposal_list">봉사활동 현황목록</a></li>
                        <li><a href="404.html">404</a></li>                   
                    </ul>
                </li>   
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <i class="fa fa-folder menu-icon"></i></a>
                    <ul class="dropdown-menu">                      
                        <li><a href="single-post.html">Single Post</a></li>
                        <li><a href="single-post-sidebar.html">Single Post Sidebar</a></li>
                        <li><a href="category.html">Category Page</a></li>
                        <li><a href="category-alt.html">Category Page Alt</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <i class="fa fa-camera menu-icon"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="single-project.html">Single Project</a></li>    
                        <li><a href="portfolio-4-column.html">Portfolio 4 Column</a></li>
                        <li><a href="portfolio-3-column.html">Portfolio 3 Column</a></li>
                        <li><a href="portfolio-2-column.html">Portfolio 2 Column</a></li>                
                    </ul>
                </li>
                <li><a href="#" class="search-trigger">Search <i class="fa fa-search menu-icon"></i></a></li>
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
                <h2 class="main-title">재능기부 신청 현황</h2>
                <hr>
                <p>She evil face fine calm have now. Separate screened he outweigh of distance landlord.</p>
            </div>
		</div><!-- /container -->
	</div><!-- /headerwrap -->

		<div id="content-wrapper">
	    <section id="about">
	   		<div class="container">
		    	<div class="gap"></div>
				<div class="row gap">

					<div class="col-lg-1"></div><div class="col-lg-1"></div><div class="col-lg-8">
						<h3>재능기부신청 게시판</h3>
						<p>신청구역(서울)<select id="l_koo" class="form-control">
                            <option value=''></option>
                            <option>강남구</option>
                            <option>강동구</option>
                            <option>강북구</option>
                            <option>강서구</option>
                            <option>관악구</option>
                            <option>광진구</option>
                            <option>구로구</option>
                            <option>금천구</option>
                            <option>노원구</option>
                            <option>도봉구</option>
                            <option>동대문구</option>
                            <option>동작구</option>
                            <option>마포구</option>
                            <option>서대문구</option>
                            <option>서초구</option>
                            <option>성동구</option>
                            <option>성북구</option>
                            <option>송파구</option>
                            <option>양천구</option>
                            <option>영등포구</option>
                            <option>용산구</option>
                            <option>은평구</option>
                            <option>종로구</option>
                            <option>중구</option>
                            <option>중랑구</option>
                            <input class="btn btn-outlined btn-primary" type="button" id="find" value="찾기" /><br>
                        </select>
                        <div id="cla">
                        </div>
						
						<p>신청구역(서울)</p>
                        
						<p>Their could can widen ten she any. As so we smart those money in. Am wrote up whole so tears sense oh. Absolute required of reserved in offering no. How sense found our those gay again taken the. Had mrs outweigh desirous sex overcame. Improved property reserved disposal do offering me. Day handsome addition horrible sensible goodness two contempt. Evening for married his account removal. Estimable me disposing of be moonlight cordially curiosity. Delay rapid joy share allow age manor six. Went why far saw many knew. Exquisite excellent son gentleman acuteness her. Do is voice total power mr ye might round still. </p>

						<p>Whole every miles as tiled at seven or. Wished he entire esteem mr oh by. Possible bed you pleasure civility boy elegance ham. He prevent request by if in pleased. Picture too and concern has was comfort. Ten difficult resembled eagerness nor. Same park bore on be. Warmth his law design say are person. Pronounce suspected in belonging conveying ye repulsive.</p>
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
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f3db20354b85124212a8809df35284b&libraries=services"></script>
</body>
<script>
$(document)
.ready(function(){
	showlist();
})
.on('click','#find',function(){
	console.log($('#l_koo option:selected').text());
	$.ajax({
		type:'get',url:'find_list',data:{l_koo:$('#l_koo option:selected').text()},
			dataType:'json',
	  		success:function(data){
	  			$('#cla').empty();
	  			for(let i=0;i<data.length;i++){
					let jo=data[i];
					let str='<div class="well"><a href="l_Read?l_no='+jo['l_no']+'"><div class="square pull-left"><img src=<c:url value="/resources/assets/img/portfolio/folio13.jpg"/> width="90"/></div><p>'+jo['l_title']+'<br>'+jo['l_date']+'</p></a></div>';
					$('#cla').append(str);
	  			}
    		},
    		error:function(){
    			alert('데이터등록실패');
    		},
    		complete:function(){}
    	});
})
function showlist(){
	$.ajax({
		url:'open_list', data:'',dataType:'json',type:'get',
		success:function(data){
			$('#cla').empty();
  			for(let i=0;i<data.length;i++){
				let jo=data[i];
				let str='<div class="well"><a href="l_Read?l_no='+jo['l_no']+'"><div class="square pull-left"><img src=<c:url value="/resources/assets/img/portfolio/folio13.jpg"/> width="90"/></div><h4>'+jo['l_title']+'</h4><p>'+jo['l_date']+'</p></a></div>';
				$('#cla').append(str);
  			}
		},
		error:function(){
    		alert('데이터등록실패');
    	},
    	complete:function(){}
		
	});
}

</script>
</html>