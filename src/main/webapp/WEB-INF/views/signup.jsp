<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form method=post action="login">
ID: <input type=text name=pid><br>
비밀번호: <input type=password name=ppw><br>
비밀번호 확인: <input type=password name=ppw2><br>
이름: <input type=text name='pname'><br>
활동명: <input type=text name='pnick'><br>
모바일: <input type=text name='pphone'><br>
성별: <input type="radio" name='pgender' id='male' value='M'>남성&nbsp;&nbsp;
<input type="radio" name='pgender' id='female' value='F'>여성<br>
이메일: <input type=text name='pmail'><br>
생년월일: <input type=text name='pbirth'><br>
<input type="checkbox" name='talent' value='1' id='a'>요리<br>
<input type="checkbox" name='talent' value='2' id='a'>청소<br>
<input type="checkbox" name='talent' value='3' id='a'>미용<br>
<input type=submit value='회원가입'>&nbsp;<input type=reset value='취소'>
</form>
</body>
</html>