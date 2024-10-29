<%@page import="kr.co.sist.chipher.DataEncryption"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%@page import="kr.co.sist.user.member.MemberDAO"%>
<%@page import="kr.co.sist.user.member.WebMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
    <% request.setCharacterEncoding("UTF-8");%>
    <%@ include file="../common/jsp/post_chk.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title</title>
<link rel="shorcut icon"
	href="http://192.168.10.225/jsp_prj/common/images/favicon.ico">

<link rel="stylesheet" type="text/css"
	href="http://192.168.10.225/jsp_prj/common/CSS/main_20240911.css">
	<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- bootstrap CDN 끝 -->
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	


<style type="text/css">
</style>

<script type="text/javascript">
$(function(){
	
} );//ready
</script>

</head>


<body>
<% 
String processFlag = (String)session.getAttribute("processFlag");

%>
	<div id="wrap">
	<div id="header">
	<c:import url="http://localhost/jsp_prj/common/jsp/header.jsp"/>
	</div>
	<jsp:useBean id="wmVO" class="kr.co.sist.user.member.WebMemberVO"></jsp:useBean>
	<jsp:setProperty property="*" name="wmVO"/>


	<%
	//접속자의 ip주소를 저장(부인방지용)
	wmVO.setIp(request.getRemoteAddr());
	if(wmVO.getSave()==null){
	wmVO.setSave("N");
	}//end if

	
	//입력된 회원정보를 DB에 추가하기.
	MemberDAO mDAO = MemberDAO.getInstance();
	try{
	 boolean flag= mDAO.selectID(wmVO.getId());
	 if(flag){
%>

<h2>아이디가 이미 사용중 입니다</h2>
 <strong> <c:out value="${param.id }"/> </strong> 이미 사용중 입니다
 <a href="javascript:history.back()">뒤로</a> <!-- 이렇게 하면 폼에 입력해놓은 값이 안지워짐. -->
<% 		 
	 }else{
		//저장할 데이터의 중요도에 따라서 일방향 Hash, 양방향 암호화 수행
		//비밀번호 : 일방향 Hash
		//비연결성의 문제(한정적인 자원의 사용문제)
		DataEncryption de = new DataEncryption("abcdef0123456789");
		wmVO.setPass(DataEncryption.messageDigest("SHA-1", wmVO.getPass()));
		
		//이름, 이메일 복호화 하기...양방향 암호화로 처리
		wmVO.setName(de.encrypt(wmVO.getName()));
		wmVO.setCellphone(de.encrypt(wmVO.getCellphone()));
		wmVO.setEmail(de.encrypt(wmVO.getEmail()));
		
		mDAO.insertWebMember(wmVO);
	
		
		
		%>
		<h2> ${param.name} 회원가입해 주셔서 감사합니다.</h2>
		<a href="login.jsp">로그인 페이지로</a>	
		<% 
	}//end else
	}catch(SQLException se){
		se.printStackTrace();
		%>
	회원가입중 문제가 발생했습니다. <br>
	잠시후 다시 시도해 주세요.	
	<a href="join_frm.jsp">메인화면으로 이동</a>	
	<%
	}//end catch
	%>
	
	
	
	
	
	</div>

</body>
</html>