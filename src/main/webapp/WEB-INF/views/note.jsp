<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/assets/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/animate.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/prettyPhoto.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/pe-icons.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/memfstyle.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/font-awesome.min.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/assets/js/jquery.js"/>"></script>  
<script src="<c:url value="/resources/assets/js/modernizr.custom.js"/>"></script>   
</head>
<body id='body'>

</body>
<script>
$(document)
.ready(function(){
	noteCon();
})






function noteCon(){
	$.ajax({
		type:'get',url:'noteUp',dataType:'json',data:{m_no:${mno},m_pa_no:${mpano}},
		success:function(data){
			for(let i=0;i<data.length;i++){
				notetem=data[i];
				if(notetem['m_no']==1){
					$('#body').text(notetem['n_con'])
				}else{
					$('#body').text(notetem['n_con'])
				}
			}
		}
	})
}

</script>
</html>