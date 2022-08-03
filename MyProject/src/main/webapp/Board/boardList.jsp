<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
</head> 
<style>
table {
    margin:auto; 
}
body{
font-size: 12pt;
}
th,td{
boarder:2px solid black;
padding:3px;
}
.bar{
text-align: right;}
h5{
text-align: left;}

</style>
<%@ include file="../include/topmenu.jsp" %>
<body>

<table width="650px">
<caption>
<h2>[게시판 목록]</h2><h5>Total:${total}</h5>
<form name="searchFrm" method="post" action="boardList.do">
 <div class="bar">
  <select name="searchBar" id="searchBar">
   <option value="title">제목</option>
   <option value="name">글쓴이</option>
   <option value="content">내용</option>
  </select>
  <input type="text" name="searchText" id="searchText">
  <button type="submit">검색</button>
 </div>
</form>
</caption>

 <tr>
  <th width="15%">번호</th>
  <th width="40%">제목</th>
  <th width="15%">글쓴이</th>
  <th width="15%">작성일</th>
  <th width="15%">조회수</th>
</tr>

<c:set var="cnt" value="${startRn}" />

<c:forEach var="result" items="${ResultList}">
<tr align="center">
 <td><c:out value="${cnt}"/></td>
 <td align="left"><a href="boardDetail.do?unq=${result.unq}"><c:out value="${result.title}"/></a></td>
 <td><c:out value="${result.name}"/></td>
 <td><c:out value="${result.rdate}"/></td>
 <td><c:out value="${result.hits}"/></td>
</tr>
<c:set var="cnt" value="${cnt-1}"/>

</c:forEach>

</table>
<br>

 <div style= "width:960px; margin-top: 5px; text-align: center;">
   <c:forEach var="i" begin="1" end="${totalPage}">
     <a href="boardList.do?viewPage=${i}">[${i }]</a>
   </c:forEach>
 </div>
 
</body><br>
 <div style= "width:960px; margin-top: 5px; text-align: right;">
 <button type="button" onclick="location='boardWrite.do'" >글쓰기</button>
 </div>
</html>