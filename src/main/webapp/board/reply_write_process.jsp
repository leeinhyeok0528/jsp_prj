<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.ReplyDAO"%>
<%@page import="kr.co.sist.user.member.WebMemberVO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="netscape.javascript.JSObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rVO" class="kr.co.sist.user.board.ReplyVO" scope="page" />
<jsp:setProperty property="*" name="rVO" />
<%
JSONObject jsonObj = new JSONObject();
String method = request.getMethod();
jsonObj.put("result", !"GET".equals(method));//요청 방식에 따라 성공/실패를 체크함

if ("POST".equals(method)) {

	Object obj = session.getAttribute("userData");

	WebMemberVO wmVO = null;
	if (obj != null) {//로그인 돼있다면..
		wmVO = (WebMemberVO) obj;
	} //end if
	jsonObj.put("loginStatus", obj != null);//세션에 로그인 정보가 존재하는지 체크		

	if (wmVO != null) { 

		rVO.setIp(request.getRemoteAddr());
		rVO.setWriter(wmVO.getId());
		//DB추가 작업
		System.out.print(rVO);
		ReplyDAO rDAO = ReplyDAO.getInstance();

		try {
			rDAO.insertReplty(rVO);
			jsonObj.put("insertStatus", true);
		} catch (SQLException se) {
			se.printStackTrace();
			jsonObj.put("insertStatus", false);
		} //end catch

	} //end if
} //end if

out.print(jsonObj.toJSONString());
%>