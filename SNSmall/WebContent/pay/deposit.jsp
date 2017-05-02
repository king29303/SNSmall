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
<%
String merchant_uid = request.getParameter("merchant_uid");
int point = Integer.parseInt(request.getParameter("point"));
String message =  request.getParameter("message");
String method = request.getParameter("method");
String price = request.getParameter("price"); 
%>
<script>
function deposit_pay(){
	amount_str = window.opener.fr.amount_str.value;
	product_str=window.opener.fr.product_str.value;
	vendorId_str=window.opener.fr.vendorId_str.value;
	snsId_str=window.opener.fr.snsId_str.value;
	option1_str=window.opener.fr.option1_str.value;
	option2_str=window.opener.fr.option2_str.value;
	option3_str=window.opener.fr.option3_str.value;
	
	location.href="PayDepositDoneAction.pa?message=<%=message%>&price=<%=price%>&point=<%=point%>&merchant_uid=<%=merchant_uid%>&method=<%=method%>"+"&amount_str="+amount_str+"&product_str="+product_str+"&vendorId_str="+vendorId_str+"&snsId_str="+snsId_str+"&option1_str="+option1_str+"&option2_str="+option2_str+"&option3_str="+option3_str;
	//window.close();
}
</script>
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
<button onclick="deposit_pay()">확인</button>
<button onclick="window.close()">취소</button>
</body>
</html>