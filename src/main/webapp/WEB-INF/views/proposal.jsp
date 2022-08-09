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
.form-control:focus {
        border-color: #28a745;
        box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
    }
input[type="checkbox"]{
accent-color:green;
}
	@font-face {
    font-family: 'Binggrae';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	body{
		font-family: 'Binggrae';
	}
	table{
		text-align:center;
	}
	th {
    	text-align:center;
	}
	#searchDIV{
		text-align:right;
		margin-top:25px;
		font-family: 'GangwonEdu_OTFBoldA';
	}
	#boxboxq{
		margin-top:-45px;
		font-family: 'GangwonEdu_OTFBoldA';
	}
 	#btnSearch, #btnAll{ 
 		height:24px;
 		margin-top:-4px;
 		margin-left:5px;
 		font-family: 'Binggrae'; 		
 	} 
 	#searc,#all1{
 		margin-top:-7px;
 	}
 	#selSearch{
 		padding-top:1px;
 		font-size:15px;
 		margin-right:-2px;
 		font-family: 'Binggrae';
 		height:25px;
 	}
 	#searching{
 		font-size:17px;
 		font-family: 'Binggrae';
 	}
	.menu,#theMenu{
		font-family: 'Binggrae';
	}
	h2{
		font-family: 'Binggrae';
	}
