<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<label class="" for="inputInvalid">비밀번호 확인: </label>
<input type=password name=ppw2 id="ppw2"><br>
이름: <input type=text name='pname' id="pname"><br>
닉네임: <input type=text name='pnick' id="pnick"><br>
모바일: <input type=text name='pphone' id="pphone"><br>
성별: <input type="radio" name='pgender' id="pgender" value='M'>남성&nbsp;&nbsp;
<input type="radio" name='pgender' id="pgender" value='F'>여성<br>
이메일: <input type=text name='pmail' id="pmail"><br>
생년월일: <input type=text name='pbirth' id="pbirth"><br>
<input type="checkbox" name='ptalent' value='1' id='a'>요리<br>
<input type="checkbox" name='ptalent' value='2' id='b'>청소<br>
<input type="checkbox" name='ptalent' value='3' id='c'>미용<br>
<input type="checkbox" name='ptalent' value='4' id='d'>강연<br>
<input type="checkbox" name='ptalent' value='5' id='e'>기타<br>
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
			birth:$('#pbirth').val(),t_no:$('input[name="ptalent"]:checked').val()},
		beforeSend:function(){
			console.log("id: "+$('#pid').val()+"pw: "+$('#ppw').val()+",name: "+$('#pname').val() + ",nick: "+$('#pnick').val()+
					",phone: "+$('#pphone').val()+",gender: "+$('input[name="pgender"]:checked').val()+" ,mail: "+$('#pmail').val()+
					",birth: "+$('#pbirth').val()+",talent: "+$('input[name="ptalent"]:checked').val());
		},
		success:function(data){
			//alert('가입이 완료되었습니다');
		}
	})
	$.ajax({
		type:'post',dataType:'text',url:'talent',
		data:{t_no:$('input[name="ptalent"]:checked').val()},
		beforeSend:function(){
			console.log("t_no: "+$('input[name="ptalent"]:checked').val());
		},
		success:function(data){
			alert('가입이 완료되었습니다');
			window.location.href="<%= request.getContextPath() %>/login";
		}
	})
})
.on('click','#clean',function(){
	$('#pid,#ppw,#pname,#pnick,#pphone,#pgender,#pmail,#pbirth,#ptalent').val('');
})
.on('change','#ppw2',function(){
	if($('#ppw').val()!=$('#ppw2').val()){
		alert('비밀번호를 한번 더 입력해 주세요.');
		$('#ppw2').val('');
		return false;
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
				$('#pid').val('');
			}
		}
	})
})
</script>
</html>