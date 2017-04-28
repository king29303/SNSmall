<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="wrap">

<div id="sub_img_member"></div>
<article>
<h1>회원정보 보기</h1>
 <%
 
/* 아이디 없을경우 제어 구간 */
String id=(String)session.getAttribute("id");

if (id==null){
	response.sendRedirect("./login.ve");
}
/* 아이디 없을경우 제어 구간 */


%>
<form action="./vendorUpdate.ve" id="vendor" method="post" name="fr">

<table>
<tr><td class="left"><label>아이디</label></td><td class="left"><%=id %></td></tr>
<tr><td class="left"><label>이름</label></td><td class="left"><%=mb.getName() %></td></tr>
<tr><td class="left"><label>회사명</label></td><td class="left"><%=mb.getAge() %></td></tr>
<tr><td class="left"><label>주소</label></td><td class="left"><%=gender %></td></tr>
<tr><td class="left"><label>연락처</label></td><td class="left"><%=mb.getEmail() %></td></tr>
</table>
<input type="hidden" name="pass" value="<%=mb.getPass()%>">
<input type="hidden" name="id" value="<%=id%>">



<table>

<%if(mb.getAddress()==null){%>
<tr><td class="left"><label>PostCode</label></td><td class="left"></td></tr>
<tr><td class="left"><label>Address</label></td><td class="left"></td><td class="left"></td></tr>
<%}else{%>
<tr><td class="left"><label>PostCode</label></td><td class="left"><%=mb.getPostcode() %></td></tr>
<tr><td class="left"><label>Address</label></td><td class="left"><%=mb.getAddress() %></td><td class="left"><%=mb.getAddress2() %></td></tr>
<%} %>

<%if(mb.getPhone()==null){%>
<tr><td class="left"><label>Phone Number</label></td><td class="left"></td></tr>
<%}else{%>
<tr><td class="left"><label>Phone Number</label></td><td class="left"><%=mb.getPhone() %></td></tr>
<%} %>

<%if(mb.getMobile()==null){%>
<tr><td class="left"><label>Mobile Phone Number</label></td><td class="left"></td></tr>
<%}else{%>
<tr><td class="left"><label>Mobile Phone Number</label></td><td class="left"><%=mb.getMobile() %></td></tr>
<%} %>

</table>
<div class="clear"></div>
<div id="buttons">
<input type="button" value="수정" class="submit" onclick = "fun1()">
<input type="button" value="확인" class="cancel" onclick = "loca()">

</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<%-- <jsp:include page="../inc/bottom.jsp"/> --%>
</div>
</body>
</html>