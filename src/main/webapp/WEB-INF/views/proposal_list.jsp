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
</style>	
  </head>
<style>
#searchDIV{
		text-align:right;
		margin-top:25px;
}
#boxboxq{
	margin-top:-45px;
}
#btnSearch, #btnAll{ 
	height:24px;
	margin-top:-4px;
	margin-left:5px;
} 
#searc,#all1{
	margin-top:-7px;
}
#selSearch{
	padding-top:1px;
	font-size:15px;
	margin-right:-2px;
}
#searching{
	font-size:17px;
}
#gugu{
	margin-top:-50px;
}
</style>
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
						<li><a id='question' href="#">1:1 ??????</a></li>
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
		    	<div class="gap">
		    	<div id="searchDIV">
		    	<h5 class="fade-up" id="showAll"><select id='selSearch'><option>??????+??????</option><option>?????????</option></select> 
					<input type='text' id='searching'><a class="btn btn-primary btn-outlined" href="" id="btnSearch"><p id="searc">??? &nbsp; ???</p></a></h5>
		    	</div>
		    	</div>
				<div class="row gap">
					<div class="centered gap fade-down section-heading">
					<h2 class="main-title">?????????????????? ?????????</h2>
					</div>
					<div class="col-lg-2"></div><div class="col-lg-8">
						<p>????????????(??????)
						<select id="l_koo" class="form-control">
                            <option value=''>??????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>????????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>????????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>????????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>?????????</option>
                            <option>??????</option>
                            <option>?????????</option>
                            <input class="btn btn-outlined btn-primary" type="button" id="find" value="??????" />
                        </select>
                        <div id="cla">
                        	
                        </div>
					</div><div class="col-lg-2"></div>
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
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f3db20354b85124212a8809df35284b&libraries=services"></script>
</body>
<script>
$(document)
.ready(function(){	
	console.log(`${userinfo==null}`);
	showlist();
})
.on('keyup','#searching',function(key){ // search connect enter
	if(key.keyCode==13){
		$('#btnSearch').trigger('click');
	}
	return false;
})

