<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
	
	
	<div>
	
	 <a href="upload_frm.jp"></a>
	<table class="table table-hover">
	
	<thead>
		<tr>
			<th style="width:80px ">번호</th>
			<th style="width:120px ">이미지</th>
			<th style="width:200px ">파일명</th>
			<th style="width:150px ">파일크기</th>
			<th style="width:200px ">업로드 일자</th>
		</tr>
	</thead>

	<tbody>
	<% 
	File loadDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload" );
	File[] listFile = loadDir.listFiles();
	pageContext.setAttribute("listFile", listFile);
	%>
	<c:choose>
	<c:when test="${empty listFile }">
	<tr>
	<td colspan="5">업로드된 파일이 없음</td>
	</tr>
	</c:when>
	<c:otherwise>
	<%
	int ind=0;
	String fileName="";
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-mm-dd EEEE HH:mm:ss");
	for(File tempFile:listFile){%> 
		<tr>
		<td> <%= ++ind %></td>
		<td> 
		
<%-- 		<img src="../upload/<%= tempFile.getName() %>" style="width:100px; height:50px;">
 --%>			 
		</td>
		<!-- 확장자가 jpg,gif,png,bmp,txt,js,css,html인 경우에는 링크를 설정하여
			웹 브라우저에서 보이도록 설정하기
			
		  -->
		<% fileName=tempFile.getName();
		String[] ext = {"jpg","gif","png","bmp","txt","js","css","html"};
		pageContext.setAttribute("ext",ext);
		
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		boolean tempFlag=false;
		
		for(String temp : ext){
			if(temp.equals(fileExt)){
				tempFlag=true;
				break;
			}//end if
		}//end for
		pageContext.setAttribute("tempFlag",tempFlag);

		
		%>
		<c:choose>
		<c:when test="${tempFlag}">
		 <td>  <%=fileName %>    (<a href="../upload/<%= fileName %>">  미리보기</a>  ) </td>
		 <td><%=tempFile.length() %></td>
    	 <td><%= sdf.format(new Date(tempFile.lastModified())) %></td>
		 
		</c:when>
		
		
		<c:otherwise>
			
		<td> <%=fileName %>  (<a href="download.jsp?fileName=<%= tempFile.getName() %>"><%=tempFile.getName() %> </a>  )</td>
		<td><%=tempFile.length() %></td>
		<td><%= sdf.format(new Date(tempFile.lastModified())) %></td>
		</c:otherwise>		
		
		</c:choose>
		</tr>
		
		<%}//end for%>
	</c:otherwise>
	</c:choose>
	
	
	</tbody>
	
	</table>
	
	</div>
	
	
	</div>

</body>
</html>