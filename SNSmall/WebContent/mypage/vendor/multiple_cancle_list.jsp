<%@page import="web.vendor.db.VendorDAO"%>
<%@page import="web.product.db.ProductBean"%>
<%@page import="web.product.db.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="web.payment.db.PaymentBean"%>
<%@page import="web.payment.db.PaymentDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/inner.css" rel="stylesheet">
	<link href="css/header.css" rel="stylesheet">
<title>Insert title here</title>
<style>
#pay_bottom{
	text-align: center;
}
#pay_check{
	margin-bottom: 63px;
}
</style>
</head>
<body>
<%
String vendor_id="vendor";
String merchant_uid = request.getParameter("merchant_uid");
PaymentDAO pdao = new PaymentDAO();
VendorDAO vdao = new VendorDAO();
List<PaymentBean> pb_list = vdao.payDeleteList(vendor_id, merchant_uid);
int length = pb_list.size();
int price = 0;
%>
<jsp:include page="../../inc/header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="more_content">

<div id = "pay_check">
<div><h2>결제 정보 확인</h2></div>
<table border="1" style="width: 900px; margin: auto;">
<tr><td rowspan="<%=length+1 %>" style="width: 150px;">주문번호<br><%=merchant_uid%></td><td>상품정보</td><td>가격</td></tr>
<%
for(int i=0; i<length; i++){
PaymentBean pb = pb_list.get(i);
int product_num = pb.getProduct_num();
ProductDAO prodao = new ProductDAO();
ProductBean prob = prodao.getProduct(product_num);
price += prob.getPrice();
%>
 <tr><td><%=prob.getSubject() %></td><td><%=prob.getPrice() %></td></tr>
 <%} %>
 <tr><td colspan="3" style="text-align: right;">사용한 포인트: <%=pb_list.get(0).getUsedPoint() %></td></tr>
 <tr><td colspan="3" style="text-align: right;">총 결제 금액: <%=price-pb_list.get(0).getUsedPoint() %></td></tr>
</table>
</div>
</div>
<div id="pay_bottom">
<input type="button" value="주문 취소" onclick="location.href='MultipleCancleDone.ve?order_num=<%=merchant_uid%>'">
<input type="button" value="취소" onclick="history.back();">


	</div>
	        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>
         <!-- /.container -->

 </div>
</body>
</html>