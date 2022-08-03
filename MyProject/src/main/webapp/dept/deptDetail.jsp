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
<title>부서 상세</title>
</head>
<style>
table {
width: 400px;
border-collapse: collapse;
}

td,th {
border: 1px solid black;
padding: 5px;
}


</style>
<body>

<h1>부서 상세 </h1>
<table>
 <tr>
  <th>부서번호</th>  
  <td>${deptVO.deptno}</td>
  </tr>
  
   <tr>
  <th>부서이름</th> 
   <td>${deptVO.dname}</td>
  </tr>
  
   <tr>
  <th>부서위치</th>
   <td>${deptVO.loc}</td>
  
</table>
<th colspan="2">
 <button type="button" onclick="location='deptModify.do?deptno=${deptVO.deptno}'">수정</button>
 <button type="button" onclick="location='deptDelete.do?deptno=${deptVO.deptno}'">삭제</button>
</th>

</body>
</html>