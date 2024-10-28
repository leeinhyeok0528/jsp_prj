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
		<h2>parameter 받기.</h2>
		링크로 부르기, form control로 받기
		
		<form action="use_el2.jsp">
		
		
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="addr" placeholder="주소"><br>
		
		<label> 취미</label>		
			<input type="checkbox" name="hobby" value="등산">등산
			<input type="checkbox" name="hobby" value="낚시">낚시
			<input type="checkbox" name="hobby" value="독서">독서
			<input type="checkbox" name="hobby" value="운동">운동
			<br>
			<input type="submit" value="전송" class="btn btn-success">
		</form>
		<div>
		
		입력값 <br>
		이름: ${param.name eq''or param.name eq null?"이름을 입력해야한다":param.name } <br>
		주소: ${empty param.addr ? "주소입력": param.addr }  <br>
		취미: 
		<!-- 배열은 선택된 갯수만큼 반복시켜서 값을 받아야 한다. JSTL의 forEach와 함께 사용한다. -->
		${paramValues.hobby[0]}
		${paramValues.hobby[1]}
		${paramValues.hobby[2]}
		${paramValues.hobby[3]}
		</div>	
	
	<div>
<!-- nick이 없다면 아래 링크를 클릭해주세요 를 웹브라우저에 출력하고,
nick이 존재한다면 nick와 age를 웹브라우저에 출력 -->	
		${empty param.nick? "링크를 클릭해주세요": param.nick}	
		${empty param.nick? "링크를 클릭해주세요": param.age}	
	</div>
	
	<div>
	
	<!-- 요청 링크를 클릭했을 때 nick의 값으로 test를,age를 20으로 설정하여 현재 페이지로 요청하는 
	URL과 query string 작성하기-->
	
	<a href="http://localhost/jsp_prj/day1017/use_el2.jsp?nick=test&age=20">요청</a>
	
	</div>
	
	<%
	String msg="오늘은 목요일";
	int temp=0;
	%>
	${msg}
	${temp }
	
	
	</div>

</body>
</html>