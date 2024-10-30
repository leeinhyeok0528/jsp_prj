<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
<%
//1. JSONArray 에 들어갈 JSONObject 생성
JSONObject jsonObj = new JSONObject();
JSONObject jsonObj2 = new JSONObject();
JSONObject jsonObj3 = new JSONObject();

jsonObj.put("name","김지훈");
jsonObj.put("group","3");

jsonObj2.put("name","이인혁");
jsonObj2.put("group","3");

jsonObj3.put("name","김현우");
jsonObj3.put("group","2");


//이들을 저장할ㄹ JSONArray를 생성함
JSONArray jsonArr = new JSONArray();

//3. JSONArray에 JSONObject 할당함.
jsonArr.add(jsonObj);
jsonArr.add(jsonObj2);
jsonArr.add(jsonObj3);

//4. JSONArray값을 문자열로 얻기
String jsonStr = jsonArr.toJSONString();


%>

<%= jsonStr %>