a#meminfo, #btnSendNote, #goList{
 	display:inline; 
	font-size:18px;
	color:#007979;
	font-family: 'GangwonEdu_OTFBoldA';
}
a#goList{
margin-left: 4px

}
a#yesyes{
	display:inline;
	font-size:14px;
	color:#007979;
	font-family: 'Binggrae';
}
#firstAvatar{
	display:inline; 
	margin-left: -3px;
	margin-top: 0px;
}
#firstNick{
	display:inline; 
	font-size:16px;
	font-family: 'Binggrae';
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
#avaung{
	margin-top:-13px;
	margin-right:-18px;
}
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
/* .menu,#theMenu{
		font-family: auto;
	}	
 */</style>
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
		</div>
	</nav>
	<!-- END NAV -->
	
	<!-- MAIN IMAGE SECTION -->
	<div id="headerwrap" class="half">
   		<div class="container">
	    	<div class="gap"></div> 
        	<div id="bannertext" class="centered fade-down section-heading">
                <br><br><br><br><br>
                <h2 class="main-title">봉사활동작성</h2>
                <hr>
            </div>
		</div><!-- /container -->
	</div><!-- /headerwrap -->

	<div id="content-wrapper">
	    <section id="about">
	   		<div class="container">
		    	<div class="gap"></div>
				<div class="row gap">
						
					<div class="col-md-8 fade-up">
						<h3>봉사활동작성</h3>
						
						<div id="cla">
						<input type=hidden id="m_no" value="${m_no}">
						작성자<input type="text" class="form-control" id="nick" placeholder="Name" value="${nick}" disabled/>
						</div>
						
						<p>제목<input type="text" class="form-control" id="l_title" placeholder="title"/>
						   내용<textarea style="resize:none; overflow:hidden;"class="form-control" id="l_content" rows=10 cols=60 placeholder="자세한 내용을 적어주세요"></textarea></p>
						   <p class="well">재능기부신청<br><input type="checkbox" value="1">요리&nbsp;<input type="checkbox" value="2">청소&nbsp;<input type="checkbox" value="3">미용&nbsp;<input type="checkbox" value="4">강연&nbsp;<input type="checkbox" value="5">기타</p>
						   
						   <div class="col-md-4 post fade-up">시행일자<input type="date" id="l_date" class="form-control"></div>
						   <div class="col-md-4 post fade-up">사진추가
						  <form id="fileForm" method="post" enctype="multipart/form-data">
						   <input type="file" id="l_file" name="file" class="form-control" accept="image/*" required multiple="true">
						   </form>
						   </div>
							<div class="col-md-4 post fade-up">신청인원<input type="number" id="nop" placeholder="선택안할시자동5입력" class="form-control" min="0"></div>
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
                        
						기관(명)<select id="l_name" class="form-control"">
                            <input class="btn btn-outlined btn-primary" type="button" id="load" value="길찾기" /><br>
                            </select> 
						상세주소<input type="text" class="form-control" id="l_address"/>
						<input type="hidden" id='hid'>
						<input class="btn btn-outlined btn-primary" type="button" id="map" value="지도보기" /></p><br>
						<div style="text-align:center"><p><input class="btn btn-outlined btn-primary" type="button" id="ad" value="등록" /><input class="btn btn-outlined btn-primary" type="button" id="ca" value="취소" /></p></div>						
					</div><div class="col-md-4 fade-up" id="preview"></div>
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
	$("#nop").keyup(function(){ $(this).val($(this).val().replace(/[^0-9:\-]/gi,"") );  }); 
	if(`${m_no}`!=''){
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
	window.open("meminfo?m_no="+seq, "_blank", "width=400, height=400, top=40, left=1340");
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
	window.open("note?m_no="+m_no+"&m_pa_no="+m_pa_no, "_blank", "width=350, height=400, top=110, left=1700");
	}
	return false;
})
.on('change','#l_file',function(){
	$("#preview").html('');
	for(var i=0; i<$(this)[0].files.length; i++){
		$("#preview").append('<img style="height:150px; width:150px;" src="'+window.URL.createObjectURL(this.files[i])+'"/>'+'&nbsp;');
	};			
	
})
.on('click','#ad',function(){	
	a=0;
	if($('#nop').val()==0){
		a=5;
	}else{
		a=$('#nop').val();
	}	
		console.log(a)
	$.ajax({
		type:'get',
		url:'new_ad',
		data:{
			nop:a,m_no:$('#m_no').val(),
			l_title:$('#l_title').val(),
			l_content:$('#l_content').val(),
			l_date:$('#l_date').val(),
			l_file:$('#l_file').val(),
			l_koo:$('#l_koo option:selected').val(),
			l_name:$('#l_name option:selected').text(),
			l_address:$('#l_address').val()},
			dataType:'text',async: false,
	  		success:function(data){
    				if(data==1){
    					alert('중복된 날입니다')
    				}else{
    					$("input[type=checkbox]:checked").each(function(){
    	    				const value = $(this).val();
    	    				$.ajax({
    	    						type:'get',url:'check_ad',async: false,data:{m_no:$('#m_no').val(),l_date:$('#l_date').val(),t_no:value},
    	    						dataType:'text',
    	    					  		success:function(){
    	    					  		document.location='success_page?b=l'
    	    				    		},
    	    				    		error:function(){
    	    				    			alert('데이터등록실패');
    	    				    		},
    	    				    		complete:function(){
    	    				    			
    	    				    		}
    	    				    	});
    	    			})
    	    				if($('#l_file').val()==''){
    	    					insertnoimg();
		    				}else{
		    					insertListPhoto();
		    				}
    				}
	  			
    		},
    		error:function(){
    		},
    		complete:function(){}
    	});
})
.on('click','#ca',function(){
	$('#hid,#l_no,#l_addresss,#l_name,#l_koo,#l_title,#l_content,#l_date,#nop').val('');
	
	console.log();
})
.on('click','#map',function(){
	let aa=$('#hid').val()
	console.log(aa);
	console.log('"'+'map?key='+aa+'"');
 	window.open('http://192.168.0.2:8080/pj/map?key='+aa,"_blank", "width=800, height=580, top=40, left=1340");
	return false;  
	// 현재 주소 종권이 로컬네트워크임, 서버로 옮길 수 있나 확인
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
    			alert('데이터등록실패');
    		},
    		complete:function(){}
    	});
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
.on('click','#question',function(){	
	if(`${m_no}`==''){
		alert('로그인 후 사용가능합니다.');
		return false;
	}else{
		document.location='/pj/question';
	}
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
function insertListPhoto(){
	let formData = new FormData($('#fileForm')[0]);
	$.ajax({
		url : 'insertl_loute',
		enctype: 'multipart/form-data',
		processData : false,
		contentType : false,
		type : 'POST',
		data : formData,
		success:function(result){
		}
	});
}
function insertnoimg(){
	$.ajax({
		url:'insertno_img', data:{a:1},dataType:'text',type:'get',
		success:function(){
	  			
    		},
    		error:function(){
    			alert('데이터등록실패123456');
    		},
    		complete:function(){}
    	});
}
</script>
</html>
