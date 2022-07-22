<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>free board</title>
</head>
<body align=center>
<h1>^^</h1>
<%
	
%>
${userinfo }
${m_no }
${id }
${nick }
<c:if test="${m_no==''}">
<table align=center>
<tr><th>게시번호</th><th>제목</th><th>작성자</th><th>작성일자</th></tr>
<%-- <c:forEach var="boardDTO" items="${boardlist }">
<tr><td>${boardDTO.seqbbs }</td><td>${boardDTO.title }</td>
<td>${boardDTO.writer }</td><td>${boardDTO.created }</td>
</tr>
</c:forEach> --%>
</table>
</c:if>
<c:if test="${m_no!=''}">
<table align=center>
<tr><th>게시번호</th><th>제목</th><th>작성자</th><th>작성일자</th><th>수정</th><th>삭제</th></tr>
<%-- <c:forEach var="boardDTO" items="${boardlist }">
<tr><td>${boardDTO.seqbbs }</td>
<td><a href='board?seqbbs=${boardDTO.seqbbs}'>${boardDTO.title }</a></td>
<td>${boardDTO.writer }</td><td>${boardDTO.created }</td>
<td><form id=frmup method=get action="view">
<input type=hidden id="seqbbs" name="seqbbs" value="${boardDTO.seqbbs }">
<input type=submit value='수정'></form></td><td>
<form id=frmdel method=get action="delete">
<input type=hidden id="seqbbs" name="seqbbs" value="${boardDTO.seqbbs }">
<input type=submit value='삭제'></form></td>
</tr>
</c:forEach> --%>
</table>
</c:if>
<c:if test="${m_no!=''}">
<a href='newpost_write'>새글쓰기</a>
</c:if>
</body>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
</html>