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
<style>
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
                        <li><a href="proposal?m_no=45">봉사활동 기획서</a></li>  
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
                <h2 class="main-title">봉사활동작성</h2>
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

					<div class="col-md-8 fade-up">
						<h3>봉사활동작성</h3>
						
						<div id="cla">
						<input type=hidden id="m_no" value="${m_no}">
						작성자<input type="text" class="form-control" id="nick" placeholder="Name" value="${nick}" disabled/>
						</div>
						
						<p>제목<input type="text" class="form-control" id="l_title" placeholder="title"/>
						   내용<textarea style="resize:none; overflow:hidden;"class="form-control" id="l_content" rows=10 cols=60 placeholder="자세한 내용을 적어주세요"></textarea>
						   <p class="well">재능기부신청<br><input type="checkbox" value="1">요리&nbsp;<input type="checkbox" value="2">청소&nbsp;<input type="checkbox" value="3">미용&nbsp;<input type="checkbox" value="4">강연&nbsp;<input type="checkbox" value="5">기타</p>
						   시행일자<input type="date" id="l_date" class="form-control">
						   사진추가<input type="file" id="l_file"class="form-control" accept="image/*" required multiple>
						</p>
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
						<div class="col-md-8 fade-up"><p><input class="btn btn-outlined btn-primary" type="button" id="ad" value="등록" /><input class="btn btn-outlined btn-primary" type="button" id="ca" value="취소" /></p></div>						
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

})

.on('click','#ad',function(){	
	
	console.log('이름='+$('#m_no').val());
	console.log('제목='+$('#l_title').val());
	console.log('내용='+$('#l_content').val());
	console.log('날자='+$('#l_date').val());
	console.log('사진='+$('#l_file').val());
	console.log('신청구역='+$('#l_koo option:selected').val());
	console.log('상호='+$('#l_name option:selected').text());
	console.log('상세주소='+$('#l_address').val());
	$.ajax({
		type:'get',url:'new_ad',data:{m_no:$('#m_no').val(),l_title:$('#l_title').val(),l_content:$('#l_content').val(),l_date:$('#l_date').val(),l_file:$('#l_file').val(),l_koo:$('#l_koo option:selected').val(),l_name:$('#l_name option:selected').text(),l_address:$('#l_address').val()},
			dataType:'text',async: false,
	  		success:function(){
    				console.log('ann');
	  			$("input[type=checkbox]:checked").each(function(){
    				const value = $(this).val();
    				$.ajax({
    						type:'get',url:'check_ad',data:{m_no:$('#m_no').val(),l_date:$('#l_date').val(),t_no:value},
    						dataType:'text',
    					  		success:function(){
    					  		document.location='/pj/success_page'
    				    		},
    				    		error:function(){
    				    			alert('데이터등록실패');
    				    			document.location='/pj/success_page'
    				    		},
    				    		complete:function(){}
    				    	});
    			})
	  			document.location='/pj/success_page'
    		},
    		error:function(){
    		},
    		complete:function(){}
    	});
})
.on('click','#ca',function(){
	$('#hid,#l_no,#l_addresss,#l_name,#l_koo,#l_title,#l_content,#l_date').val('');
})
.on('click','#map',function(){
	let aa=$('#hid').val()
	console.log(aa);
	console.log('"'+'map?key='+aa+'"');
 	window.open('http://192.168.0.2:8080/pj/map?key='+aa,"_blank", "width=800, height=580, top=40, left=1340");
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

</script>
</html>
