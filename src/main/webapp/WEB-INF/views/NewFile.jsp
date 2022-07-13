<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var='test' items="${test}">
${test.roomtype} <br>
${test.maxnop}<br>
아년ㅇ하세여<br> choong1
</c:forEach>
</body>
</html>