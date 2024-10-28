<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "JSP에서 class field로 코드를 생성"
    %>
    
 <%!
 //class field에 생성
 String name; //instance variable임. 
 %>   
 <%!
 public String getName(){
	 
	 
	 return name;
 }//getName
 %>
 
<%!
 
 /*
 라디오 버튼의 갯수, 라디오 버튼의 이름, checked할 radio 버튼
 */
 
 public String createRadioCheck(String type,int radioCnt, String radioName, int checkedNum){
	 
	 StringBuilder tempRadio = new StringBuilder();
	 
	 for(int j = 0; j < radioCnt + 1; j++){ 
	   
		tempRadio.append("<input type='").append(type).append("' name='").append(radioName)
		.append("' value='").append(j).append("'")
		.append(j == checkedNum ? " checked='checked'" : "").append("/>")
		.append(j).append("점 ");
	 }
	 
	 return tempRadio.toString();
 }
 
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
	 name = "테무에서 온 이일환";
	%>
	
	이름은 :   <%= getName() %> 입니다.
	
	
<div>

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
			
			<%= createRadioCheck("radio", 10, "score"+i, 10)%>
			
		</td>
	</tr>
	<% } %>
	</tbody>
</table>



</div>	
	
	<%= createRadioCheck("checkbox", 10, "test", 10) %>
	
	</div>
	
	
	</div>

</body>
</html>