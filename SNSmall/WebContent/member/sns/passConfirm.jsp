<%@page import="web.sns.db.SnsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function submitpassCheck(){
	if(document.fr.pass.value==""){
 		alert("비밀번호를 입력해 주세요");
 		document.fr.pass.focus();
 		return false;
 	}
	if(document.fr.pass.value!=comparePass){
		alert("비밀번호가 일치하지 않습니다");
		document.fr.pass.focus();
		return false;
	}
	
}
</script>

</head>
<body>
<form onsubmit="return submitpassCheck()" name="fr" action="./passComfirmAction.sn">
비밀번호 확인 : <input type="text" name="pass">
<input type="submit" value="비밀번호확인">
</form> 
</body>
</html>