<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="HTML Form Control의 입력값을 받는 일"
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
	<% String method = request.getMethod(); %>
	<h2> <%= method %> 방식의 요청 </h2>

<%
//POST방식일때만 동작함, 입력 스트림의 모든 charset을 변환
request.setCharacterEncoding("UTF-8");//이때 getparameter 메소드 사용하기 이전에 작성해야함 , 무조건.


//이름이 유일한 web parameter 받기(request 내장객체를 활용하기)
//parameter_frm_process.jsp?text=&pass=&hid=%EC%88%A8%EA%B9%80%EA%B0%92&sel=%EC%9E%90%EB%B0%94&ta=
String text= request.getParameter("text");//input type=text인 값
String pass = request.getParameter("pass"); // password인 값
String chk = request.getParameter("chk"); // checkbox값
String hid=  request.getParameter("hid"); // hidden값
String sel=  request.getParameter("sel"); // <select>값
String ta=  request.getParameter("ta"); // <textarea>값
//업무로직,유효성검증 실시해야함.. 
//POST방식일 때 한글 변환 해주기

/*   잘 안쓰는 방식의 POST에서의 한글처리 방식이다..
if("POST".equals(method)){
	//String Class를 사용한 변환 (문자열을 byte[]로 쪼개서 인코딩 수행)
	text = new String(text.getBytes("8859_1"),"UTF-8" );	
	//URLEncoder, URLDecoder
	hid = URLDecoder.decode(URLEncoder.encode(hid,"8859_1"),"UTF-8");
}//end if
 */
 
 
 
 %>

<ul>
<li>입력값</li> 
<li>text: <%= text %></li> 
<li>password: <%= pass%></li> 
<li>chkeckbox: <%= chk%></li> 
<li>hidden: <%= hid %></li> 
<li>sel: <%= sel%></li> 
<li>ta: <%= ta%></li> 

</ul>
<input type="text" value="<%=text%>"> 

	</div>

</body>
</html>