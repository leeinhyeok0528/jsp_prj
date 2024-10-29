<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="application/octet-stream"
	pageEncoding="UTF-8" info="무조건 다운로드 시키기"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
//응답헤더 변경
String fileName = request.getParameter("fileName");

if(! "".equals(fileName)){
	//한글파일은 다운로드 설정이 되지 않으므로 인코딩을 해준다.
	fileName=URLEncoder.encode(URLDecoder.decode(fileName,"8859_1"),"UTF-8");
	
	
}//end if

//2.응답헤더 변경
response.setHeader("content-Disposition", "attchment;fileName="+fileName);

//3. 다운로드할 파일의 정보 얻기
fileName = URLDecoder.decode(fileName,"UTF-8");
File file = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload/"+fileName);
System.out.println(file+"/" +file.exists());


//4.다운로드할 파일에 읽기 스트림 연결하기.
FileInputStream fis = new FileInputStream(file);
//5.접속자에게 응답하기 위해 출력 스트림을 얻어야 함.
OutputStream os =   response.getOutputStream( );
System.out.print(os);
//6.읽어들인 파일의 내용을 출력스트림으로 출력
byte[] readData = new byte[512];
int readSize= 0;
while( (readSize=fis.read(readData)) != -1){
	os.write(readData,0,readSize);
}//end while
	os.flush();
//7출력스트림 초기화

//8응답헤더 초기화
out=pageContext.pushBody();
if(fis !=null){fis.close(); };

%>