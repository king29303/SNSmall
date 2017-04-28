<%@page import="web.sns.db.SnsBean"%>
<%@page import="web.product.db.ProductBean"%>
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
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
//toggle
$(document).ready(function(){
	$(".btn-success").click(function(){
        $("#writing").toggle();
    });
});

//이미지 크게 띄우기
function view(img){
	var src = $(img).attr('src');
	$('#big_img').attr("src", src);
}

//slide
function plusSlides(n) {
	showSlides(n);
}

function showSlides(n) {
	slides = document.getElementsByClassName("mySlides");
	if(n==0) length = 4;
	else if(n==4) length = 8;
	for (i = n; i < length; i++) {
		slides[i].style.display = "block";
		if(i<4) {slides[4+i].style.display = "none";} 			
			if(i>=4){
				slides[7-i].style.display = "none";  
				slides[0].style.display = "none";  
			}		
	}	  
}
</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<%SnsBean sb= (SnsBean)request.getAttribute("sb");
String realfilePath = request.getRealPath("/vendor_img");
System.out.println(realfilePath);
%>
<!-- Page Content -->
<div class="container">
	<div class="content">
		<!-- Portfolio Item Heading -->
        <div class="row">
			<div class="col-lg-12">
                <h1 class="page-header">Portfolio Item
                    <small>Item Subheading</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
        <!-- Portfolio Item Row -->
        <div class="row">
            <div class="col-md-8">
                <img class="img-responsive" src="http://placehold.it/750x500" alt="">
            </div>
            <div class="col-md-4">              
                <h3>Project Details</h3>
                <ul>
                <%//ProductBean pb = (ProductBean)request.getAttribute("pb"); %>
                    <li>이름:<%=sb.getName()  %></li>
                    <li>Dolor Sit Amet</li>
                    <li>Consectetur</li>
                    <li>Adipiscing Elit</li>
                </ul>
                 <h3>Project Description</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p>
            </div>
		  <button onclick="location.href='http://localhost:8080/SNSmall/Pay.pa?num=1'">결제</button>
        </div>
        <!-- /.row -->
        <!-- Related Projects Row -->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">Related Projects</h3>
            </div>
            <div class="clear"></div>
            <div id="img_wrap">
            <div>
            	<a class="prev" onclick="plusSlides(0)">&#10094;</a>
            </div>
			<div id="img_list">
            	<div class="col-sm-3 col-xs-6 mySlides" >
             	   <a href="#">
             	       <img class="img-responsive portfolio-item" id="sns_imgs" src="./vendor_img/1.png" alt="" onclick="view(this)">
              	  </a>
          	  	</div>

          		<div class="col-sm-3 col-xs-6 mySlides">
             	   <a href="#">
              	      <img class="img-responsive portfolio-item" id="sns_imgs" src="./vendor_img/4.jpg" alt="" onclick="view(this)">
              	  </a>
          		</div>

           	    <div class="col-sm-3 col-xs-6 mySlides">
                	<a href="#">
                	    <img class="img-responsive portfolio-item" id="sns_imgs" src="./vendor_img/(S)02.jpg" alt="" onclick="view(this)">
              	  </a>
           	    </div>

           	    <div class="col-sm-3 col-xs-6 mySlides">
             	   <a href="#">
               	     <img class="img-responsive portfolio-item" id="sns_imgs" src="./vendor_img/6.jpg" alt="" onclick="view(this)">
               	 </a>
                </div>
                
                <div class="col-sm-3 col-xs-6 mySlides" style="display: none">
             	   <a href="#">
               	     <img class="img-responsive portfolio-item" id="sns_imgs" src="./vendor_img/51.jpg" alt="" onclick="view(this)">
               	 </a>
                </div>
                
                <div class="col-sm-3 col-xs-6 mySlides" style="display: none">
             	   <a href="#">
               	     <img class="img-responsive portfolio-item" id="sns_imgs" src="./vendor_img/apple.jpg" alt="" onclick="view(this)">
               	 </a>
                </div>
                
                <div class="col-sm-3 col-xs-6 mySlides" style="display: none">
             	   <a href="#">
               	     <img class="img-responsive portfolio-item" id="sns_imgs" src="./vendor_img/(S)04.jpg" alt="" onclick="view(this)">
               	 </a>
                </div>
                <div class="col-sm-3 col-xs-6 mySlides" style="display: none">
             	   <a href="#">
               	     <img class="img-responsive portfolio-item" id="sns_imgs" src="./vendor_img/(S)04.jpg" alt="" onclick="view(this)">
               	 </a>
                </div>
            </div>
				<div class="clear"></div>
                	<div>
            		<a class="next" onclick="plusSlides(4)">&#10095;</a>
           			 </div>
				</div>
		</div>
        <div id="detail">
        	<img src="" id="big_img">
        </div>
		<div class="well">
			<div class="text-right">
				<div id="writing">
					<textarea cols="150" rows="3"></textarea>
				</div>
				<a class="btn btn-success">Leave a Review</a>
             </div>
             <hr>
             <div class="row">
				<div class="col-md-12">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					Anonymous
					<span class="pull-right">10 days ago</span>
					<p>This product was great in terms of quality. I would definitely buy another!</p>
				</div>
			</div>
			 <hr>
             <div class="row">
				<div class="col-md-12">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					Anonymous
					<span class="pull-right">10 days ago</span>
					<p>This product was great in terms of quality. I would definitely buy another!</p>
				</div>
			</div>
			 <hr>
             <div class="row">
				<div class="col-md-12">
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star"></span>
					<span class="glyphicon glyphicon-star-empty"></span>
					Anonymous
					<span class="pull-right">10 days ago</span>
					<p>This product was great in terms of quality. I would definitely buy another!</p>
				</div>
			</div>
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
    <!-- content end -->
</div>
<!-- /.container -->
</body>
</html>