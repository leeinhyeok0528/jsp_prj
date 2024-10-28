<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="입력된 값을 받아서 세션에 할당"
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
	<%
	//파라메터에 입력된 값을 받아와서 세션에 넣기.
	//cannot parse
	//number format exec.. null값을 파싱하여 변환할때 발생함,.
	// try/catch 로 잡거나 0 으로 널값일 때 설정..?
String name = request.getParameter("name"); // 이름 값 받기

String ageStr = request.getParameter("age"); // 나이 값 문자열로 받기
int age = 0;

if (ageStr != null && !ageStr.isEmpty()) {
    try {
        age = Integer.parseInt(ageStr); // 문자열을 정수로 변환
    } catch (NumberFormatException e) {
        age = 0; // 변환 실패시 기본값으로 0 설정
    }
}

session.setMaxInactiveInterval(60*60);
// 세션에 값 저장
session.setAttribute("age", age);
session.setAttribute("name", name);

	
	%>
	세션에 설정된 값 <a href="get_session.jsp">읽기</a>
	
	</div>

</body>
</html>