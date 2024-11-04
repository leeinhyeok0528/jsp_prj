<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.sist.user.board.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.ReplyDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>




<%
String paramRefNum = request.getParameter("ref_num");
int ref_num = 0;
if (paramRefNum != null) {
	ref_num = Integer.parseInt(paramRefNum);//null이 아닐때 수행
} //end if

//이후 검색해서 json을 만들면됨

JSONObject jsonObj = new JSONObject();

boolean resultFlag = false;
//DB작업을 수행하기위한 객체화
ReplyDAO rDAO = ReplyDAO.getInstance();
JSONArray jsonArr = new JSONArray();//배열객체 생성

//예외날리니깐 try

try {
	//댓글들의 리스트가 들어있으니 리스트로 처리
	//원글번호 refnum으로 처리
	List<ReplyVO> list = rDAO.selectReply(ref_num);
	resultFlag = true;
	JSONObject jsonTemp = null;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a HH:mm:ss");

	for (ReplyVO rVO : list) {
		jsonTemp = new JSONObject();
		jsonTemp.put("num", rVO.getNum());
		jsonTemp.put("content", rVO.getContent());
		jsonTemp.put("writer", rVO.getWriter());
		jsonTemp.put("ip", rVO.getIp());
		jsonTemp.put("input_date", sdf.format(rVO.getInput_date()));//날짜는 js가 잘못인지해서 sdf로 처리

		jsonArr.add(jsonTemp);//jsonarr에 값 할당
	} //end for
} catch (SQLException se) {
	se.printStackTrace();
} //end catch

//소스정리를 위해 jsonobj에 값 넣는 일 한번에 처리
jsonObj.put("resultFlag", resultFlag); //정상적으로 처리되면 true
jsonObj.put("data", jsonArr); //맞게 처리됐으면 댓글 목록들이 arr에 할당돼서 jsonobj에 할당
jsonObj.put("dataLength", jsonArr.size());

out.print(jsonObj.toJSONString());
System.out.println(jsonObj.toJSONString());
%>
