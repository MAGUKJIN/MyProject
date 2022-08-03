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
<script src="/MyProject/script/jquery-1.12.4.js"></script>
<script src="/MyProject/script/jquery-ui.js"></script>

</head>
<script>
$(function (){

 $("#del").click(function(){
 
    var pass = $("#pass").val();
    pass = $.trim(pass);
     if(pass == ""){
    	 alert("암호를 입력하세요");
    	 return flase;
     }
     
     var sendData = "unq=${unq}&pass="+pass;
 	
 	$.ajax({
 	 type:"POST",	
 	 data: sendData,  //JSON
      url:"boardDelete.do",
 	 dataType:"text",
 	 
 	 success: function(result){
 		 if(result == "1"){
 			 alert("삭제완료");
 			 location="boardList.do";
 		 }else if(result == "-1") {
 			 alert("암호가 틀렸습니다."); } else {
 			 
 				 alert("저장실패\n관리자에게 연락주세요");
 		 }		 
 	 },
          error: function(){
         	alert("시스템 오류");
 	     } 
 	 
    });
  });  
});
</script>


<body>
<table>
  <tr>
    <th>암호입력</th>
    <td><input type="password" id="pass"></td>
    <td><button type="button" id="del">삭제</button></td>
  </tr>

</table>
</body>
</html>