<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Date date = new Date();
date.setDate(date.getDate()+1);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시mm분 까지");
%>
<table>
	<tr>
		<td>입금 은행</td>
  		<td>
  		<select name="selectbox">
			<option value="kb">국민은행</option>  
			<option value="nh">농협은행</option>  
			<option value="bs">부산은행</option>  
   		</select>
  		</td>
	</tr>
 	<tr>
 		<td>입금 기한</td><td><%=sdf.format(date) %></td>
 	<tr>
</table>
<div>
	 무통장입금 시 유의사항<br>
 	입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.<br>
	 무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.<br>
 	은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.<br>
</div>
<button>확인</button>
<button onclick="window.close()">취소</button>
</body>
</html>