<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글쓰기_자유게시판</title>
</head>
<body>
<form id=frmfb method=post action="insert_fb">
제목: <input type=text id=title name=title><br>
내용: <textarea id=content name=content rows=10 cols=70></textarea><br>
<input type=submit value='작성완료'>&nbsp;
<input type=reset value='목록' id=btnList>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
<script>
$(document)
.on('click','#btnList',function(){
	document.location='/pj/freeboard';
})
</script>
</html>