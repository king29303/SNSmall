<%@page import="web.sns.db.SnsBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/font-awesome.min.css" rel="stylesheet"> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$('.scroll').click(function(){
			//alert('hi');
			  //$('.active').removeClass('active');
			  $(this).addClass('active');  
			});
	}); 
	
	</script>
</head>
<body>
<%
String category = (String)request.getAttribute("category");
String order = (String)request.getAttribute("order");
String realfilePath = request.getRealPath("/sns_pro_upload");
String pageNum = (String)request.getAttribute("pageNum");
int count = (Integer)request.getAttribute("count");
int pageSize = (Integer)request.getAttribute("pageSize");
int currentPage=Integer.parseInt(pageNum);
int start = (Integer)request.getAttribute("start");
int end = (Integer)request.getAttribute("end");
List<SnsBean> list = (List<SnsBean>)request.getAttribute("list");
%>
<jsp:include page="../inc/header.jsp"/>
<!-- Page Content -->
<div class="container">
	<div class="content">
  		<!-- Introduction Row -->
        <div class="row" style="margin-top: 43px">
            <div class="col-lg-12">
                <h1 class="page-header">SNS STAR LIST
                    <small>It's Nice to Meet You!</small>
                </h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint, explicabo dolores ipsam aliquam inventore corrupti eveniet quisquam quod totam laudantium repudiandae obcaecati ea consectetur debitis velit facere nisi expedita vel?</p>
            </div>
        </div>
      

        <!-- Team Members Row -->
        <div class="row">
          <div id="order"><ul id="order_option"><li style="font-weight: bold;color: darkblue;">정렬방법</li>
          <li><a href="snsList.sn?category=<%=category %>&order=date">최신순</a></li>
          <li><a href="snsList.sn?category=<%=category %>&order=sell">판매량순</a></li>
          <li><a href="snsList.sn?category=<%=category %>&order=sns_profit">판매액순</a></li></ul></div>
           <!--  <div class="col-lg-12">
                <h2 class="page-header">SNS STAR LIST</h2>
            </div> -->
            <section id="our-team">
            <% for(int i=0; i<list.size(); i++){
            	SnsBean sb = list.get(i);%>
            <%-- <div class="col-lg-4 col-sm-6 text-center">
            	<!-- http://placehold.it/200x200 -->
                <img class="img-circle img-responsive img-center" src="./sns_pro_upload/<%=sb.getProfile_img() %>" alt="">
                <h3><a href="SnsDetailAction.sn?sns_id=wndms4142"><%=sb.getName() %></a>
                    <small><%=sb.getCategory() %></small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div> --%>
            
            <div class="col-sm-6 col-md-3">
								<div class="single-member">
									<div id="profile_img_wrap">
									<img src="./sns_pro_upload/<%=sb.getProfile_img() %>" alt="team member" />
									</div>
									<%-- <h4><a href="SnsDetailAction.sn?sns_id=wndms4142"><%=sb.getName() %></a></h4>
									<h5><%=sb.getCategory() %></h5> --%>
									<div id="star_list_detail">
									<h3><a href="SnsDetailAction.sn?sns_id=<%=sb.getSns_id()%>"><%=sb.getName() %></a>
                  					<small><%=sb.getCategory() %></small>
               						</h3>
									<p><%=sb.getContent() %></p>
									</div>
									<div class="socials">
										<a href="#"><i class="fa fa-facebook"></i></a>
										<a href="#"><i class="fa fa-twitter"></i></a>
										<a href="#"><i class="fa fa-google-plus"></i></a>
										<a href="#"><i class="fa fa-dribbble"></i></a>
										<a href="#"><i class="fa fa-linkedin"></i></a>
									</div>
								</div>
							</div>
							
            <%}%></section>
            <div class="clear"></div>
  <%--           <div id="paging"> <%
			if(count!=0){
				int pageCount = (Integer)request.getAttribute("pageCount");
				int pageBlock = (Integer)request.getAttribute("pageBlock");
				int startPage = (Integer)request.getAttribute("startPage");
				int endPage = (Integer)request.getAttribute("endPage");
				if(endPage > pageCount){endPage=pageCount;}
				if(currentPage<=10){ %>
					[이전]
				<%}else{ %>
					<a href="snsList.sn?category=<%=category %>&pageNum=<%=startPage-pageBlock %>">[이전]</a>&nbsp;
				<%}
				for(int i=startPage; i<=endPage; i++){
					if(i==currentPage){%>
						[<%=i %>]
					<%}else{%>
						<a href="snsList.sn?order=<%=order %>&category=<%=category %>&pageNum=<%=i %>">[<%=i %>]</a>&nbsp;
					<%}
				}%>
				<%if(endPage>=pageCount){ %>
					[다음]
				<%}else{ %>
					<a href="snsList.sn?order=<%=order %>&category=<%=category %>&pageNum=<%=startPage+pageBlock %>">[다음]</a>&nbsp;
				<%}
			}//end if count%>
			</div> --%>
			       <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                 <%
			if(count!=0){
				int pageCount = (Integer)request.getAttribute("pageCount");
				int pageBlock = (Integer)request.getAttribute("pageBlock");
				int startPage = (Integer)request.getAttribute("startPage");
				int endPage = (Integer)request.getAttribute("endPage");
				if(endPage > pageCount){endPage=pageCount;}
				if(currentPage<=10){ %>
                    <li>
                        <a>&laquo;</a>
                    </li>
                 <%}else{ %>
                 	<li>
                        <a href="snsList.sn?order=<%=order %>&category=<%=category %>&pageNum=<%=startPage-pageBlock %>">&laquo;</a>
                    </li>
                 <%}
				for(int i=startPage; i<=endPage; i++){
					if(i==currentPage){%>
                    <li class="active">
                        <a href="#"><%=i %></a>
                    </li>
                    <%}else{ %>
                    <li>
                        <a href="snsList.sn?order=<%=order %>&category=<%=category %>&pageNum=<%=i %>"><%=i %></a>
                    </li>
                    <%}} %>
                    <!-- <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
                    </li> -->
                    <%if(endPage>=pageCount){ %>
                    <li>
                        <a>&raquo;</a>
                    </li>
                    <%}else{ %>
                    <li>
                        <a href="snsList.sn?order=<%=order %>&category=<%=category %>&pageNum=<%=startPage+pageBlock %>">&raquo;</a>
                    </li>
                    <%}} %>
                </ul>
            </div>
        </div>
        </div>
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