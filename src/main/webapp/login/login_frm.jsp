<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="http://192.168.10.225/jsp_prj/login/js/color-modes.js"></script>

		<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
    <meta charset="utf-8">
 
    <title>로그인</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="http://192.168.10.225/jsp_prj/login/css/bootstrap.min.css" rel="stylesheet" >

    
    <link href="http://192.168.10.225/jsp_prj/login/sign-in.css" rel="stylesheet">
    
    <script type="text/javascript">
    	window.onload=function(){
    		
    		document.getElementById("id").addEventListener("keyup",enterKey);
    		document.getElementById("pass").addEventListener("keyup",enterKey);
    		document.getElementById("btnLogin").addEventListener("click",chkNull);
  
    	}//onload
   	function enterKey(evt) {
			if(evt.which==13){
			chkNull();
				
			}//end if
					
		
			
    	}
    	
    
    function chkNull(){
		var obj = document.loginFrm;
		var idNode= obj.id;
		if(idNode.value.replaceAll(/ /g,"") ==""){ //정규식을 사용해 공백을 쳐내는것
			idNode.value="";
			idNode.focus();
			return;
		}//end if
		
		var passNode = obj.pass;
		if(passNode.value.replaceAll(/ /g,"") ==""){ 
			passNode.value="";
			passNode.focus();
			return;
		}//end if
		
		
		 $("#loginFrm").submit();
		
		
    }//chkNull
    	
    
    </script>
    
  </head>
  <body class="d-flex align-items-center py-4 bg-body-tertiary">
   
<main class="form-signin w-100 m-auto">
  <form name="loginFrm" id="loginFrm" action="login_frm_process.jsp" method="post">
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input type="email" class="form-control" name="id" id="id" placeholder="name@example.com">
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" name="pass" id="pass" placeholder="Password">
    </div>

 
    <input class="btn btn-primary w-100 py-2" type="button" value="로그인" id="btnLogin"/>
  </form>
</main>
<script src="http://192.168.10.225/html_prj/js0920/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
