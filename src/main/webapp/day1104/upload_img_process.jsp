<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="업로드된 파일의 처리"%>
<%
//1. 업로드 저장 디렉토리 설정
File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");

//2. 최대파일크기 설정 이때 예외가 발생하긴 하는데 개발자가 예외처리로 처리할 수 없다
int fileSize = 1024*1024*600;  //600메가바이트로 설정했음.

//3. FileUpload Component 생성
MultipartRequest mr = new MultipartRequest(request,saveDir.getAbsolutePath(),fileSize,"UTF-8", new DefaultFileRenamePolicy());

//4. 파일명 받기
String fileSystemName = mr.getFilesystemName("profile");//여기에 매개변수는 사진으로 넘어오는 매개변수임

File readFile = new File(saveDir.getAbsolutePath()+fileSystemName); //이렇게 하면 파일명을 얻을 수 있음
//최대 파일크기 비교해야함

int maxSize = 1024*1024*10;
boolean uploadFlag = readFile.length()>maxSize;
if(uploadFlag){
	
readFile.delete();	


}//업로드한 사진이 내가 설정한것보다 더크다면 지우는 로직 처리




//5. 응답화면 작성하기
JSONObject jsonObj = new JSONObject();
jsonObj.put("uploadFlag", uploadFlag);
out.print(jsonObj.toJSONString());



%>
