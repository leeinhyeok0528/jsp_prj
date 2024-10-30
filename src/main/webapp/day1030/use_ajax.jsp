<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- bootstrap CDN 끝 -->
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	


<style type="text/css">
</style>

<script type="text/javascript">
$(function(){
	
	$("#btnTxt").click(function(){
		
		$.ajax({
		 	url:"text.txt",
		 	type:"get",
		 	dataType:"text",
		 	error:function(xhr){
				alert(xhr.status+"/"+xhr.statusText)		 		
		 	},
		 	success:function(data){
				$("#output").html(data);
		 	}
		 	
		})//ajax
	})//txt

	$("#btnHtml").click(function(){
		$.ajax({
			url:"response_html.html",
			type:"get",
			dataType:"html",
			error: function(xhr){
				alert(xhr.status+"/"+xhr.statusText)		 		

			},
			success:function(data){
				$("#output").html(data);
			}
			
		});
		
	})//html
	
	$("#btnXml").click(function(){
		$.ajax({
			url:"response_xml.xml",
			type:"get",
			dataType:"xml",
			error: function(xhr){
				alert(xhr.status+"/"+xhr.statusText);
			},
			success: function(data){
				var msg =$(data).find("msg").text();
				$("#output").html(msg);
			}
			
		})
		
	})//xml
	
	$("#btnJson").click(function(){
		$.ajax({
			
			url:"response_json.json",
			type:"get",
			dataType:"json",
			error: function(xhr){
				alert(xhr.status+"/"+xhr.statusText);
			},
			success: function(data){
				$("#output").html(  data.msg  );
			}
		
			
			
			
		})
		
		
	})//json
	
	$("#btnTxt2").click(function(){
		$.ajax({
			url:"response_text.jsp",
			type:"get",
			dataType:"text",
			error: function(xhr){
				alert(xhr.status+"/"+xhr.statusText);
			},
			success: function(data){
				$("#output").html( data );
			}//success
		})//ajax
		
	})//txt
	
	
	
	$("#btnHtml2").click(function(){
		$.ajax({
			url:"response_html.jsp",
			type:"get",
			dataType:"text",
			error: function(xhr){
				alert(xhr.status+"/"+xhr.statusText);
			},
			success: function(data){
				$("#output").html( data );
			}//success
		})//ajax
		
	})//txt
	
	
	$("#btnXml2").click(function(){
		
		$.ajax({
			url:"http://localhost/jsp_prj/day1030/response_xml.jsp",
			type:"get",
			dataType:"xml",
			error: function(xhr){
				alert(xhr.status)
			},
			success:function(data){
				$("#output").html(  $(data).find("msg").text() );
			}
		})
		
	})//xml
			
	
	
	
	$("#btnJson2").mouseover(function(){
		
		$.ajax({
			url:"response_json.jsp",
			type:"get",
			dataType:"json",
			error: function(xhr){
				alert(xhr.status)
			},
		success: function(data){
			$("#output").html(data.msg);
		}
			
			
		})//ajax
		
		
	})//xml
			
	
	
	
	
	
	
} );//ready
</script>

</head>


<body>
	<div id="output" style="height: 80px; border: 1px solid #333">
	
	</div>


	<div id="wrap">
	<input type="button" class="btn btn-primary" id="btnTxt" name="btnTxt" value="TEXT">
	<input type="button" class="btn btn-secondary" id="btnHtml" name="btnHtml" value="HTML">
	<input type="button" class="btn btn-success" id="btnXml" name="btnXml" value="XML">
	<input type="button" class="btn btn-danger" id="btnJson" name="btnJson" value="JSON">
	<br>
	<strong> JSP의 contentType속성</strong> <br>
	<input type="button" class="btn btn-primary" id="btnTxt2" name="btnTxt2" value="TEXT">
	<input type="button" class="btn btn-secondary" id="btnHtml2" name="btnHtml2" value="HTML">
	<input type="button" class="btn btn-success" id="btnXml2" name="btnXml2" value="XML">
	<input type="button" class="btn btn-danger" id="btnJson2" name="btnJson2" value="JSON">
	</div>

</body>
</html>