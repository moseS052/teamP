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
<!-- <script type="text/javascript">
    $(document).ready(function(){
    	jQuery('#headerwrap').backstretch(
				[ "resources/assets/img/bg/bg1.jpg", "resources/assets/img/bg/bg2.jpg",
					"resources/assets/img/bg/bg3.jpg" ], {
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
    </script> -->
	
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
                
            </div>
            <ul id="main-menu">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Home <i class="fa fa-home menu-icon"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="index.html">Home Agency</a></li>
                        <li><a href="index-blog.html">Home Blog</a></li>
                        <li><a href="index-single-page.html">Home Single Page</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages <i class="fa fa-file menu-icon"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="about-us.html">About Us</a></li>  
                        <li><a href="contact-us.html">Contact Us</a></li>
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
	<!-- <div id="headerwrap" class="half">
   		<div class="container">
	    	<div class="gap"></div> 
        	<div id="bannertext" class="centered fade-down section-heading">
                <h2 class="main-title">About Us</h2>
                <hr>
                <p>She evil face fine calm have now. Separate screened he outweigh of distance landlord.</p>
            </div>
		</div>/container
	</div>/headerwrap
 -->
	<div id="content-wrapper">
	    <section id="about">
	   		<div class="container">
		    	<div class="gap"></div>
				<div class="row gap">

					<div class="col-md-12">
						<label>ID: </label><input type=text name=pid id="pid" autofocus onkeypress='return checkBlank(event)'><br>
						<label>비밀번호: </label><input type=password name=ppw id="ppw" onkeypress='return checkBlank(event)'><br>
						<label class="" for="inputInvalid">비밀번호 확인: </label>
						<input type=password name=ppw2 id="ppw2" onkeypress='return checkBlank(event)'><br>
						<label>이름: </label><input type=text name='pname' id="pname" onkeypress='return checkBlank(event)'><br>
						<label>닉네임: </label><input type=text name='pnick' id="pnick" onkeypress='return checkBlank(event)'><br>
						<label>모바일: </label><input type=text name='pphone' id="pphone" onkeypress='return checkBlank(event)'><br>
						<label>성별: </label><input type="radio" name='pgender' id="pgender" value='M'>남성&nbsp;&nbsp;
						<input type="radio" name='pgender' id="pgender" value='F'>여성<br>
						<label>이메일: </label><input type=text name='pmail' id="pmail" onkeypress='return checkBlank(event)'><br>
						<label>생년월일: </label><input type=text name='pbirth' id="pbirth" onchange="view()" onkeypress='return checkBlank(event)'><br>
						내가 가진 재능을 체크해 주세요<br>
						<input type="checkbox" name='ptalent' value='1' id='a'>요리<br>
						<input type="checkbox" name='ptalent' value='2' id='b'>청소<br>
						<input type="checkbox" name='ptalent' value='3' id='c'>미용<br>
						<input type="checkbox" name='ptalent' value='4' id='d'>강연<br>
						<input type="checkbox" name='ptalent' value='5' id='e'>기타<br>
						<input type=button id="up" class="btn btn-primary btn-outlined" value='회원가입'>&nbsp;
						<input type=button id="clean" class="btn btn-primary btn-outlined" value='비우기'>
					</div>
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
	<!-- <script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWDPCiH080dNCTYC-uprmLOn2mt2BMSUk&amp;sensor=true"></script> -->
	<script src="<c:url value="/resources/assets/js/init.js"/>"></script>
</body>
<script>
$(document)
.on('click','#up',function(){
	if($('#pid').val()=='' || $('#ppw').val()=='' || $('#ppw2').val()=='' || $('#pname').val()==""||$('#pnick').val()=='' ||
			$('#pphone').val()=='' || $('#pmail').val()=='' || $('#pbirth').val()=='' ||
			!$('input:checkbox[name="ptalent"]').is(":checked") || !$('input:radio[name="pgender"]').is(":checked")){
		alert('공백이 있습니다! 양식을 다시 확인해 주세요');
		return false;
	}else{
		$.ajax({
			type:'post',dataType:'text',url:'sign',async: false,
			data:{id:$('#pid').val(),pw:$('#ppw').val(),name:$('#pname').val(),nick:$('#pnick').val(),
				phone:$('#pphone').val(),gender:$('input[name="pgender"]:checked').val(),mail:$('#pmail').val(),
				birth:$('#pbirth').val(),t_no:$('input[name="ptalent"]:checked').val()},
			beforeSend:function(){
				console.log("id: "+$('#pid').val()+"pw: "+$('#ppw').val()+",name: "+$('#pname').val() + ",nick: "+$('#pnick').val()+
						",phone: "+$('#pphone').val()+",gender: "+$('input[name="pgender"]:checked').val()+" ,mail: "+$('#pmail').val()+
						",birth: "+$('#pbirth').val()+",talent: "+$('input[name="ptalent"]:checked').val());
				
			},
			success:function(){
				let chk='';
				$('input[name=ptalent]:checked').each(function(){
					chk+=$(this).val()+' ';
				})
				 $.ajax({
					type:'post',dataType:'text',url:'talent',
					data:{
						
							id:$('#pid').val(),
							t_no:chk	
						
						},
					beforeSend:function(){
						console.log("t_no: "+$('input[name="ptalent"]:checked').val());
					},
					success:function(){
						alert('가입이 완료되었습니다');
						window.location.href="<%= request.getContextPath() %>/login";
					}
				}) 
			}
		})
	}
})
.on('click','#clean',function(){
	$('#pid,#ppw,#ppw2,#pname,#pnick,#pphone,#pmail,#pbirth').val('');
	$('input:checkbox[name="ptalent"]').prop("checked",false);
	$('input:radio[name="pgender"]').prop("checked",false);
})
/* .on('change','#ppw',function(){
	if($('#ppw').val()!=$('#ppw2').val() && $('#ppw2').val()==''){
		
		$('#ppw2').val('').focus();
		
	} else if($('#ppw').val()!=$('#ppw2').val()){
		alert('비밀번호를 한번 더 입력해 주세요.');
		$('#ppw2').val('').focus();
	} else {
		alert('비밀번호가 일치합니다.');
	}
	return true;
}) */
.on('change','#ppw2',function(){
	if($('#ppw').val()!=$('#ppw2').val()){
		alert('비밀번호를 한번 더 입력해 주세요.');
		$('#ppw2').val('').focus();
		return false;
	} else if($('#ppw2').val()==''){
		alert('비밀번호를 한번 더 입력해 주세요.');
		$('#ppw2').val('').focus();
	} else {
		alert('비밀번호가 일치합니다.');
	}
	return true;
})
.on('change','#pid',function(){
	$.ajax({
		type:'get',dataType:'text',url:'idcheck',
		data:{id:$('#pid').val()},
		beforeSend:function(){},
		success:function(data){
			console.log("idcnt: "+data);
			if(parseInt(data) == 0){
				
			} else {
				alert('다른 아이디를 입력해주세요.');
				$('#pid').val('').focus();
			}
		}
	})
})
.on('change','#pmail',function(){
	let email = $("#pmail").val();

	if(email==""){
		alert("이메일을 입력해주세요.");
		$('#pnick').val('').focus();
		return false;
	}else{
		if(!email_check(email)){
			alert("이메일 형식에 맞게 입력해주세요");
			$('#pmail').val('').focus();
			return false;
		}
	}
})
.on('change','#pnick',function(){
	$.ajax({
		type:'get',dataType:'text',url:'nickcheck',
		data:{nick:$('#pnick').val()},
		beforeSend:function(){},
		success:function(data){
			console.log("nickcnt: "+data);
			
			if(parseInt(data) == 0){
				
			} else {
				alert('다른 닉네임을 입력해주세요.');
				$('#pnick').val('').focus();
			}
		}
	})
})
function email_check(email) {
	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return reg.test(email);
}
function view(){
	alert('19990909 형식으로 입력 해주세요');
}
function checkBlank(event){
	if(event.key == ' '){
		alert('공백은 입력할 수 없습니다');
		return false;
	}
	return true;
}
</script>
</html>