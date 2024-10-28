<%@page import="javax.management.StringValueExp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="scope의 생성 및 사용 범위"
    
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
	<!-- 객체 생성 
	page- JSP페이지가 요청될 때 마다 객체가 생성됨..

	request- JSP페이지가 요청될 때 마다 객체가 생성됨. . 생성된 객체는 해당 JSP와 
	forward로 이동한 JSP에서 사용된다.
	
	session - 웹 브라우저마다 하나의 객체가 생성, 생성된 객체는 모든 JSP에서 사용도니다.
	
	application- 최초 접속자에 의해 단 하나의 객체가 생성, 생성된 객체는 모든 JSP에서 사용된다.
	모든 접속자는 하나의 객체를 사용하게 된다
	-->
	
	<jsp:useBean id="cVO" class="day1016.CounterVO" scope="application"/>
	<!-- setter 호출 -->
	<jsp:setProperty property="cnt" name="cVO" value="1"/>
	
	당신은 이 페이지에 <strong> <jsp:getProperty property="cnt" name="cVO"/>번 째 방문자 입니다 </strong>
	
	
	<a href="use_scope2.jsp">로 이동</a>
	<%
	String cnt = String.valueOf(cVO.getCnt());
	
	for(int i = 0; i<cnt.length(); i++){
	%>
	<img  src="images/num_<%= cnt.charAt(i) %>.png"/>
	<%} %>
	
	
	<%-- 
	<%
	RequestDispatcher rd = request.getRequestDispatcher("use_scope2.jsp");
	rd.forward(request, response);
	%>
	 --%>

	
	
	</div>

</body>
</html>