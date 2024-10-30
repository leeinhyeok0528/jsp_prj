<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax_param</title>
<link rel="shorcut icon"
	href="http://192.168.10.225/jsp_prj/common/images/favicon.ico">

<link rel="stylesheet" type="text/css"
	href="http://192.168.10.225/jsp_prj/common/CSS/main_20240911.css">
	<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- bootstrap CDN 끝 -->
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	


<style type="text/css">
</style>

<script type="text/javascript">
$(function(){
	
	$("#btn").click(function(){
		sendData();
	})//btn_click
} );//ready

//유효성검증
function sendData(){
	var name = $("#name").val();
	var age = $("#age").val();

if(name.trim() == ""){
	alert("이름은 필수입력")
	$("#name").focus();
	return;
}//end if
	if(age.trim() == ""){
	alert("나이는 필수입력")
	$("#age").focus();
	return;
}//end if


//1. query String으로 작성
//var param = "name="+name + "&age="+age;
//2.jsonObject로 작성
//이때 이름이 파라메터명이 된다 이름:값의 쌍
var param = {na:name, age:age};


$.ajax({
	url:"test_param.jsp",
	type:"get",
	data:param,
	dataType:"json",
	error: function(xhr){
		console.log(xhr.status)
	},//error
	success: function(jsonObj){
		var inter= jsonObj.interests;
		var msg=jsonObj.msg; //이게 파싱하는 작업
		
		$("#output").html(msg+"<br>"+inter);
		$("#txtOut").val(inter);
		
	}//success
	
})


 }//sendData
	




</script>

</head>


<body>

	<div id="wrap">
	<div id="output" style="height: 80px;"></div>
	<div><input type="text" id="txtOut"></div>
	
	<label>이름</label>
	<input type="text" name="name" id="name">
	<label>나이</label>
	<input type="text" name="age" id="age">
	
	<input type="button" value="전송" class="btn btn-success" id="btn">
	
	</div>

</body>
</html>