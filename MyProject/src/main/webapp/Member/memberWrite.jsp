<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입화면</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 
<script src="/MyProject/script/jquery-1.12.4.js"></script>
<script src="/MyProject/script/jquery-ui.js"></script>
<script> 

$( function() {
    $("#birth").datepicker({
      changeMonth: true,
      changeYear: true
    });
    
    $("#btn_zipcode").click(function(){  
    	var w = 500;
    	var h = 100;
    	var url = "post1.do";
    	window.open(url,'zipcode','width='+w+",height="+h);
    });
    
    
    $("#btn_idcheck").click(function(){
    	var userid = $.trim($("#userid").val());
    	if(userid == ""){
    		alert("아이디를 입력해주세요");
    		$("#userid").focus();
    		return false;
    	}
    	
    	$.ajax({
    		type:"POST",
    	    data:"userid="+userid,  //json타입
    	    url:"idcheck.do",
    	    dataType:"text",
    	    
    		success: function(result){
    			 if(result == "ok"){
    				 alert("사용가능한 ID입니다.");
    				
    			 }else {
    				 
    				 alert("이미 사용중인 ID입니다");
    			 }		 
    		 },
    		 error: function(){
    			      alert("시스템오류");	 
    		     }
    	});
    });
    	
    
    $("#btn_submit").click(function() {
    	var userid = $.trim($("#userid").val());
    	var pass = $.trim($("#pass").val());
    	var name = $.trim($("#name").val());

      if(userid == ""){
    	  alert("아이디를 입력해주세요")
    	  $("#userid").focus();
    	  return false;
      }
      if(pass == ""){
    	  alert("패스워드를 입력해주세요")
    	  $("#pass").focus();
    	  return false;
      }
      if(name == ""){
    	  alert("이름을 입력해주세요")
    	  $("#name").focus();
    	  return false;
      }
      $("#userid").val(userid);  //공백을 넣어서 입력하고 저장 누르면 공백 다 제거돼서 실제 db에 들어감
      $("#pass").val(pass);
      $("#name").val(name);
      
      var formData = $("#frm").serialize();
      
      $.ajax({
    		 type:"POST",	
    		 data:formData,
    	     url:"memberWriteSave.do",
    		 dataType:"text",
    		 success: function(result){
    			 if(result == "ok"){
    				 alert("저장완료");
    				 location="login.do";
    			 }else {
    				 
    				 alert("저장실패");
    			 }		 
    		 },
    		 error: function(){
    			      alert("시스템오류");	 
    		     }
    		});	
    	
    	
    });
  
});
</script>

 
</head>

<style>
body {
	font-size:9pt;
	font-color:#333333;
	font-family:맑은 고딕;
}
a {
	text-decoration:none;
}
table {
	width:700px;
	border-collapse:collapse;
}
th,td {
	border:1px solid #cccccc;
	padding:3px;
	line-height:2.0;
}
caption {
	font-size:15pt;
	font-weight:bold;
	margin-top:10px;
	padding-bottom:5px;
}
.div_button {
	width:600px;
	text-align:center;
	margin-top:5px;
}
</style>

<body>
<%@ include file="../include/topmenu.jsp" %>
 

<form name="frm" id="frm">
<table>
	<caption>회원가입 폼</caption>
	<tr>
		<th><label for="userid">아이디</label></th>
		<td>
		<input type="text" name="userid" id="userid" placeholder="아이디입력">
		<button type="button" id="btn_idcheck">중복체크</button>
		</td>
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td>
		<input type="password" name="pass" id="pass">
		</td>
	</tr>
	<tr>
		<th><label for="name">이름</label></th>
		<td>
		<input type="text" name="name" id="name">
		</td>
	</tr>
	<tr>
		<th><label for="gender">성별</label></th>
		<td>
		<input type="radio" name="gender" id="gender" value="M">남 
		<input type="radio" name="gender" id="gender" value="F">여
		</td>
	</tr>
	<tr>
		<th><label for="birth">생년월일</label></th>
		<td>
		<input type="text" name="birth" id="birth">
		</td>
	</tr>
	<tr>
		<th><label for="phone">연락처</label></th>
		<td>
		<input type="text" name="phone" id="phone"> (ex:010-1234-1234)
		</td>
	</tr>
	<tr>
		<th><label for="address">주소</label></th>
		<td>
			<input type="text" name="zipcode" id="zipcode">
			<button type="button" id="btn_zipcode">우편번호찾기</button> 
			<br>
			<input type="text" name="address" id="address">
		</td>
	</tr>
</table>
<div class="div_button">
	<button type="button" id="btn_submit">저장</button>
	<button type="reset">취소</button>
</div>
</form>

</body>
</html>