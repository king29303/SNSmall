<%@page import="web.product.db.ProductBean"%>
<%@page import="web.product.db.ProductDAO"%>
<%@page import="web.payment.db.PaymentDAO"%>
<%@page import="web.payment.db.PaymentBean"%>
<%@page import="java.util.List"%>
<%@page import="web.client.db.ClientDAO"%>
<%@page import="web.client.db.ClientBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<style>
table,th,td {
  border : 1px solid black;
  border-collapse: collapse;
}
th,td {
  padding: 5px;
}
</style>
<script>
var method = "";
var page = 0;
showCustomer("payDone");
function showCustomer(str) {
	method = str;
	page = 6;
	//alert(page);
  var xhttp;    
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("txtHint").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "PayInnerList.pa?method="+str+"&page="+page, true);
  xhttp.send();
}

function more() {
	//alert(method);
	page += 2;
	//alert(page);
  var xhttp;    
  if (method == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("txtHint").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "PayInnerList.pa?method="+method+"&page="+page, true);
  xhttp.send();
}
</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%
String id = "test";
/* ClientDAO cdao = new ClientDAO();
ClientBean cb = cdao.getMember(id);
PaymentDAO pdao = new PaymentDAO();
ProductDAO prodao = new ProductDAO();
//List<PaymentBean> pay_list = pdao.getPaymentById(id);
List<PaymentBean> pay_list = (List<PaymentBean>)request.getAttribute("pay_list");
System.out.println(pay_list.size()); */
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
            <form action=""> 
<select name="order" onchange="showCustomer(this.value)">
<option value="">정렬방법을 선택하세요</option>
<option value="payDone">주문 내역</option>
<option value="waiting">입금 대기</option>
<option value="delivery">배송중</option>
<option value="done">배송완료</option>
<option value="cancle">주문취소</option>
</select>
</form>
<div id="txtHint"></div>
<div class="clear"></div>
<div style="text-align: center;"><button onclick="more()">더보기</button></div>
            <%-- <div class="col-md-9">
            <h2>배송중</h2>
                <div class="thumbnail">
                	
                  <table id="mypay_table">
                  <tr><th>사진</th><th>이름</th><th>상품 정보</th><th>가격</th><th>주문일</th><th>배송 상태</th></tr>
                  <%
                  for(int i=0; i<pay_list.size(); i++){
                	  PaymentBean pb = pay_list.get(i);
                  		ProductBean prob = prodao.getProduct(pb.getProduct_num()); %>
                  <tr>
                  <td><img src="./vendor_img/<%=prob.getMain_img() %>" style="width: 130px; height: 90px"></td>
                  <td><%=prob.getSubject() %></td>
                  <td><%=prob.getContent() %></td>
                  <td><%=prob.getPrice() %></td>
                  <td><%=prob.getDate() %></td>
                  <td>배송중</td>
                  </tr>
                  <%} %>
                  </table>
                </div>
            </div> --%>
            <%-- <div class="col-md-9">
            <h2>배송 완료</h2>
                <div class="thumbnail">
                	
                  <table id="mypay_table">
                  <tr><th>사진</th><th>이름</th><th>상품 정보</th><th>가격</th><th>주문일</th><th>배송 상태</th></tr>
                  <%
                  for(int i=0; i<pay_list.size(); i++){
                	  PaymentBean pb = pay_list.get(i);
                  		ProductBean prob = prodao.getProduct(pb.getProduct_num()); %>
                  <tr>
                  <td><img src="./vendor_img/<%=prob.getMain_img() %>" style="width: 130px; height: 90px"></td>
                  <td><%=prob.getSubject() %></td>
                  <td><%=prob.getContent() %></td>
                  <td><%=prob.getPrice() %></td>
                  <td><%=prob.getDate() %></td>
                  <td>배송중</td>
                  </tr>
                  <%} %>
                  </table>
                </div>
            </div> --%>
            </div>
        
    </div>
    <!-- /.container -->
    <div class="container">
        <hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>
    </div>
  </div>
    <!-- /.container -->
    <!-- jQuery -->
</body>
</html>