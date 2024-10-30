<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="day1016.TestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
TestVO[] tVOArr = { new TestVO("이일환", 25), new TestVO("이인혁", 25), new TestVO("김현우", 26), new TestVO("김지훈", 25) };

//1.데이터와 부가적인 정보를 저장할 JSONObject 생성
JSONObject jsonObj = new JSONObject();
//2.부가적인 정보를 저장함. 얘들은 실질적인 데이터가 아니라 부가적인 정보임
jsonObj.put("dataLength", tVOArr.length);
jsonObj.put("searchFlag", tVOArr != null);
jsonObj.put("pubDate", new SimpleDateFormat("yyyy-mm-dd HH:mm:ss").format(new Date()));


//3.데이터를 저장할 jsonArray를 생성함 ,, 데이터를 저장할 목적임

JSONArray jsonArr = new JSONArray();

JSONObject jsonTemp=null;
for(TestVO tVO: tVOArr){
	//4.데이터를 저장할 JSONObject 생성
	jsonTemp= new JSONObject();

	//5. JSONObject 에 값 할당함
	jsonTemp.put("name", tVO.getName());
	jsonTemp.put("age", tVO.getMyAge());
	//6. jsonArray에 JSONObject 할당하기.
	jsonArr.add(jsonTemp);
	
}//end for

// JSONArray를 JSONObject 에 추가
jsonObj.put("data", jsonArr);


//문자열로 받기
out.print(jsonObj.toJSONString());

%>