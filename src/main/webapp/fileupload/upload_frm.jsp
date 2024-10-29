<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
//이동한 페이지에서 새로고침을 했을 때, 작업이 여러번 발생하지 않도록 하기 위한 flag값 저장
session.setAttribute("uploadFlag", false);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title</title>
<link rel="shorcut icon"
href="http://192.168.10.223/jsp_prj/common/images/paka.jpg">
<link rel="stylesheet" type="text/css"
href="http://192.168.10.223/jsp_prj/common/CSS/main_20240911.css">
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   $("#btn").click(function(){
      chkNull();
   });
} );//ready

function chkNull(){
   if($("#uploader").val()==""){
      alert("업로더는 필수 입력!");
      $("#uploader").focus();
      return;
   }//end if
   if($("#upfile").val()==""){
      alert("업로드 파일은 필수 입력!");
      return;
   }//end if
   
   //업로드가능 확장자는 이미지 관련 확장자만 가능하다
   //이를 거르기 위해 유효성 검증을 해야한다.
   //jpg,gif,png,bmp 이에 해당하는 확장자가 아니면 alert로 업로드 가능 확장자가 아님을 보여주고 리턴한다.
 
   
   /*   
   let extension= ["jpg","gif","png","bmp"];
   
   let fileName = $("#upfile").val();
   
   let fileExt = fileName.split(".").pop();
   
   if(!extension.includes(fileExt)){
	   alert("가능한 확장자가 아닙니다");
	   return;
   }
   */
/*   
	const blockExt=["jpg","gif","png","bmp"];
	var fileName=$("#upfile").val();
	var fileExt=fileName.substring( fileName.lastIndexOf(".")+1);
	
	var blockFlag=false;
	for(var i= 0; i < blockExt.length ; i++){
		if(blockExt[i] == fileExt){
			blockFlag=true;
			break;
		}//end if
	}//end if
 	
	if( !blockFlag ){
		alert("업로드 가능 확장자가 아닙니다.");
		return;
	}//end if
	
    */
   
   
   $("#frm").submit();
}//chkNull

</script>
</head>
<body>
<div id="wrap">
<!-- 웹 파라메터 전송 방식에서 file 전송 방식으로 변경 -->
<a href="file_list.jsp">파일 리스트 보기</a>
<form action="upload_process.jsp" method="post" enctype="multipart/form-data" id="frm" name="frm">
<label>업로더</label>
<input type="text" name="uploader" id="uploader"/><br>
<label>파일확장자</label>
<input type="checkbox" name="ext" value="jpg">jpg
<input type="checkbox" name="ext" value="png">png
<input type="checkbox" name="ext" value="exe">exe
<input type="checkbox" name="ext" value="hwp">hwp
<br>
<label>파일</label>
<input type="file" name="upfile" id="upfile"/><br>
<input type="button" value="업로드" id="btn" class="btn btn-primary btn-sm"/><br>

</form>
</div>
</body>
</html>