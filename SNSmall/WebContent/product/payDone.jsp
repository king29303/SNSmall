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
<title>Insert title here</title>
<style>
#paydone_img{
    height: 176px;
    width: 100%;
    margin: auto;
    background-color: pink;
    margin-top: 50px;
}
#pay_bottom{
	text-align: center;
}
#pay_check{
	margin-bottom: 63px;
}
</style>
</head>
<body>
	<!-- <header id="navigation"> 
		<div class="navbar navbar-inverse navbar-fixed-top" role="banner"> 
			<div class="container"> 
				<div class="navbar-header"> 
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> 
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> 
					</button> 
					<a class="navbar-brand" href="index.html"><h1><img src="images/logo.png" alt="logo"></h1></a> 
				</div> 
				<div class="collapse navbar-collapse"> 
					<ul class="nav navbar-nav navbar-right"> 
						<li class="scroll active"><a href="#navigation">Home</a></li> 
						<li class="scroll"><a href="test.jsp">List</a></li> 
						<li class="scroll"><a href="#services">Services</a></li> 
						<li class="scroll"><a href="#our-team">Our Team</a></li> 
						<li class="scroll"><a href="#portfolio">Portfolio</a></li> 
						<li class="scroll"><a href="#clients">Clients</a></li> 
						<li class="scroll"><a href="#blog">Blog</a></li> 
						<li class="scroll"><a href="#contact">Contact</a></li> 
					</ul> 
				</div> 
			</div> 
		</div>/navbar 
	</header> /#navigation  -->
	<jsp:include page="../inc/header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="content">

<div id="paydone_img">결제가 완료되었습니다.</div>
<div id = "pay_check">
<div><h2>결제 정보 확인</h2></div>
<table border="1" style="width: 900px; margin: auto;">
 <tr><td rowspan="2" style="width: 150px;">주문번호<br>1234567</td><td>상품정보</td><td>가격</td></tr>
 <tr><td>완전 멋진 코트</td><td>100원</td></tr>
 <tr><td colspan="3" style="text-align: right;">총 결제 금액: 100원</td></tr>
</table>
</div>
</div>
<div id="pay_bottom">
<input type="button" value="구매목록">
<input type="button" value="확인">

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

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
  </div>
</body>
</html>