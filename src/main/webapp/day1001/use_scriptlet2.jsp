<%@page import="day1001.ImgVO"%>
<%@page import="java.util.List"%>
<%@page import="day1001.DataProcess"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="scriptlet과 expression의 연습."
    
    
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
	$("#btn").click(function(){
		var	year = $("#year").val();
		var month = $("#month").val();
		var day = $("#day").val();
		 
		 $("#output").html(year+"년"+month+"월"+day+"일");
	})//btn_click 
} );//ready


</script>

</head>

<body>

	<div id="wrap">
	
	<select name="year" id="year">
	<% int year = LocalDate.now().getYear(); //올해 2024년 얻음
	for(int i = year; i>1949; i--){    %>
	
	<option value="<%=i%>>"><%=i%></option>
		
	<% } %>
	
	</select>
	
<select name="month" id="month"> 
    <% 
        int month = java.time.LocalDate.now().getMonthValue(); // 현재 월 얻기
        for (int i = 1; i < 13; i++) { 
    %>
        <option value="<%=i %>" <%= (i==month) ? "selected" : "" %>><%=i %></option>
    <% } %>
</select>월

<select name="day" id="day">

<%  
Calendar calendar = Calendar.getInstance();
int lastDay = calendar.getActualMaximum(Calendar.DATE); //마지막 일 얻기 %>
<% for(int day = 1; day<lastDay;day++){ %>
<option value="<%=day %>"><%=day %></option>
<% } %>

</select>일
	
	<input type="button" value="날짜 얻기" class="btn btn-primary btn-sm" id="btn">
	<div id="output" style="height: 40px"></div>
	

	<div>
	<% for(int i = 1 ; i<7; i++){ %>
	<img  src="http://localhost/jsp_prj/day1001/images/dice_<%=i%>.png">
	<% }; %>
	</div>
	
	<% String[] names={"김지훈","김현우","이일환","이인혁","황찬욱"}; %>
	
	<div style="width: 800px">
	
	<table class="table table-hover">
	<thead>
	<tr> 
		<th style="width: 90px">이름</th>
		<th style="width: 700px">점수</th>
	</tr>  
	</thead>
	
	<tbody>
	<% for(int i = 0; i < names.length; i++){ %>
	<tr>
		<td><strong><%= names[i] %></strong></td>
		<td>
			<% for(int j = 0; j < 11; j++){ %>
				<input type="radio" name="score<%=i %>" value="<%=j%>" <%= (j == 0) ? "checked" : "" %>> <%= j %>
			<% } %>
		</td>
	</tr>
	<% } %>
	</tbody>
</table>

	</div>
	
	<%  
	//List에 저장된 이미지와 설명을 Card로 출력.
	DataProcess dp = new DataProcess();
	List<ImgVO> list = dp.searchData();

	if(list.isEmpty()){
	%>
 <marquee> 로딩된 이미지가 없습니다</marquee>
<% 	
	}//end if
	
	String info="";
	
		for(ImgVO iVO : list){
			info = iVO.getInfo();
	%>
	<div class="card" style="width: 18rem; float: left;">
  <img src="http://192.168.10.225/jsp_prj/day1001/images/<%= iVO.getImg() %>" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text"> <%= info.length()>50? info.substring(0,49)+",,,":""%> </p>
  </div>
</div>
<%} %>;

<%
/* //스크립틀렛에서는 method 작성불가
public void test(){
}
 */	%>	
	
	</div>

</body>
</html>