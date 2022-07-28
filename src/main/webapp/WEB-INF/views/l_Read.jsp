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
				<h2>
					<span class="pe-7s-chat logo-icon"></span> Quote
				</h2>
			 	<c:if test="${userinfo==null}">
				<a href="login">login</a><a href="signup">회원가입</a>
				</c:if>
				<c:if test="${userinfo!=null}">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${userinfo}&nbsp;님<a href='logout'>Logout</a>
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
					data-toggle="dropdown">개인정보<i
						 class="fa fa-user menu-icon" aria-hidden="true"></i></a>
					<ul class="dropdown-menu">
						<li><a href="privacy?m_no=${m_no}">개인정보수정</a></li>
						<li><a href="pwchange?m_no=${m_no}">비밀번호변경</a></li>
						<li><a href="MyPost?m_no=${m_no}">내가쓴게시물찾기</a></li>
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
					data-toggle="dropdown">Board <i class="fa fa- menu-icon"></i></a>
					<ul class="dropdown-menu">
						<li><a href="<%= request.getContextPath() %>/freeboard">Free Board</a></li>
						<li><a href="single-post-sidebar.html">Request Board</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Q&nbsp;&&nbsp;A <i class="fa fa-solid fa-question menu-icon"></i></a>
					<ul class="dropdown-menu">
						<li><a href="/pj/qna">자주 묻는 질문</a></li>
						<li><a id='question' href="#">1:1 질문</a></li>
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
						<h3></h3>
						
                        <div class="well">
                        <input type="hidden" id="l_no" value="${l_no}">
                        <input type="hidden" id="user_name" value="${userinfo}">
                        <p>${l_nick}<div class="square pull-right">${l_views}</div></p>
                        <h3>${l_title}</h3><div class="square pull-right"><img src=<c:url value="/resources/assets/img/portfolio/folio13.jpg"/> width="150px" height="135px"/></div>
                        <h3>일시${l_date}</h3>                        
                        <h3>장소${l_name}</h3>
                        <h3 id="cbox">주소:${l_addr}</h3><input class="btn btn-outlined btn-primary" type="button" id="map" value="지도보기" />
                        </div>
						<p>내용:${l_con}</p>
                        <div class="square pull-right" id="but">
						<p>
						신청현황<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${lookapp}/${nop}
						</p>
						
						<c:if test="${userinfo!=null && l_mno eq m_no}">
						신청인원(아이디)<select id="l_name" class="form-control">
                            
                        	 		</select> 
						</c:if>
                        </div>

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
	console.log('오늘'+getToday());
	console.log('예약'+`${l_date}`)
	shwocheck();
	applylist()
	if(`${l_mno}`==`${m_no}`){
		if(getToday()>`${l_date}`){
			let str="<a href='후기페이지jsp입력'><input class='btn btn-outlined btn-primary' type='button' id='0' value='후기보러가기' /></a><input class='btn btn-outlined btn-primary' type='button' id='작성할때필요' value='후기작성' />"
			$('#but').append(str);
			}else{let str="<input class='btn btn-outlined btn-primary' type='button' id='l_retouch' value='수정하기' />"
			+"<input class='btn btn-outlined btn-primary' type='button' id='l_del' value='삭제하기' />"
			$('#but').append(str);}
			
	}else if(`${userinfo}`== ""){
		if(getToday()>`${l_date}`){
			let str="<a href='후기페이지jsp입력'><input class='btn btn-outlined btn-primary' type='button'  value='후기보러가기'/></a><a href='login'><input class='btn btn-outlined btn-primary' type='button'  value='후기작성' /></a>"
			$('#but').append(str);
		}else{
			if(`${lookapp}`==`${nop}`){
				let str ="<input class='btn btn-outlined btn-primary' type='button'  value='신청마감' />"
					$('#but').append(str);
			}else if(`${lookapp}`<=`${nop}`){
					let str ="<a href='login'><input class='btn btn-outlined btn-primary' type='button'  value='신청하기' /></a>"
						$('#but').append(str);	
			}
		}
		
	}else if(`${l_mno}`!=`${m_no}`){
		if(getToday()>`${l_date}`){
			let str="<a href='후기페이지jsp입력'><input class='btn btn-outlined btn-primary' type='button'  value='후기보러가기'/></a><a href='login'><input class='btn btn-outlined btn-primary' type='button'  value='후기작성' /></a>"
				$('#but').append(str);
		}else{
			if(`${lookapp}`==`${nop}`){
				$.ajax({
					type:'get',url:'butdiff',data:{l_no:$('#l_no').val(),m_no:`${m_no}`},
						dataType:'json',
				  		success:function(data){
				  			console.log('데이타는='+data)
				  			if(data==1){
				  				let str="<input class='btn btn-outlined btn-primary'  type='button' value='신청마감' />"
				  				+"<input class='btn btn-outlined btn-primary' type='button' id='apdel' value='신청취소' />"
				  					$('#but').append(str);
				  			}else{
				  				let str="<input class='btn btn-outlined btn-primary' id='called' type='button' value='신청하기' />"
				  					$('#but').append(str);
				  			}
			    		},
			    		error:function(){
			    			alert('삭제실패');
			    		},
			    		complete:function(){}
			    	});
			}else if(`${lookapp}`<=`${nop}`){
				$.ajax({
					type:'get',url:'butdiff',data:{l_no:$('#l_no').val(),m_no:`${m_no}`},
						dataType:'json',
				  		success:function(data){
				  			console.log('데이타는='+data)
				  			if(data==1){
				  				let str="<input class='btn btn-outlined btn-primary' type='button' value='신청완료' />"
				  				+"<input class='btn btn-outlined btn-primary' type='button' id='apdel' value='신청취소' />"
				  					$('#but').append(str);
				  			}else{
				  				let str="<input class='btn btn-outlined btn-primary' id='called' type='button' value='신청하기' />"
				  					$('#but').append(str);
				  			}
			    		},
			    		error:function(){
			    			alert('삭제실패');
			    		},
			    		complete:function(){}
			    	});
			}
		}
		
	
	}
		
	
})
.on('click','#map',function(){
	let a=`${l_addr}`
	let ar =a.split("("); 
	console.log(ar[0]);
	console.log('"'+'map?key='+ar[0]+'"');
 	window.open('http://192.168.0.2:8080/pj/map?key='+ar[0],"_blank", "width=800, height=580, top=40, left=1340");
	return false;
	// 현재 주소 종권이 로컬네트워크임, 서버로 옮길 수 있나 확인
})
.on('click','#l_del',function(){
	console.log($('#l_no').val());
	$.ajax({
		type:'get',url:'l_del',data:{l_no:$('#l_no').val()},
			dataType:'json',
	  		success:function(data){
	  			console.log(data);
	  			alert('삭제되었습니다');
	  			document.location='/pj/proposal_list'
    		},
    		error:function(){
    			alert('삭제실패');
    		},
    		complete:function(){}
    	});
})

