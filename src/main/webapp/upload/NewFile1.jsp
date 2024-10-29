<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%  
Map<String,String> map =  System.getenv();
Set<String> keySet = map.keySet();
Iterator<String> ita = keySet.iterator();


String key="";
while(ita.hasNext()){
	key=ita.next();
	out.print(map.get(key));
	%> 
	키 명 : <%=key %> ,값 <%= map.get(key) %> <br/>
	<%
}//end if
%>