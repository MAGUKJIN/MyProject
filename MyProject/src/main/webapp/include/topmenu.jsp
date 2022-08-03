<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

<%
String USERID = (String)session.getAttribute("SessionUserId");
%>

<table>
	<tr>
		
		<th width="33.3%"><a href="/MyProject/boardList.do">게시판</a></th>
	<%
	    if(USERID == null) {
	%>	
		<th width="33.3%"><a href="/MyProject/memberWrite.do">회원가입</a></th>
		<th width="33.3%"><a href="/MyProject/loginWrite.do">로그인</a></th>
	<%
	} else {
	%>
		<th width="33.3%"><a href="/MyProject/memberModifyWrite.do">회원정보</a></th>
		<th width="33.3%"><a href="/MyProject/logout.do">로그아웃</a></th>
	<%
	} 
	%>
	</tr>
</table>

</body>
</html>




