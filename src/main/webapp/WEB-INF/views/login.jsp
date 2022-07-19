<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<form id=frmLogin method=POST action="user_check">
<input type=text name=id><br>
<input type=password name=pw><br>
<input type=submit value='로그인'>&nbsp;<input type=reset value='비우기'>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
<script type="text/javascript">
$(document)
/* .on('submit','#frmLogin',function(){
	self.close(); //<-이거 있음 값 안들어감
//	opener.location.reload();
	
	
}) */
/* window.addEventListener('beforeunload', function(event) {
	
});	 */
</script>
</html>