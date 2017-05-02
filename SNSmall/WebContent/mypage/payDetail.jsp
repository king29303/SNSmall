<%@page import="web.product.db.ProductBean"%>
<%@page import="web.payment.db.PaymentBean"%>
<%@page import="web.client.db.ClientDAO"%>
<%@page import="web.client.db.ClientBean"%>
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
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%String id = "test";
PaymentBean pb = (PaymentBean)request.getAttribute("pb");
ProductBean prob = (ProductBean)request.getAttribute("prob");
ClientDAO cdao = new ClientDAO();
ClientBean cb = cdao.getMember(id);
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
            	<div>
            		<h2>주문 상세 정보</h2>
            		<table>
            			<tr><th>사진</th><th>이름</th><th>상품 정보</th><th>가격</th><th>주문일</th><th>배송 상태</th><th>주문 취소</th></tr>
            			<tr>
                 			<td><img src="./vendor_img/<%=prob.getMain_img() %>" style="width: 130px; height: 90px"></td>
                  			<td><%=prob.getSubject() %></td>
                  			<td><%=prob.getContent() %></td>
                  			<td><%=prob.getPrice() %></td>
                  			<td><%=pb.getDate() %></td>
                  			<td><%=pb.getState() %></td>
                  			<td><input type="button" onclick="location.href='PayCancle.pa?num=<%=pb.getNum() %>'" value="주문 취소"></td>
                  		</tr>
            		</table>
            	</div>
            	<div>
            		<h2>받는 사람 정보</h2>
            		<table>
            			<tr><th>수령인</th><td><%=cb.getName() %></td></tr>
            			<tr><th>연락처</th><td><%=cb.getPhone() %></td></tr>
            			<tr><th>주소</th><td><%=cb.getAddress() %></td></tr>
            			<tr><th>배송메시지</th><td><%=pb.getMessage() %></td></tr>
            		</table>
            	</div>
            </div>
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
</body>
</html>