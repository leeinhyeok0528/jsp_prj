<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSTL변수의 사용" %>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <!-- 지시자를 선언함 -->
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
	<!-- 2. Tag Lib에서 제공하는 tag를 사용하면 된다.  -->
	<!-- 변수 선언 -->
	<c:set var="msg" value="오늘은 목요일 입니다."/>
	<c:set var="day" value="17"/>

	
	<h2>변수 출력</h2>
	
	${msg} <br>
	<c:out value="${msg }" />  <br>  <!-- EL을 써야 변수를 출력할 수 있다  -->
	<c:out value="msg" />  <br>
	<c:out value="${day }" />  <br>  <!-- EL을 써야 변수를 출력할 수 있다  -->
	<c:out value="${day+1 }" />  <br>  <!-- EL을 써야 변수를 출력할 수 있다  -->
	<!--  -->

	<h2>변수 삭제 후 출력해보기</h2>
	<!-- 삭제 후 변수를 출력하면 아무것도 출력되지 않는다.  -->
	<c:remove var="msg"/>
 msg:	<c:out value="${msg }"/> //지워서 출력되지 않음,,null인데 el은 null출력 XXX <br>
 day: <c:out value="${day }"/>


<c:set var="tag" value="오늘은<strong>목요일</strong>입니다"/> <br>
el : ${tag } <br>

c:out으로 출력 <c:out value="${tag }"/> <br>

c:out으로 출력 <c:out value="${tag}" escapeXml="false"/> //escape xml 설정 <br>



<c:set var="name" value="이인혁"/>
<!-- 체크박스를 만들고 value와 사용자에게 보여질 값을 이인혁으로 만들기 -->
<input type="checkbox" value="${name}"> <c:out value="${name}"/>








	
	
	</div>

</body>
</html>