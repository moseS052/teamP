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
  </head>
<style>
	@font-face {
    font-family: 'Binggrae';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	body{
		font-family: 'GangwonEdu_OTFBoldA';
	}
	h2{
		font-family: 'Binggrae';
	}
input[type="checkbox"]{
accent-color:green;
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
			 	<c:if test="${userinfo==''}">
				<a href="login">login</a><a href="signup">????????????</a>
				</c:if>
				<c:if test="${userinfo!=''}">
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
			<c:if test="${userinfo!=''}">
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
						<c:if test="${userinfo==''}">
						<a href="login">?????????????????????</a>
						</c:if>
						<c:if test="${userinfo!=''}">
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
                <h2 class="main-title">??????????????????</h2>
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

					<div class="col-md-8 fade-up">
						<h3>??????????????????</h3>
						
						<div id="cla">
						<input type=hidden id="m_no" value="${m_no}">
						<input type=hidden id="l_no" value="${l_no}">
						?????????<input type="text" class="form-control" id="nick" placeholder="Name" value="${nick}" disabled/>
						</div>
						
						<p>??????<input type="text" class="form-control" id="l_title" placeholder="title" value="${l_title}"/>
						   ??????<textarea style="resize:none; overflow:hidden;"class="form-control" id="l_content" rows=10 cols=60>${l_con}</textarea></p>
						   <p class="well">??????????????????<br><input type="checkbox" value="1" name="che">??????&nbsp;<input type="checkbox" value="2" name="che">??????&nbsp;<input type="checkbox" value="3" name="che">??????&nbsp;<input type="checkbox" value="4" name="che">??????&nbsp;<input type="checkbox" value="5" name="che">??????</p>
						  <div class="col-md-4 post fade-up"> ????????????<input type="date" id="l_date" class="form-control" value="${l_date}"></div>
						  <div class="col-md-4 post fade-up">????????????<input type="file" id="l_file"class="form-control" accept="image/*" required multiple></div>
						  <div class="col-md-4 post fade-up">????????????<input type="number" id="nop" value="${nop}" class="form-control"></div>
						<p>????????????(??????)<select id="l_koo" class="form-control">
                            <option >${l_koo}</option>
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
                            <input class="btn btn-outlined btn-primary" type="button" id="find" value="??????" /><br>
                        </select>
                        
						??????(???)<select id="l_name" class="form-control">
						<option>${l_name}</option>
                            <input class="btn btn-outlined btn-primary" type="button" id="load" value="?????????" /><br>
                            </select> 
						????????????<input type="text" class="form-control" id="l_address" value="${l_addr}"/>
						<input type="hidden" id='hid'>
						<input class="btn btn-outlined btn-primary" type="button" id="map" value="????????????" /></p><br>
						<div class="col-md-8 fade-up"><p><input class="btn btn-outlined btn-primary" type="button" id="ad" value="??????" /><input class="btn btn-outlined btn-primary" type="button" id="ca" value="????????????" /></p></div>						
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
	let ar = `${sd}`.split("");
	for(i=0; i<ar.length; i++){
	??$('input:checkbox[name="che"]').each(function() {
		???????? if(this.value == ar[i]){
			this.checked = true; }??});
	}
// 	console.log('??????='+$('#m_no').val());
// 	console.log('??????='+$('#l_title').val());
// 	console.log('??????='+$('#l_content').val());
// 	console.log('??????='+$('#l_date').val());
// 	console.log('??????='+$('#l_file').val());
// 	console.log('????????????='+$('#l_koo option:selected').val());
// 	console.log('??????='+$('#l_name option:selected').text());
// 	console.log('????????????='+$('#l_address').val());
})

.on('click','#ad',function(){	
	$.ajax({
		type:'get',url:'proUp',data:{nop:$('#nop').val(),l_no:$('#l_no').val(),m_no:$('#m_no').val(),l_title:$('#l_title').val(),l_content:$('#l_content').val(),l_date:$('#l_date').val(),l_file:$('#l_file').val(),l_koo:$('#l_koo option:selected').val(),l_name:$('#l_name option:selected').text(),l_address:$('#l_address').val()},
			dataType:'text',async: false,
	  		success:function(){
    				console.log('ann');
	  			$("input[type=checkbox]:checked").each(function(){
    				const value = $(this).val();
    				$.ajax({
    						type:'get',url:'upcheckbox',data:{l_no:$('#l_no').val(),m_no:$('#m_no').val(),l_date:$('#l_date').val(),t_no:value},
    						dataType:'text',
    					  		success:function(){
    					  		document.location='/pj/success_page'
    				    		},
    				    		error:function(){
    				    			alert('?????????????????????');
    				    		},
    				    		complete:function(){}
    				    	});
    			})
	  			
    		},
    		error:function(){
    		},
    		complete:function(){}
    	});
})
.on('click','#ca',function(){
	alert('????????? ???????????? ????????????????????????')
	document.location='/pj/'
})
.on('click','#map',function(){
	let aa=$('#hid').val()
	console.log(aa);
	console.log('"'+'map?key='+aa+'"');
 	window.open('http://192.168.0.2:8080/pj/map?key='+aa,"_blank", "width=800, height=580, top=40, left=1340");
	return false;
	// ?????? ?????? ????????? ?????????????????????, ????????? ?????? ??? ?????? ??????
})
.on('click','#load',function(){
	let str=$('#l_name option:selected').val();
	$('#l_address').val(str);
	let ar = str.split(',');
	let br = ar[0].split('(');
	$('#hid').val(br[0]);
})
.on('click','#find',function(){
	$.ajax({
		type:'get',url:'ko_check',data:{l_koo:$('#l_koo option:selected').text()},
			dataType:'json',
	  		success:function(data){
	  			$('#l_name').empty();
	  			for(let i=0;i<data.length;i++){
					let jo=data[i];
					let str='<option value="'+jo['ar']+'">'+jo['name']+'</option>';
					$('#l_name').append(str);
	  			}
    		},
    		error:function(){
    			alert('?????????????????????');
    		},
    		complete:function(){}
    	});
})

</script>
</html>
