<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="el사용"
    isELIgnored="false"
	

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
</style>

<script type="text/javascript">
$(function(){
	
} );//ready
</script>

</head>


<body>

	<div id="wrap">
	<h2>scope 객체의 사용</h2>
	<% 
	String msg = "오늘은 목요일 입니다";
	
	%>
	<h3>EL에서는 변수에 직접 접근할 수 없다</h3>
	EL: ${sessionScope.msg } <br>
	expression : <%= msg %>   //scope에 저장 안하고 변수 바로찍으면 안나옴! <br>
	
	<%
	//1.el에서 사용하기 위해서 scope 객체에 저장함
	pageContext.setAttribute("msg", msg);
	//2.el에서 사용하면 된다~
	%>
	EL에서 scope객체의 사용 : <strong> ${pageScope.msg } </strong>   <br> 
	
	
	<% 
	pageContext.setAttribute("pMsg", "page 메시지");
	request.setAttribute("rMsg", "request 메시지");
	session.setAttribute("sMsg", "session 메시지");
	application.setAttribute("aMsg", "application 메시지");
	
	%>
	
	scope객체를 사용한 접근 <br>
	pageScope : ${pageScope.pMsg} (${pMsg})<br> 
	requsetScope : ${requestScope.rMsg} (${rMsg}) <br>
	sessionScope : ${sessionScope.sMsg}  (${sMsg})<br>
	applicationScope : ${applicationScope.aMsg} (${aMsg}) <br>
	 
	 
	 
	 <%
	 pageContext.setAttribute("test2", "page메시지");
	 request.setAttribute("test", "request메시지");
	 session.setAttribute("test", "session메시지");
	 application.setAttribute("test", "application메시지");
	 
	 %>
	 
	 scope객체에 같은 이름이 존재함 <br>
	<!-- scope객체를 생략하고 이름만 사용하면 가장 생명주기가 짧은 객체부터 사용함... -->
	
	pageScope : ${pageScope.test2} (${test})<br> 
	requsetScope : ${requestScope.test} (${test}) <br>
	sessionScope : ${sessionScope.test}  (${test})<br>
	applicationScope : ${applicationScope.test} (${test}) <br>
	 
	 
	 
	 
	
	
	
	</div>

</body>
</html>