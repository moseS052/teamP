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
<script type="text/javascript">
    $(document).ready(function(){
    	jQuery('#headerwrap').backstretch(
				[ "resources/assets/img/bg/plant.jpg"
					 ], {
					duration : 8000,
					fade : 500
				});

		/* // Map Position And Settings
		$("#mapwrapper").gMap({ 
			controls: false,
			scrollwheel: false,
			draggable: false,
			latitude:40.7566,
			longitude: -73.9863,
			zoom: 11

		}); */
	});
    </script>
<style>
     @font-face {
    font-family: 'Binggrae';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	 body {
      /* min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); */
      align:center;
      font-family: 'Binggrae';
    } 
	h2{
		font-family: 'Binggrae';
	}
    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      
    }
    .container{
    	positon: absolute;
    	width: 800px;
    	height:800px; 
    	margin: auto;
    }
  </style>
<style>
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
                <h2><span class="pe-7s-chat logo-icon"></span> Q</h2>
                <c:if test="${m_no==null}">
				<a href="login">login</a><a href="signup">????????????</a>
				</c:if>
				<c:if test="${m_no!=null}">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${id}&nbsp;???<a href='logout'>Logout</a>
				</c:if>
            </div>
            <div>
				<c:if test="${m_no!=null}">
				<a href=''><img src=<c:url value="resources/assets/img/avatar1.png"/> width="20px" height="20px" id='meminfo' seq="${m_no}" /></a>
				<div class="dropdown pull-right">
				<a href="#" class="dropdown-toggle menu-icon" data-toggle="dropdown" id="alarmClick"></a>
		        <div id="alarmInto" class="dropdown-menu" style="width:707px; opacity: 1; left: 0; padding:10px 10px 10px 10px;">
		        
<!-- 		        <div class="well"><div class="square pull-right" id="but">??????</div><h4>I'm Kim</h4></div> -->
<!-- 				<a href='#'><img src=<c:url value="resources/assets/img/all.png"/> width="30px" height="30px" /></a> -->
<!-- 				<a href='#'><img src=<c:url value="resources/assets/img/all1.png"/> width="30px" height="30px" /></a> -->
				</div></div>
				</c:if>
			</div>
            <ul id="main-menu">
            <c:if test="${m_no!=''}">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">????????????<i
						 class="fa fa-user menu-icon" aria-hidden="true"></i></a>
					<ul class="dropdown-menu">
						<li><a href="privacy?m_no=${m_no}">??????????????????</a></li>
						<li><a href="pwchange?m_no=${m_no}">??????????????????</a></li>
						<li><a href="MyPost?m_no=${m_no}">????????????????????????</a></li>
					</ul></li>
					</c:if>
				<li class="dropdown"><a href="/pj" class="dropdown-toggle">Home 
					<i class="fa fa-home menu-icon"></i></a>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Pages <i class="fa fa-file menu-icon"></i></a>
					<ul class="dropdown-menu">	
						<li>
						<c:if test="${m_no==''}">
						<a href="login">?????????????????????</a>
						</c:if>
						<c:if test="${m_no!=''}">
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
                <h2 class="main-title">????????????</h2>
                <hr>
                <p></p>
            </div>
		</div>
	</div>
 
	<div id="content-wrapper">
	    <section id="about">
	   		<!-- <div class="container"> -->
		    	<div class="gap"></div>
				<div class="row gap">

					<div class="col-md-12">
						<!-- <label>ID: </label><input type=text name=pid id="pid" autofocus onkeypress='return checkBlank(event)'><br>
						<label>????????????: </label><input type=password name=ppw id="ppw" onkeypress='return checkBlank(event)'><br>
						<label class="" for="inputInvalid">???????????? ??????: </label>
						<input type=password name=ppw2 id="ppw2" onkeypress='return checkBlank(event)'><br>
						<label>??????: </label><input type=text name='pname' id="pname" onkeypress='return checkBlank(event)'><br>
						<label>?????????: </label><input type=text name='pnick' id="pnick" onkeypress='return checkBlank(event)'><br>
						<label>?????????: </label><input type=text name='pphone' id="pphone" onkeypress='return checkBlank(event)'><br>
						<label>??????: </label><input type="radio" name='pgender' id="pgender" value='M'>??????&nbsp;&nbsp;
						<input type="radio" name='pgender' id="pgender" value='F'>??????<br>
						<label>?????????: </label><input type=text name='pmail' id="pmail" onkeypress='return checkBlank(event)'><br>
						<label>????????????: </label><input type=text name='pbirth' id="pbirth" onchange="view()" onkeypress='return checkBlank(event)'><br>
						?????? ?????? ????????? ????????? ?????????<br>
						<input type="checkbox" name='ptalent' value='1' id='a'>??????<br>
						<input type="checkbox" name='ptalent' value='2' id='b'>??????<br>
						<input type="checkbox" name='ptalent' value='3' id='c'>??????<br>
						<input type="checkbox" name='ptalent' value='4' id='d'>??????<br>
						<input type="checkbox" name='ptalent' value='5' id='e'>??????<br>
						<input type=button id="up" class="btn btn-primary btn-outlined" value='????????????'>&nbsp;
						<input type=button id="clean" class="btn btn-primary btn-outlined" value='?????????'> -->
