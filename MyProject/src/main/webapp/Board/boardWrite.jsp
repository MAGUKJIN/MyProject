<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/MyProject/script/jquery-1.12.4.js"></script>
<script src="/MyProject/script/jquery-ui.js"></script>
</head>

<style>
body{
font-size: 12pt;
}
button{
font-size: 9pt;
}
table {
width:600px;
boarder-collapse: collapse;
margin: auto;
}
th,td{
boarder:2px solid black;
padding:3px;
}
.input1 {
width:98%;
}
.textarea {
width:98%;
height: 70px;
}
</style>
<script>

function fn_submit() {
	
	if( $.trim($("#title").val()) == ""){    //trim -> 공백제거. 공백은 값으로 인식하지않음.
		
		alert("제목을 입력해주세요");
		$("#title").focus();
		return false; 
	}
	if( $("#pass").val() == ""){
		alert("암호를 입력해주세요");
		$("#pass").focus();
		return false;
	}

	var formData = $("#frm").serialize();
	
	$.ajax({
	 type:"POST",	
	 data:formData,
     url:"boardWriteSave.do",
	 dataType:"text",
	 success: function(result){
		 if(result == "ok"){
			 alert("저장완료");
			 location="boardList.do";
		 }else {
			 
			 alert("저장실패");
		 }		 
	 },
	 error: function(){
		      alert("시스템오류");	 
	     }
	});	
}

</script>

<body>
 
 <form name="frm" id="frm" method="post" action="boardWriteSave.do">
 <table>
  <caption><h2>[게시판 등록]</h2></caption>
 <tr>
   <th width="20%"><label for="title">제목</label></th>
   <td width="80"><input type="text" name="title" id="title" class="input1"></td>
 </tr>
 
  <tr>
   <th>암호</th>
   <td> <input type="password" name="pass" id="pass"></td>
 </tr>
 
 
  <tr>
   <th>작성자</th>
   <td><input type="text" name="name" id="name"></td>
 </tr>
 
  
  <tr>
   <th>내용</th>
   <td><textarea name="content" id="content" class="textarea"></textarea></td>
 </tr>
 
   <tr>
     <th colspan="2">
      <button type="submit" onclick="fn_submit(); return false;">저장</button>
      <button type="reset">취소</button>
     </th>
 </tr>
 </table>

 </form>
</body>
</html>