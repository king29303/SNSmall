<%@page import="web.qna.db.QnaBean"%>
<%@page import="java.util.List"%>
<%@page import="web.product.db.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/header.css" rel="stylesheet">
	<link href="css/inner.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
    $(".reviewbtn").click(function(){
        $("#writing").toggle();
    });
});

</script>

</head>
<body>
	<%
	String id = (String)session.getAttribute("id");
	if(id==null){response.sendRedirect("./login.cl");}
	
	String type =(String)session.getAttribute("type");
	String pageNum = (String)request.getAttribute("pageNum");
	ProductBean productbean = (ProductBean)request.getAttribute("productbean");
	String [] o1 = productbean.getOption1().split(",");
	String [] o2 = productbean.getOption2().split(",");
	String [] o3 = productbean.getOption3().split(",");
	int amount = productbean.getAmount();
	String content = productbean.getContent().replace("\r\n", "<br>");
	int peace = productbean.getAmount()-productbean.getCount();
	
	List qnaList = (List)request.getAttribute("qnaList");
// 	int count = ((Integer)request.getAttribute("count")).intValue();
// 	int pageCount = ((Integer)request.getAttribute("pageCount")).intValue();
// 	int pageBlock = ((Integer)request.getAttribute("pageBlock")).intValue();
// 	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
// 	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	%>
	<jsp:include page="../inc/header.jsp"/>
  <!-- Page Content -->
  <div class="container">
    <div class="content">
    <!-- Page Content -->

        <!-- Portfolio Item Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><%=productbean.getSubject() %>
                    <small><%=productbean.getCategory() %></small>
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Item Row -->
        <div class="row">

            <div class="col-md-8" >
            <%
            if(productbean.getMain_img()==null){
            	%>
            	<img class="img-responsive" src="http://placehold.it/750x500" alt="">
            	<%
            }else{
            %>
                <img class="img-responsive" src="./vendor_img/<%=productbean.getMain_img() %>" alt="">
                <%} %>
            </div>
			
			<form action="" method="post" name="gfr">
            <div class="col-md-4">
                <h3><%=productbean.getSubject() %></h3>
                <p><%=content %></p>
                <h3>Product Details</h3>
                 <select name="option1">
 					<option value=""><%=o1[0] %> 선택하세요</option>
 					<%for(int i=1; i<o1.length; i++){ %>
						<option value="<%=o1[i]%>"><%=o1[i] %></option>
					<%} %>
 				</select>
  				<br>
				<%if(o2 != null){ %>
				<select name="option2">
 					<option value=""><%=o2[0] %> 선택하세요</option>
 						<%for(int i=1; i<o2.length; i++){ %>
	 						<option value="<%=o2[i]%>"><%=o2[i] %></option>
 						<%} %>
 				</select>
 				<br>
				<%}else if(o3 != null){ %>
 				<select name="option3">
 					<option value=""><%=o3[0] %> 선택하세요</option>
 						<%for(int i=1; i<o2.length; i++){ %>
  							<option value="<%=o3[i]%>"><%=o3[i] %></option>
  						<%} %>
  				</select>
                 <br>
                 <%}%>
                 <script type="text/javascript">
                 function plus(){
                		if(document.gfr.payamount.value<<%=amount%>)
                		document.gfr.payamount.value++;
                	}
                	function minus(){
                		if(document.gfr.payamount.value>1){
                			document.gfr.payamount.value--;
                		}
                	}
                 </script>
				잔여수량<input type="text" name="amount" value="<%=peace%> / <%=productbean.getAmount()%>"><br>
				수량<input type="text" name="payamount" value="1">
				<button type="button" onclick="return plus()">+</button>
				<button type="button" onclick="return minus()">-</button><br>
				<input type="text" name="allprice" value="">
				
                <a class="btn btn-success" href="#">Into Cart</a>
                <a class="btn btn-success" href="#">Get it</a>
            </div>
			</form>
        </div>
        <!-- /.row -->

        <!-- Related Projects Row -->
        <div class="row">

            <div class="col-lg-12">
                <h3 class="page-header">Related Projects</h3>
            </div>

            <div class="col-sm-3 col-xs-6" id="product_img">
                <a href="#">
                <%if(productbean.getDetail_img()==null){ %>
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                    <%} else{%>
                    <img class="img-responsive portfolio-item" src="./vendor_img/<%=productbean.getDetail_img() %>" alt="">
                    <% }%>
                </a>
            </div>

        </div>
        <div class="well">
        	<%if(type!=null){ %>
				<%if(type.equals("client")){ %>
                    <div class="text-right">
                     	<div id="writing" style="margin-bottom: 14px; display: none;">
                    	 	<form action="./QnaInsertAction.qn?product_num=<%=productbean.getProduct_num() %>&pageNum=<%=pageNum%>" method="post" enctype="multipart/form-data">
                    	 		<input type="hidden" name="client_id" value="<%=id%>">
                    	 		<textarea rows="3" cols="120" name="content"></textarea><br>
                    	 		<input type="file" name="q_img"><br>
                    	 		<input type="submit" value="submit">
                    	 	</form>
                    	 </div>
                        <a class="btn btn-success reviewbtn">Leave a Review</a>
                    </div>
				<%} %>
			<%} %>
                    <hr>
					
					<%for(int i=0; i<qnaList.size(); i++){
						QnaBean qnabean = (QnaBean)qnaList.get(i);
						String qUrl = "./QnaPopular.qn?product_num="+productbean.getProduct_num()+"&pageNum="+pageNum+"&q_num="+qnabean.getQ_num();
					%>
                    <div class="row">
                        <div class="col-md-12">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star-empty"></span>
                            <%=qnabean.getClient_id() %> / <%=qnabean.getPopular() %>
                            <input type="button" value="++" onclick="location.href='<%=qUrl%>'">
                            <span class="pull-right"><%=qnabean.getDate() %></span>
                            <p><%=qnabean.getContent() %></p>
                            <%if(qnabean.getQ_img()!=null){ %>
                            	<p><img src="./qna_img/<%=qnabean.getQ_img()%>"></p>
                            <%} %>
                        </div>
                    </div>
					<%} %>
					
                    <hr>

                </div>
        <!-- /.row -->

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

    </div>
  </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>