<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.ReplyDAO"%>
<%@page import="kr.co.sist.user.member.WebMemberVO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>



<jsp:useBean id="rVO" class="kr.co.sist.user.board.ReplyVO" scope="page" />
<jsp:setProperty property="*" name="rVO" />
<%
Object obj = session.getAttribute("userData");
int cnt = 0;
WebMemberVO wmVO = null;
 if (obj != null) {
	wmVO = (WebMemberVO)obj;

String num =request.getParameter("num");
String user =request.getParameter("user");
System.out.print(rVO+""+num+""+user);



	//로그인한 아이디와 입력된 아이디가 같은지 비교함.
	if (rVO.getWriter().equals(wmVO.getId())) {
		ReplyDAO rDAO = ReplyDAO.getInstance();
		try{
			cnt=rDAO.deleteReplty(rVO);
		}catch(SQLException se){
			se.printStackTrace();
		}//end catch
	} //end if
	
	
} //end if 
	JSONObject jsonObj = new JSONObject();
	jsonObj.put("cnt", cnt);
		out.print(jsonObj.toJSONString());
%>



