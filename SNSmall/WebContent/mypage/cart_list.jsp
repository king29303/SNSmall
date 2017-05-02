<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="web.cart.db.CartDAO"%>
<%@page import="web.cart.db.CartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet"> 
<title>Insert title here</title>
<!-- 체크박스에 체크가 되어있으면 function에서 합쳐서 합가격 리턴  -->

<script type="text/javascript">
function myfunction(){
	var sum=0;
	var checklength = document.form1.check.length;
	for(i=0;i<checklength;i++){
		if(document.form1.check[i].checked){
			sum+=parseInt(document.form1.check[i].value);

		}
	}
	document.getElementById("price").innerText=sum;

}


</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%String id = "test";
%>
  <!-- Page Content -->
  <div class="container">
    <div class="more_content">
    <!-- Page Content -->
        <div class="row">
        
            <div class="col-md-3">
                <p class="lead"><%=id %></p>
                <jsp:include page="../inc/myinfo_left.jsp"/>
            </div>
            <div class="col-md-9">
<%
List<CartBean> cblist = new ArrayList<CartBean>();
%>
<form action="Pay.pa" method="post" name="form1">

<%
int sum=0;

List cl = (List)request.getAttribute("CartList"); 


String client_id ="";
String product_num ="";
String amount="";
String vendor_id ="";
String sns_id="";
String option1="";
String option2="";
String option3="";
for(int i=0;i<cl.size();i++){
	CartBean cb = (CartBean)cl.get(i);

	int price=cb.getPrice();
	
%>

<input type="checkbox" name="check" value="<%=cb.getPrice()%>" onchange="myfunction()" checked>

<!-- 장바구니 정보 -->
<a href="Detail2.pr">
물품 번호:<%=cb.getProduct_num() %>
이미지:<%=cb.getMain_img() %>
품명:<%=cb.getSubject()%>
<%if(cb.getOption1()!=null){
	%>/<%=cb.getOption1()%>
	
	<%}if(cb.getOption2()!=null){ %>
	/<%=cb.getOption2()%>
	<%}if(cb.getOption3()!=null){%>
		/<%=cb.getOption3() %><%
	}
%>

수량:<%=cb.getAmount() %>
가격:<%=cb.getPrice() %>
판매자 아이디 :<%=cb.getVendor_id() %>
구매자 아이디 :<%=cb.getClient_id()%>
</a>
<a href="./Cart_Delete.ca?product_num=<%=cb.getProduct_num()%>"><input type="button" name="delete" value="삭제"></a>
<br>
<!-- 정보 끝 -->

<%client_id += cb.getClient_id()+","; 
product_num += cb.getProduct_num()+","; 
amount += cb.getAmount()+","; 
vendor_id += cb.getVendor_id().toString()+","; 
if(cb.getSns_id()==null){
	sns_id=" ,";
}else{
	sns_id += cb.getSns_id()+","; 
}
option1	+= cb.getOption1()+","; 
option2 += cb.getOption2()+","; 
option3 += cb.getOption3()+","; 

%>

 <br>
<%sum = sum+price;} 
System.out.print(sns_id);
%>

<br>
총가격 :<span id="price"><%=sum %></span>
<input type="hidden" name = "client_id" value="<%=client_id%>">
<input type="hidden" name = "product_num" value="<%=product_num%>">
<input type="hidden" name = "amount" value="<%=amount%>">
<input type="hidden" name = "vendor_id" value="<%=vendor_id%>">
<input type="hidden" name = "sns_id" value="<%=sns_id%>">
<input type="hidden" name = "option1" value="<%=option1%>">
<input type="hidden" name = "option2" value="<%=option2%>">
<input type="hidden" name = "option3" value="<%=option3%>">
<%

//체크가 되어있으면 합하기 아니면 합하기 X
%>
 <br>
	<input type="submit" value="결제하기">
 </form>
</div>
</div>
</div>
</div>




</body>
</html>