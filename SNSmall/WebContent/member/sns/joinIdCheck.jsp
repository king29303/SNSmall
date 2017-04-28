
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function result(){
		opener.document.fr.sns_id.value = document.wfr.sns_id.value;
		window.close();
	}

</script>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");

String sns_id = (String)request.getAttribute("sns_id");
int check = Integer.parseInt(request.getAttribute("check").toString());


if(check==1){
	out.println("사용중인 아이디입니다");
}else{
	out.println("사용가능한 아이디입니다");
	%>
	<input type="button" value="아이디선택" onclick="result()">
	<%
}

%>
</body>
<form action="./IdCheckAction.sn" method="post" name="wfr" >
<input type="text" name="sns_id" value="<%=sns_id%>" >
<input type="submit" value="중복확인">
</form>
</html>