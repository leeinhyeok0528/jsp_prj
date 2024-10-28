<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="out 내장객체의 사용"
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
	
	<% String msg =  "오늘은 목요일 입니다";
	out.print("<strong>"); //소스볼떄 줄 변경 X
	out.print(msg);
	out.println("</strong>");

	out.println("<strong>"); //소스볼 때 줄 변경 O
	out.println(msg);
	out.println("</strong>");
	
	for(int i = 1; i<7; i++){
		out.print("<h");
		out.print(i);
		out.print(">");
		out.print(msg);
		out.print("</h");
		out.print(i);
		out.println(">");
		
		
	}//end for
	
	String[] url={"http://google.com","http://naver.com","http://daum.net"};
	String[] urlText={"구글","네이버","다음"};
	StringBuilder linkTxt = new StringBuilder();
	
	//a태그를 이용해서 텍스트를 누르면 해당 링크로 이동하게 하기
	//out 태그 활용
	
	for(int i = 0; i<3; i++){
		out.print("<a href=' ");
		out.print(url[i]);
		out.print("'>");
		out.print(urlText[i]);
		out.println("</a>");
		
		linkTxt.append("<a href='").append(url[i]).append("'>").append(urlText[i])
		.append("</a>").append("\n<br>");
		
	}//end for
	out.println(linkTxt);
	
	
	
	%>
	</div>

</body>
</html>