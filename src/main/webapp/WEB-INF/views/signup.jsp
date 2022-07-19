<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<!-- <form id=frmSignup method=POST action="sign"> -->
ID: <input type=text name=pid id="pid"><br>
비밀번호: <input type=password name=ppw id="ppw"><br>
비밀번호 확인: <input type=password name=ppw2 id="ppw2"><br>
이름: <input type=text name='pname' id="pname"><br>
활동명: <input type=text name='pnick' id="pnick"><br>
모바일: <input type=text name='pphone' id="pphone"><br>
성별: <input type="radio" name='pgender' id="pgender" value='M'>남성&nbsp;&nbsp;
<input type="radio" name='pgender' id="pgender" value='F'>여성<br>
이메일: <input type=text name='pmail' id="pmail"><br>
생년월일: <input type=text name='pbirth' id="pbirth"><br>
<input type="checkbox" name='talent' value='1' id='a'>요리<br>
<input type="checkbox" name='talent' value='2' id='b'>청소<br>
<input type="checkbox" name='talent' value='3' id='c'>미용<br>
<input type=button id="up" value='회원가입'>&nbsp;<input type=button id="clean" value='비우기'>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
$(document)
.on('click','#up',function(){
	$.ajax({
		type:'post',dataType:'text',url:'sign',
		data:{id:$('#pid').val(),pw:$('#ppw').val(),name:$('#pname').val(),nick:$('#pnick').val(),
			phone:$('#pphone').val(),gender:$('input[name="pgender"]:checked').val(),mail:$('#pmail').val(),
			birth:$('#pbirth').val()},
		beforeSend:function(){
			console.log("id: "+$('#pid').val()+"pw: "+$('#ppw').val()+",name: "+$('#pname').val() + ",nick: "+$('#pnick').val()+
					",phone: "+$('#pphone').val()+",gender: "+$('input[name="pgender"]:checked').val()+" ,mail: "+$('#pmail').val()+
					",birth: "+$('#pbirth').val());
		},
		success:function(data){
			
		},
		error:function(){},
		complete:function(){}
	})
})
.on('click','#clean',function(){
	$('#pid,#ppw,#pname,#pnick,#pphone,#pgender,#pmail,#pbirth').val('');
})
</script>
</html>