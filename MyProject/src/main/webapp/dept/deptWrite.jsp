<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
width: 400px;
border-collapse : collapse;}

th,td {
border: 1px solid black;
padding: 5px;
}


</style>
<body>

<h1>부서관리 화면 </h1>

<form name="frm" method="post" action="deptWriteSave.do">
<table>
 <tr>
  <th>부서번호</th>
  <td><input type="text" name="deptno"></td>
  </tr>
  
   <tr>
  <th>부서이름</th>
  <td><input type="text" name="dname"></td>
  </tr>
  
   <tr>
  <th>부서위치</th>
  <td><input type="text" name="loc"></td>
  </tr>
  
</table>
 <button type="submit">저장</button>

</form>
</body>
</html>