//search
.on('click','#btnSearch',function(){
	//???????????? ???????????? ????????? ???????????????  view ???????????? ????????? ???!
	let table='bfsearch';  // view ??????
	let search=$('#searching').val(); //?????????
	if($('#searching').val()==''){
		alert('???????????? ????????????.');
		return false;
	}
	$('#cla').empty();
	$('#btnAll').detach();
	if($('#selSearch option:selected').text()=='?????????'){
		$.ajax({
			type:'post',url:'searchNick',data:{table:table,search:search},dataType:'json',
			success:function(data){
				//?????? ????????? ????????? ?????? ??????, ?????? ????????? id ?????? ???????????? ?????? ???
				if(data==''){
					alert('???????????? ????????????');
				}else {
					for(let i=0;i<data.length;i++){
						let jo=data[i];
						let str='';
						$('#cla').append(str);
					}
				}
			},
			error:function(){
			},
			complete:function(){}
		})
		$('#showAll').append('<a class="btn btn-primary btn-outlined" href="/pj/freeboard" id="btnAll"><p id="all1">????????????</p></a>');
	} else {
		$('#thd').empty();
		$('#thd').append('<tr><th>????????????</th><th>??????</th><th>?????????</th><th>??? ???</th><th>????????????</th><th>?????????</th></tr>');
		$.ajax({
			type:'post',url:'searchTNC',data:{table:table,search:search},dataType:'json',
			success:function(data){
				//?????? ????????? ????????? ?????? ??????, ?????? ????????? id ?????? ???????????? ?????? ???
				console.log(data);
				
				if(data==''){
					alert('???????????? ????????????');					
				}else{
					for(let i=0;i<data.length;i++){
						let jo=data[i];
						let str='';
						$('#cla').append(str);
					}
					
				}
			},
			error:function(){
			},
			complete:function(){}
		})
		$('#showAll').append('<a class="btn btn-primary btn-outlined" href="/pj/freeboard" id="btnAll"><p id="all1">????????????</p></a>');
	}
	return false;
})
.on('click','#find',function(){
	console.log($('#l_koo option:selected').text());
	if($('#l_koo option:selected').text()=='??????'){
		showlist();
	}
	$.ajax({
		type:'get',url:'find_list',data:{l_koo:$('#l_koo option:selected').text()},
			dataType:'json',
	  		success:function(data){
	  			$('#cla').empty();
	  			for(let i=0;i<data.length;i++){
					let jo=data[i];
					if(getToday()>jo['l_date']){
						let str='<a href="l_Read?l_no='+jo['l_no']+'"><div class="col-md-4 post fade-up">'
						+'<div class="item-inner">'
						+'<img src=<c:url value="/resources/assets/img/demo/14.jpg"/> alt="" class="img-responsive"></div>'
						+'<div class="square pull-right" id="but">'+jo['l_views']+'</div>'
						+'<p>'+jo['l_title']+'<br>'+jo['l_date']+'<br>??????</p></div></a>';
						$('#cla').append(str);
					}
					if(getToday()<=jo['l_date']){
						if(jo['count']==jo['nop']){
							let str='<a href="l_Read?l_no='+jo['l_no']+'"><div class="col-md-4 post fade-up">'
							+'<div class="item-inner">'
							+'<img src=<c:url value="/resources/assets/img/demo/14.jpg"/> alt="" class="img-responsive"></div>'
							+'<div class="square pull-right" id="but">'+jo['l_views']+'</div>'
							+'<p>'+jo['l_title']+'<br>'+jo['l_date']+'<br>????????????</p></div></a>';
							$('#cla').append(str);
						}else{
							let str='<a href="l_Read?l_no='+jo['l_no']+'"><div class="col-md-4 post fade-up">'
							+'<div class="item-inner">'
							+'<img src=<c:url value="/resources/assets/img/demo/14.jpg"/> alt="" class="img-responsive"></div>'
							+'<div class="square pull-right" id="but">'+jo['l_views']+'</div>'
							+'<p>'+jo['l_title']+'<br>'+jo['l_date']+'<br>??????'+jo['count']+'/'+jo['nop']+'</p></div></a>';
							$('#cla').append(str);
						}
					}
	  			}
    		},
    		error:function(){
    			alert('?????????????????????');
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
				if(getToday()>jo['l_date']){
					let str='<a href="l_Read?l_no='+jo['l_no']+'"><div class="col-md-4 post fade-up">'
					+'<div class="item-inner">'
					+'<img src=<c:url value="/resources/assets/img/demo/14.jpg"/> alt="" class="img-responsive"></div>'
					+'<div class="square pull-right" id="but">'+jo['l_views']+'</div>'
					+'<p>'+jo['l_title']+'<br>'+jo['l_date']+'<br>??????</p></div></a>';
					$('#cla').append(str);
				}
				if(getToday()<=jo['l_date']){
					if(jo['count']==jo['nop']){
						let str='<a href="l_Read?l_no='+jo['l_no']+'"><div class="col-md-4 post fade-up">'
						+'<div class="item-inner">'
						+'<img src=<c:url value="/resources/assets/img/demo/14.jpg"/> alt="" class="img-responsive"></div>'
						+'<div class="square pull-right" id="but">'+jo['l_views']+'</div>'
						+'<p>'+jo['l_title']+'<br>'+jo['l_date']+'<br>????????????</p></div></a>';
						$('#cla').append(str);
					}else{
						let str='<a href="l_Read?l_no='+jo['l_no']+'"><div class="col-md-4 post fade-up">'
						+'<div class="item-inner">'
						+'<img src=<c:url value="/resources/assets/img/demo/14.jpg"/> alt="" class="img-responsive"></div>'
						+'<div class="square pull-right" id="but">'+jo['l_views']+'</div>'
						+'<p>'+jo['l_title']+'<br>'+jo['l_date']+'<br>??????'+jo['count']+'/'+jo['nop']+'</p></div></a>';
						$('#cla').append(str);
					}
				}
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
</script>
</html>