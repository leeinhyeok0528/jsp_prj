<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="이름이 중복되는 HTML Form Control 값 받기"
    %>
    <% //POST방식일 때 한글 처리
      	request.setCharacterEncoding("UTF-8");
      %>
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
.blue{color:#0000FF}
.red{color:red}
</style>

<script type="text/javascript">
$(function(){
	
} );//ready
</script>

</head>


<body>

	<div id="wrap">
	

	
	<% String method =request.getMethod();  
		String css = "blue";
		if("POST".equals(method)){
			css="red";
		}//end if
	%>
		<h2 >  <span class=" <%=css%>"> <%= method %>  </span> 방식의 요청</h2>
	
	<%
	//<input type="radio" 는 그룹으로 묶여서 하나의 값이 전달된다.=> request.getParameter로 처리
	String gender =request.getParameter("gender");
	//<input type="checkbonx" 는 그룹으로 묶이지만 여러개가 선택가능함.=> request.getParameterValues로 처리..배열.
	String[] hobby = request.getParameterValues("hobby");
	%>
	성별 : <%=gender %> <br>
	취미
	<ul>
	<% if(hobby==null){ %>
		<li>선택한 취미가 없습니다</li>
		
		<% }else{
			
			for(String selectHobby :hobby){
			%>
		
		<li> <%= selectHobby %>  </li>
		<% 
			}//end for
		
		
		}//end else %>
		
	</ul>
		
	</div>

</body>
</html>