.on('click','#l_retouch',function(){
	console.log($('#l_no').val());
	
	document.location='/pj/l_retouch?l_no='+$('#l_no').val()
})
.on('click','#called',function(){
	console.log(`${m_no}`);
	console.log(`${l_no}`);
	$.ajax({
		type:'get',url:'applynew',data:{l_no:$('#l_no').val(),m_no:`${m_no}`},
			dataType:'text',
	  		success:function(){
	  			alert('신청완료되셨습니다')
	  			document.location='/pj/l_Read?l_no='+$('#l_no').val()
    		},
    		error:function(){
    			alert('데이터등록실패');
    		},
    		complete:function(){}
    	});
})
.on('click','#apdel',function(){
	console.log(`${m_no}`);
	console.log(`${l_no}`);
	$.ajax({
		type:'get',url:'applydel',data:{l_no:$('#l_no').val(),m_no:`${m_no}`},
			dataType:'text',
	  		success:function(){
	  			alert('신청이취소되었습니다')
	  			document.location='/pj/l_Read?l_no='+$('#l_no').val()
    		},
    		error:function(){
    			alert('데이터등록실패');
    		},
    		complete:function(){}
    	});
})
function shwocheck(){
	let ar=`${sd}`.split(',');
	let str="";
// 	console.log(ar[1]);
	for(let i=0; i<ar.length; i++){
		str+=ar[i];
	}
		$('#cbox').append('<h3>재능:'+str+'</h3>');
}
function usercheck(){
	$.ajax({
		type:'get',url:'user_check',data:{l_no:$('#l_no').val()},
			dataType:'json',
	  		success:function(){
	  			console.log(data);
	  			alert('삭제되었습니다');
	  			document.location='/pj/proposal_list'
    		},
    		error:function(){
    			alert('삭제실패');
    		},
    		complete:function(){}
    	});
}
function applylist(){
	$.ajax({
		type:'get',url:'applylist',data:{l_no:$('#l_no').val()},
			dataType:'json',
	  		success:function(data){
	  			$('#l_name').empty();
	  			for(let i=0;i<data.length;i++){
					let jo=data[i];
					let str='<option>'+jo['appnick']+'</option>';
					$('#l_name').append(str);
	  			}
    		},
    		error:function(){
    			alert('데이터등록실패');
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