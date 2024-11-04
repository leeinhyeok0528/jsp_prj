<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title</title>
<link rel="shorcut icon"
	href="http://192.168.10.225/jsp_prj/common/images/favicon.ico">

<link rel="stylesheet" type="text/css"
	href="http://192.168.10.225/jsp_prj/common/CSS/main_20240911.css">
<!-- bootstrap CDN 시작 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->
<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>




<style type="text/css">
</style>

<script type="text/javascript">
	$(function() {
$("#btnSend").click(function(){
	$("#frm").submit();
})//btnSend


//file에서 이벤트가 발생하면,
$("#profile").change(function(evt){//evt를 해놓으면 자바스크립트의 이벤트가 들어옴
	preview(evt);
})//btnUpdate

$("#btnUpdate").click(function(){
	ajaxFileUpload();
});

	});//ready
	
	
	//이거 잘 활용해야함 리뷰 사진넣기등....
	function ajaxFileUpload() {
		
		//1. Form 태그 얻기 ,,, FormControl의 값을 Ajax로 전달.
		var form= $("#frm")[0];
		//2.HTML Form Control의 값을 data속성으로 전달하기 위해 생성.
		var formData = new FormData(form);
		
		
		$.ajax({
			url:"upload_img_process.jsp",
			contentType:false, //파일전송방식임, false로 해야 사진정송
			processData: false, //false로 설정해야 사진이 전송됨,,,query string을 없애는것
			data:formData,
			type:"post", //사진전송을위해 post로
			dataType: "json",
			error: function(xhr){
				console.log(xhr.status);
				alert("이미지 업로드 실패")
			},
			success: function(jsonObj){
				var msg = "이미지 업로드 실패";
				if(!jsonObj.uploadFlag){
					msg="이미지 업로드 성공"				
				}//end if
				alert(msg);
			}//success
		})//ajax
	}//ajaxFileUpload
	
	
	
	function preview(evt){
	if($("#profile").val() ==""){
		alert("이미지를 선택해 주세요");
		return;
	}
	//1. 파일 컴포넌트 얻기
	var file = evt.target.files[0];
	//2. 스트림 생성
	var reader = new FileReader();
	
	//3. FileReader 객체의 onload 이벤트 핸들러 설정..
	reader.onload=function(evt2){
		$("#preview").prop("src",evt2.target.result);
	}
	
	//4.
	reader.readAsDataURL(file);
	}//preview;
	
</script>

</head>


<body>

	<div id="wrap">


		<form action="fileupload_process.jsp" method="post" name="frm"
			id="frm">
		<img  src="images/default_img.png" id="preview" style="width: 171px;height:176px "> <br>
			<label>프로필 이미지</label>
		<input type="file" name="profile" id="profile">
		<input type="button" value="이미지 업로드" id="btnUpdate" name="btnUpdate" class="btn btn-sm btn-success">
		<br>
		<label>이름</label>
	 		<input type="text" name="name" id="name"> <br>

		<label>id</label>
	 		<input type="text" name="id" id="id"> <br>
	 		<input type="button" value="전송" id="btnSend" name="btnSend">
		</form>

	</div>

</body>
</html>