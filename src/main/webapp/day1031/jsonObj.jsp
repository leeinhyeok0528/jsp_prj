<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
String subject = request.getParameter("subject");
Map<String,String> map = new HashMap();
map.put("java", "데스크탑에서 동작하는 프로그램 제작");
map.put("oracle", "대용량 데이터를 저장하고 관리");
map.put("jdbc", "자바에서 DataBase를 연동");
map.put("html", "web에서 구조를 담당하는 언어");
//1.JsonObject 생성
JSONObject jsonObj = new JSONObject();
//2.값 설정
String value="";
boolean searchFlag = map.containsKey(subject);
if(searchFlag){
	value=map.get(subject);
}//end if

jsonObj.put("searchFlag", searchFlag);
jsonObj.put("value",value);

out.print(jsonObj.toJSONString());

%>