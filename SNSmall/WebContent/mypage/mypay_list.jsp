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
	var xhttp;    
	if (str == ""){
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
	page += 2;
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