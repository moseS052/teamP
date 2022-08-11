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
<title>재능드림</title>
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
				<h2 id="undm"><span class="fa fa-smile-o logo-icon"></span><span style="font-family:'Binggrae';">재능드림</span></h2>
				<c:if test="${m_no!=null}">
				<h2 ><a href='' id="firstAvatar"><img src=<c:url value="${avatar}"/> width="35px" height="35px" id='meminfo' seq="${m_no}" /></a>
				<a href='' id="firstNick">${nick }&nbsp;님</a>
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
            <c:if test="${m_no!=null}">
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
						<c:if test="${m_no==null}">
						<a href="login">봉사활동기획서</a>
						</c:if>
						<c:if test="${m_no!=null}">
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
						<li><a href="/pj/question">1:1 질문</a></li>
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
                <h2 class="main-title">회원가입</h2>
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
						내가 가진 재능을 체크해 주세요<br>	 -->
<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <!-- <h4 class="mb-3">회원가입</h4> -->
       <!--  <form class="validation-form" novalidate> -->
          <div class="row">
            <div class="col-md-6 mb-3">
            <label>ID</label>
            <input type="text" class="form-control" id="pid" name="pid" placeholder="id" required autofocus onkeypress='return checkBlank(event)'>
           <!--  <div class="invalid-feedback">
              ID를 입력해주세요.
            </div> -->
          </div>
          <div class="col-md-6 mb-3">
              <label>모바일</label>
              <input type="text" class="form-control" id="pphone" name="pphone" placeholder="01012345678" value="" required onkeypress='return checkBlank(event)'>
              <!-- <div class="invalid-feedback">
                모바일을 입력해주세요.
              </div> -->
            </div>
            <div class="col-md-6 mb-3">
              <label>비밀번호</label>
              <input type="password" class="form-control" id="ppw" name="ppw" placeholder="password" style="font-family:auto" value="" required onkeypress='return checkBlank(event)'>
              <!-- <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div> -->
            </div>
            <div class="col-md-6 mb-3">
              <label>비밀번호 확인</label>
              <input type="password" class="form-control" id="ppw2" name="ppw2" placeholder="비밀번호를 한번 더 입력해주세요" style="font-family:auto" value="" required onkeypress='return checkBlank(event)'>
              <!-- <div class="invalid-feedback">
                비밀번호를 한번 더 입력해주세요.
              </div> -->
            </div>
            <div class="col-md-6 mb-3">
              <label>이름</label>
              <input type="text" class="form-control" id="pname" name="pname" placeholder="이름을 입력해주세요" value="" required onkeypress='return checkBlank(event)'>
              <!-- <div class="invalid-feedback">
                이름을 입력해주세요.
              </div> -->
            </div>
            <div class="col-md-6 mb-3">
              <label>닉네임</label>
              <input type="text" class="form-control" id="pnick" name="pnick" placeholder="닉네임을 입력해주세요" value="" required onkeypress='return checkBlank(event)'>
              <!-- <div class="invalid-feedback">
                별명을 입력해주세요.
              </div> -->
            </div>            
          </div>
		
            <div class="mb-3">
              <label>성별</label><br>
              <input type="radio" id="pgender" name="pgender" placeholder="" value="M" required>남
              <input type="radio" id="pgender" name="pgender" placeholder="" value="F" required>여
              <!-- <div class="invalid-feedback">
                성별을 입력해주세요.
              </div> -->
            </div>	
          <div class="mb-3">
            <label>이메일</label>
            <input type="email" class="form-control" id="pmail" name="pmail" placeholder="you@example.com" required onkeypress='return checkBlank(event)' style="display:inline;">
            <!-- <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div> -->
            <!-- <div>
				<button type="button" class="btn btn-primary btn-outlined" id="mail-Check-Btn">본인인증</button>
			</div>
			<div class="mail-check-box">
				<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
			</div>
				<span id="mail-check-warn"></span>
			</div> -->
         	 

          <div class="mb-3">
            <label>생년월일</label>
            <input type="text" class="form-control" id="pbirth" name="pbirth" placeholder="19990909" required onkeypress='return checkBlank(event)'>
            <!-- <div class="invalid-feedback">
              생년월일을 입력해주세요.
            </div> -->
          </div>

          <div class="mb-3">
            <label>내가 가진 재능을 선택해 주세요</label><br>
            (여러개 선택 가능 또는 선택 하지 않아도 무관합니다)<br>
            <input type="checkbox" name='ptalent' value='21' id='a'>공연
			<input type="checkbox" name='ptalent' value='22' id='b'>미용
			<input type="checkbox" name='ptalent' value='23' id='c'>레크레이션
			<input type="checkbox" name='ptalent' value='24' id='d'>체육교실<br>
			<input type="checkbox" name='ptalent' value='25' id='e'>예체능강의
            <input type="checkbox" name='ptalent' value='26' id='f'>미술치료
			<input type="checkbox" name='ptalent' value='27' id='g'>교육
			<input type="checkbox" name='ptalent' value='28' id='h'>의료봉사<br>
			<input type="checkbox" name='ptalent' value='29' id='i'>요리
			<input type="checkbox" name='ptalent' value='30' id='j'>차량봉사
			<input type="checkbox" name='ptalent' value='31' id='k'>집수리
			
          </div>

          
          <hr class="mb-4">
        
          <div class="mb-4"></div>
          <input class="btn btn-primary btn-outlined btn-lg btn-block" type="button" id="up" value='Join'>
          <input type=button id="clean" class="btn btn-lg btn-secondary btn-block text-uppercase" value='취소'>          
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
			/* !$('input:checkbox[name="ptalent"]').is(":checked") || */ !$('input:radio[name="pgender"]').is(":checked")){
		alert('공백이 있습니다! 양식을 다시 확인해 주세요');
		return false;
	}else{
		let tt_no=$('input[name="ptalent"]:checked').val();
		if(tt_no==null){
			tt_no=0;
		}
		$.ajax({
			type:'post',dataType:'text',url:'sign',async: false,
			data:{id:$('#pid').val(),pw:$('#ppw').val(),name:$('#pname').val(),nick:$('#pnick').val(),
				phone:$('#pphone').val(),gender:$('input[name="pgender"]:checked').val(),mail:$('#pmail').val(),
				birth:$('#pbirth').val(),t_no:tt_no},
			beforeSend:function(){
				
				console.log("id: "+$('#pid').val()+"pw: "+$('#ppw').val()+",name: "+$('#pname').val() + ",nick: "+$('#pnick').val()+
						",phone: "+$('#pphone').val()+",gender: "+$('input[name="pgender"]:checked').val()+" ,mail: "+$('#pmail').val()+
						",birth: "+$('#pbirth').val()+",talent: "+tt_no);
				
			},
			success:function(){
				let chk='';
				if(tt_no!=0){
					$('input[name=ptalent]:checked').each(function(){
						chk+=$(this).val()+' ';
					})
				}else{
					chk+=0;
				}
				
				 $.ajax({
					type:'post',dataType:'text',url:'talent',
					data:{
						
							id:$('#pid').val(),
							t_no:chk	
						
						},
					beforeSend:function(){
						console.log("t_no: "+chk);
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
	if(confirm('취소하시겠습니까?')){
		alert('취소하고 홈으로 돌아갑니다')
		document.location='/pj'
	}
	return false;
})
/* .on('click','#mail-Check-Btn',function(){
	const eamil = $('#pmail').val(); // 이메일 주소값 얻어오기!
	console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
	const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	
	 $.ajax({
		type : 'get',
		url : 'mailCheck?email='+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
		success : function (data) {
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}			
	});  // end ajax
})
.on('blur','.mail-check-input',function(){
	const inputCode = $(this).val();
	const $resultMsg = $('#mail-check-warn');
	
	if(inputCode === code){
		$resultMsg.html('인증번호가 일치합니다.');
		$resultMsg.css('color','green');
		$('#mail-Check-Btn').attr('disabled',true);
		$('#pmail').attr('readonly',true);
	}else{
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
		$resultMsg.css('color','red');
	}
}) */

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
		//alert('비밀번호가 일치합니다.');
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
function checkBlank(event){
	if(event.key == ' '){
		alert('공백은 입력할 수 없습니다');
		return false;
	}
	return true;
}
</script>
</html>
