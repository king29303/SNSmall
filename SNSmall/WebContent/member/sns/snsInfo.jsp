<%@page import="java.util.StringTokenizer"%>
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
String id = (String)session.getAttribute("id"); 
String type= (String)session.getAttribute("type");

if(id==null){
	response.sendRedirect("./Login.ve");  
}

SnsBean sb = (SnsBean)request.getAttribute("sb");

//서브이미지 분해
String[] array;
String s = sb.getDetail_img();
array=s.split(",");

%>

<table>
<tr> <td>아이디</td><td><%=sb.getSns_id() %></td> </tr>
<tr> <td>이름</td><td><%=sb.getName() %></td> </tr>
<tr> <td>메인 프로필 사진</td><td> <img src="./SNSmall/member/sns/sns_pro_upload/<%=sb.getProfile_img()%>" width="200" height="100"> </td> </tr>
<tr> <td>자기소개</td><td><%=sb.getContent() %></td> </tr>
<tr> <td>sell 판매한돈?int형</td><td><%=sb.getSell() %></td> </tr>
<tr> <td>profit 수익</td><td><%=sb.getSns_profit() %></td> </tr>
<tr> <td>카테고리</td><td><%=sb.getCategory() %></td> </tr>
</table>
서브프로필사진
<table>

 <tr><td>
  <% for(int i=0; i<array.length;i++){%>
    <img src="./SNSmall/member/sns/sns_pro_upload/<%=array[i]%>"  width="100" height="100">
  <%} %>
 </td><tr>

</table>
<a href="./passConfirm.sn"><input type="button" value="회원정보수정"></a>
<a href="./Main.ve">main으로 이동</a>

</body>
</html>