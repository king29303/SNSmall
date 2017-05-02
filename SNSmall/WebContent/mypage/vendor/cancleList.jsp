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
</head>
<body>
<jsp:include page="../../inc/header.jsp"/>
<%
String id = "vendor";
String pageNum = (String)request.getAttribute("pageNum");
int count = (Integer)request.getAttribute("count");
int pageSize = (Integer)request.getAttribute("pageSize");
int currentPage=Integer.parseInt(pageNum);
int start = (Integer)request.getAttribute("start");
int end = (Integer)request.getAttribute("end");
List<PaymentBean> cancle_list = (List<PaymentBean>)request.getAttribute("list");
ProductDAO prodao = new ProductDAO();
%>
<!-- Page Content -->
<div class="container">
	<div class="more_content">
    <!-- Page Content -->
        <div class="row">
            <div class="col-md-3">
                <p class="lead"><%=id %></p>
                <jsp:include page="../../inc/myinfo_left.jsp"/>
            </div>
            <div class="col-md-9">
            <h2>취소 목록</h2>
            	<%if(cancle_list == null){ %>
            		취소 상품이 없습니다.
            	<%}else{ %>
                  <table id="mypay_table">
                  <tr><th>사진</th><th>이름</th><th>상품 정보</th><th>주문번호</th><th>주문일</th><th>배송 상태</th></tr>
                  <%
                  for(int i=0; i<cancle_list.size(); i++){
                	  PaymentBean pb = cancle_list.get(i);
                  		ProductBean prob = prodao.getProduct(pb.getProduct_num()); %>
                  <tr>
                  <td><img src="./vendor_img/<%=prob.getMain_img() %>" style="width: 130px; height: 90px"></td>
                  <td><%=prob.getSubject() %></td>
                  <td><%=prob.getContent() %></td>
                  <td><%=pb.getOrder_num() %></td>
                  <td><%=prob.getDate() %></td>
                  <td><input type="button" value="취소 승인" onclick="location.href='PayCancle.ve?num=<%=pb.getNum()%>'"></td>
                  </tr>
                  <%} %>
                  </table>
                  <%} %>
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
</div>
    <!-- /.container -->
</body>
</html>