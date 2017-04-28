<%@page import="web.sns.db.SnsBean"%>
<%@page import="java.util.List"%>
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
</head>
<body>
<%
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
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">About Us
                    <small>It's Nice to Meet You!</small>
                </h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint, explicabo dolores ipsam aliquam inventore corrupti eveniet quisquam quod totam laudantium repudiandae obcaecati ea consectetur debitis velit facere nisi expedita vel?</p>
            </div>
        </div>
        <!-- Team Members Row -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Our Team</h2>
            </div>
            <% for(int i=0; i<list.size(); i++){
            	SnsBean sb = list.get(i);%>
            <div class="col-lg-4 col-sm-6 text-center">
            	<!-- http://placehold.it/200x200 -->
                <img class="img-circle img-responsive img-center" src="./sns_pro_upload/<%=sb.getProfile_img() %>" alt="">
                <h3><a href="SnsDetailAction.sn?sns_id=wndms4142"><%=sb.getName() %></a>
                    <small><%=sb.getCategory() %></small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <%}
			if(count!=0){
				int pageCount = (Integer)request.getAttribute("pageCount");
				int pageBlock = (Integer)request.getAttribute("pageBlock");
				int startPage = (Integer)request.getAttribute("startPage");
				int endPage = (Integer)request.getAttribute("endPage");
				if(endPage > pageCount){endPage=pageCount;}
				if(currentPage<=10){ %>
					[이전]
				<%}else{ %>
					<a href="snsList.sn?pageNum=<%=startPage-pageBlock %>">[이전]</a>&nbsp;
				<%}
				for(int i=startPage; i<=endPage; i++){
					if(i==currentPage){%>
						[<%=i %>]
					<%}else{%>
						<a href="snsList.sn?pageNum=<%=i %>">[<%=i %>]</a>&nbsp;
					<%}
				}%>
				<%if(endPage<pageCount){ %>
					[다음]
				<%}else{ %>
					<a href="snsList.sn?pageNum=<%=startPage+pageBlock %>">[다음]</a>&nbsp;
				<%}
			}//end if count%>
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