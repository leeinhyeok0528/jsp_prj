<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="데이터 처리 결과를 받아와서 화면을 구현하여 응답되는 페이지"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title</title>
<link rel="shorcut icon"
    href="http://192.168.10.225/jsp_prj/common/images/favicon.ico">

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
    // 추가적인 JavaScript가 여기에 들어갈 수 있습니다.
});
</script>

</head>

<body>

<div id="wrap">

<%
    // 업무처리한 결과를 받아와서 화면을 구현하는 일
    String name = (String) request.getAttribute("name");
    List<String> list = (List<String>)request.getAttribute("data");

    //forward_b.jsp에서 forward_a.jsp의 parameter를 받을 수 있는 이유는
    //forward()의 매개변수가 request를 전달해 주기 때문이다.
    String paramSelectNum = request.getParameter("selectNum");
    int selectNum = paramSelectNum == null ? 0 : Integer.parseInt(paramSelectNum);
%>

<h3><%= name %></h3>
<ul class="nav nav-underline">
    <% for (int i = 0; i < list.size(); i++) { %>
    <li class="nav-item">
        <!-- selectNum 파라미터를 URL로 전달 -->
        <a class="nav-link <%= i == selectNum ? "active" : "" %>" aria-current="page" href="forward_a.jsp?selectNum=<%= i %>">
            <%= list.get(i) %>
        </a>
    </li>
    <% } %>
</ul>

</div>

</body>
</html>
