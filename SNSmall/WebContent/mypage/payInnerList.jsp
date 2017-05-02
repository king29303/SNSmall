<%@page import="web.product.db.ProductBean"%>
<%@page import="web.product.db.ProductDAO"%>
<%@page import="web.payment.db.PaymentDAO"%>
<%@page import="web.payment.db.PaymentBean"%>
<%@page import="java.util.List"%>
<%@page import="web.client.db.ClientDAO"%>
<%@page import="web.client.db.ClientBean"%>
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
/* String order = request.getParameter("order");
System.out.println("check: "+order); */
String method = request.getParameter("method");
ClientDAO cdao = new ClientDAO();
PaymentDAO pdao = new PaymentDAO();
ProductDAO prodao = new ProductDAO();
//List<PaymentBean> pay_list = pdao.getPaymentById(id);
List<PaymentBean> pay_list = (List<PaymentBean>)request.getAttribute("pay_list");

%>
            <div class="col-md-9">
            <h2><%=method %></h2>
                	
                  <table id="mypay_table">
                  <tr><th>사진</th><th>이름</th><th>상품 정보</th><th>가격</th><th>주문일</th><th>배송 상태</th><th>주문 상세 조회</th><th>주문 번호</th></tr>
                  <%
                  for(int i=0; i<pay_list.size(); i++){
                	  PaymentBean pb = pay_list.get(i);
                  		ProductBean prob = prodao.getProduct(pb.getProduct_num()); %>
                  <tr>
                  <td><img src="./vendor_img/<%=prob.getMain_img() %>" style="width: 130px; height: 90px"></td>
                  <td><%=prob.getSubject() %></td>
                  <td><%=prob.getContent() %></td>
                  <td><%=prob.getPrice() %></td>
                  <td><%=pb.getDate() %></td>
                  <td><%=pb.getState() %></td>
                  <td><%=pb.getOrder_num() %></td>
                  <td><input type="button" onclick="location.href='PayDetail.pa?num=<%=pb.getNum() %>'" value="주문 상세 조회"></td>
                  </tr>
                  <%} %>
                  </table>
            </div> 
</body>
</html>