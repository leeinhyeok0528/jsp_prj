<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="데이터 처리에 집중하깅"
    %>

<% 
//데이터 처리
String name = "똥완이";

List<String> list = new ArrayList<String>();
list.add("이게 자바");
list.add("오라클 DB");
list.add("HTML5 웹 프로그래밍");
list.add("JSP&Servlet 웹 프로그래밍");

//1.처리된 데이터를 뷰 페이지로 보내기위해 scope객체에 저장
request.setAttribute("name", name);
request.setAttribute("data", list);

//2. 이동할 페이지 설정하기
RequestDispatcher rd = request.getRequestDispatcher("forward_b.jsp");
//3.이동하깅~
rd.forward(request, response);
%>
