<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="multipart/form-data인 경우 web parameter가 전달되지 않는다."
    %>
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
<%-- 	
	web parameter가 전달되지 않는다.
	이름:<%= request.getParameter("uploader") %> <br>
	EL: ${param.uploader} <br> --%>
요청방식:<%= request.getMethod() %> <br>

<%
//flag 받기
boolean uploadFlag = (boolean)session.getAttribute("uploadFlag");

if(! uploadFlag){
	



//1.업로드된 파일의 저장 디렉토리 얻기
File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");

//2. 최대 업로드 파일의 최대 크기 설정
int maxSize= 1024*1024*10; //설정한 크기도다 큰 파일이 업로드 되면 예외가 발생하는데 예외처리가 안됨
int uploadSize = 1024*1024*600; //큰 파일도 업로드는 가능하도록 설정한다.

//3. FileUpLoad Component를 생성함-생성과 동시에 업로드가 진행됨.

try{
MultipartRequest mr = new MultipartRequest(request,saveDir.getAbsolutePath(),
		uploadSize,"UTF-8",new DefaultFileRenamePolicy());
//웹 파라메터 받기 (reqeust가 아닌 MultiPartRequest 파일 컴포넌트를 잉요해 파라메터를 받는다.)
String uploader = mr.getParameter("uploader");
String[] extArr = mr.getParameterValues("ext");

//파일명 처리.
//원본파일명 받기
String originName = mr.getOriginalFileName("upfile");

//변경된 파일명 받기.
String fileSysName = mr.getFilesystemName("upfile");


//업로드된 파일이 최대 크기를 초과하는지 체크
File uploadFile = new File(saveDir.getAbsoluteFile()+"/"+fileSysName);
out.println(uploadFile);
if(uploadFile.length()>maxSize ){//내가 설정한 최대 크기보다 크다면. 그에대한 처리를 하기위한 코드
 uploadFile.delete();	//업로드된 파일 삭제
%>	
 <%=originName %> 은 10MByte( <%=maxSize %> byte)를 초과합니다. <br>
	업로드 파일의 크기내의 파일로 변환하여 업로드 해주세요 <br>
	<a href="javascript:history.back()">뒤로</a>





<% 
}else{
	%>
<h2>파일업로드 성공</h2>
<div>
업로더 : <%= uploader %> <br>
확장자 :  <%
	if(extArr ==null){
		out.print("확장자 선택 안함");
	}else{
		for(String temp : extArr){
			out.print(temp);
			out.print("&nbsp;");
		}//end for
	}//end else
	%>
<br>
원본 파일명 : <%=originName %> <br>
변경된 파일명 :  <%= fileSysName %> <br> 
<%-- <img  src="http://localhost/jsp_prj/upload/<%=fileSysName%>">--%>
</div>
<%
}//end else
}catch(Exception e){ //파일 크기가 컸을 때 예외처리
	e.printStackTrace();
	%>
파일 업로드 실패
<% 
}//end catch

session.setAttribute("uploadFlag", true);
}//end if
%>
 <a href="file_list.jsp">파일리스트 보기</a>


	
	
	
	
	</div>

</body>
</html>