<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <!-- <h4 class="mb-3">????????????</h4> -->
       <!--  <form class="validation-form" novalidate> -->
          <div class="row">
            <div class="col-md-6 mb-3">
            <label>ID</label>
            <input type="text" class="form-control" id="pid" name="pid" placeholder="id" required autofocus onkeypress='return checkBlank(event)'>
           <!--  <div class="invalid-feedback">
              ID??? ??????????????????.
            </div> -->
          </div>
          <div class="col-md-6 mb-3">
              <label>?????????</label>
              <input type="text" class="form-control" id="pphone" name="pphone" placeholder="01012345678" value="" required onkeypress='return checkBlank(event)'>
              <!-- <div class="invalid-feedback">
                ???????????? ??????????????????.
              </div> -->
            </div>
            <div class="col-md-6 mb-3">
              <label>????????????</label>
              <input type="password" class="form-control" id="ppw" name="ppw" placeholder="password" style="font-family:auto" value="" required onkeypress='return checkBlank(event)'>
              <!-- <div class="invalid-feedback">
                ??????????????? ??????????????????.
              </div> -->
            </div>
            <div class="col-md-6 mb-3">
              <label>???????????? ??????</label>
              <input type="password" class="form-control" id="ppw2" name="ppw2" placeholder="??????????????? ?????? ??? ??????????????????" style="font-family:auto" value="" required onkeypress='return checkBlank(event)'>
              <!-- <div class="invalid-feedback">
                ??????????????? ?????? ??? ??????????????????.
              </div> -->
            </div>
            <div class="col-md-6 mb-3">
              <label>??????</label>
              <input type="text" class="form-control" id="pname" name="pname" placeholder="????????? ??????????????????" value="" required onkeypress='return checkBlank(event)'>
              <!-- <div class="invalid-feedback">
                ????????? ??????????????????.
              </div> -->
            </div>
            <div class="col-md-6 mb-3">
              <label>?????????</label>
              <input type="text" class="form-control" id="pnick" name="pnick" placeholder="???????????? ??????????????????" value="" required onkeypress='return checkBlank(event)'>
              <!-- <div class="invalid-feedback">
                ????????? ??????????????????.
              </div> -->
            </div>            
          </div>
		
            <div class="mb-3">
              <label>??????</label><br>
              <input type="radio" id="pgender" name="pgender" placeholder="" value="M" required>???
              <input type="radio" id="pgender" name="pgender" placeholder="" value="F" required>???
              <!-- <div class="invalid-feedback">
                ????????? ??????????????????.
              </div> -->
            </div>	
          <div class="mb-3">
            <label>?????????</label>
            <input type="email" class="form-control" id="pmail" name="pmail" placeholder="you@example.com" required onkeypress='return checkBlank(event)'>
            <!-- <div class="invalid-feedback">
              ???????????? ??????????????????.
            </div> -->
          </div>

          <div class="mb-3">
            <label>????????????</label>
            <input type="text" class="form-control" id="pbirth" name="pbirth" placeholder="19990909" required onkeypress='return checkBlank(event)'>
            <!-- <div class="invalid-feedback">
              ??????????????? ??????????????????.
            </div> -->
          </div>

          <div class="mb-3">
            <label>?????? ?????? ????????? ????????? ?????????</label><br>
            <input type="checkbox" name='ptalent' value='1' id='a'>??????<br>
			<input type="checkbox" name='ptalent' value='2' id='b'>??????<br>
			<input type="checkbox" name='ptalent' value='3' id='c'>??????<br>
			<input type="checkbox" name='ptalent' value='4' id='d'>??????<br>
			<input type="checkbox" name='ptalent' value='5' id='e'>??????<br>
            
          </div>

          
          <hr class="mb-4">
        
          <div class="mb-4"></div>
          <input class="btn btn-primary btn-outlined btn-lg btn-block" type="button" id="up" value='Join'>
          <input type=button id="clean" class="btn btn-lg btn-secondary btn-block text-uppercase" value='??????'>          
       <!--  </form> -->
      </div>
    </div>
   
  </div>
  <!-- <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script> -->


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
.ready(function(){
	window.scrollTo(0,0);
})
.on('click','#up',function(){
	if($('#pid').val()=='' || $('#ppw').val()=='' || $('#ppw2').val()=='' || $('#pname').val()==""||$('#pnick').val()=='' ||
			$('#pphone').val()=='' || $('#pmail').val()=='' || $('#pbirth').val()=='' ||
			!$('input:checkbox[name="ptalent"]').is(":checked") || !$('input:radio[name="pgender"]').is(":checked")){
		alert('????????? ????????????! ????????? ?????? ????????? ?????????');
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
						alert('????????? ?????????????????????');
						window.location.href="<%= request.getContextPath() %>/login";
					}
				}) 
			}
		})
	}
})
.on('click','#clean',function(){
	if(confirm('?????????????????????????')){
		alert('???????????? ????????? ???????????????')
		document.location='/pj'
	}
	return false;
})
/* .on('change','#ppw',function(){
	if($('#ppw').val()!=$('#ppw2').val() && $('#ppw2').val()==''){
		
		$('#ppw2').val('').focus();
		
	} else if($('#ppw').val()!=$('#ppw2').val()){
		alert('??????????????? ?????? ??? ????????? ?????????.');
		$('#ppw2').val('').focus();
	} else {
		alert('??????????????? ???????????????.');
	}
	return true;
}) */
.on('change','#ppw2',function(){
	if($('#ppw').val()!=$('#ppw2').val()){
		alert('??????????????? ?????? ??? ????????? ?????????.');
		$('#ppw2').val('').focus();
		return false;
	} else if($('#ppw2').val()==''){
		alert('??????????????? ?????? ??? ????????? ?????????.');
		$('#ppw2').val('').focus();
	} else {
		alert('??????????????? ???????????????.');
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
				alert('?????? ???????????? ??????????????????.');
				$('#pid').val('').focus();
			}
		}
	})
})
.on('change','#pmail',function(){
	let email = $("#pmail").val();

	if(email==""){
		alert("???????????? ??????????????????.");
		$('#pnick').val('').focus();
		return false;
	}else{
		if(!email_check(email)){
			alert("????????? ????????? ?????? ??????????????????");
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
				alert('?????? ???????????? ??????????????????.');
				$('#pnick').val('').focus();
			}
		}
	})
})
function email_check(email) {
	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return reg.test(email);
}
function checkBlank(event){
	if(event.key == ' '){
		alert('????????? ????????? ??? ????????????');
		return false;
	}
	return true;
}
</script>
</html>
