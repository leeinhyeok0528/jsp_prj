<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   info="세션에 입력된 값을 지우는 페이지"
    %>
<%
//세션 값 삭제
session.removeAttribute("age");
session.removeAttribute("name");


session.invalidate();





response.sendRedirect("get_session.jsp");
%>