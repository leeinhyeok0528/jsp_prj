<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>


<%
String name = request.getParameter("na");
String age = request.getParameter("age");
int tempAge = Integer.parseInt(age);

String interests = "";
int ageRange = 0;
if (tempAge >= 10 && tempAge < 20) {
	interests = "학업";
	ageRange = 10;
} else if (tempAge >= 19 && tempAge < 30) {
	interests = "취업";
	ageRange = 20;
} else if (tempAge >= 30 && tempAge < 40) {
	interests = "결혼";
	ageRange = 30;
} else if (tempAge >= 40 && tempAge < 50) {
	interests = "자녀교육,내집마련";
	ageRange = 40;
} else if (tempAge >= 50 && tempAge < 60) {
	interests = "건강";
	ageRange = 50;
}

JSONObject jsonObj = new JSONObject();
jsonObj.put("interests", interests);
jsonObj.put("msg", name + "님은"+ageRange+"대 입니다 관심사는" +interests+"입니다");
out.print(jsonObj.toJSONString());
%>