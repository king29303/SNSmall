<%@page import="web.sns.db.SnsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//★★★★★★★★★★★★★★★★★★★★★현재 작업중입니다★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
String id = (String)session.getAttribute("id"); 
//String type= (String)session.getAttribute("type");
if(id==null){
	response.sendRedirect("./Login.ve");  
}

SnsBean sb = (SnsBean)request.getAttribute("sb");
System.out.println(sb.getProfile_img());
%>

<h1>이미지게시판 글수정</h1>
<form action= "./UpdateAction.sn" method="post" name="fr" onsubmit="return check()" 
enctype="multipart/form-data" >

<table>
<tr> <td></td><td></td> </tr>
</table>
<input type="hidden" name="num" value="<%=num %>" > <%//숨겨진상태로 값이 넘겨짐%>
writer:<input type ="text" name="name" value="<%=ibb.getName()%>" readonly><br>
password:<input type ="password" name="pass"><br>
subject:<input type ="text" name="subject" value="<%=ibb.getSubject() %>"><br>
image file:<input type="file" name="file"><br>
<input type="hidden" name="file1" value="<%=ibb.getFile()%>">
content:<textarea rows="10" cols="20" name="content"><%=ibb.getContent() %></textarea><br> <%//textarea는 value값이없다! %>
<input type = "submit" value="글수정">
</form>

</body>
</html>