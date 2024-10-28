<%@ page language="java" contentType="text/html; charset=UTF-8"
info="내부요청인지, 외부요청인지를 판단하는 일.."    pageEncoding="UTF-8"%>


<%  
request.setCharacterEncoding("UTF-8");
String movePage="kor.jsp";
String lang="한국어"; //기본으로 한국어 세팅 , web parameter로 전송해볼거야
//한글의 경우 web parameter 생성되면 전송될 때 한글이 깨진다...

if(!"localhost".equals(request.getServerName()) ){
	movePage="eng.jsp";
	lang="english";
	
}//end if
%>

<jsp:forward page="<%=movePage %>">
	<jsp:param value="<%=lang %>" name="lang"/>
</jsp:forward>>