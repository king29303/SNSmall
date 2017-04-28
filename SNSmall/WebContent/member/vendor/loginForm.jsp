<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<!-- 오른쪽 슬라이더 -->
<%-- <jsp:include page="../inc/right.jsp"/> --%>
<!-- 오른쪽 슬라이더 -->
<%-- <div id="wrap"><jsp:include page="../inc/snsbar.jsp"/> --%>
<%-- <jsp:include page="../inc/top.jsp"/> --%>
<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->

<!-- 본문내용 -->
<article>
<h1>Login</h1>
<form action="./loginAction.ve" id="join">
<fieldset>
	<legend>Login Info</legend>
	<label>User ID</label>
	<input type="text" name="id"><br>
	<label>Password</label>
	<input type="password" name="pass"><br>
</fieldset>

<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="button" value="Cancel" class="cancel" onclick="history.back()">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<%-- <jsp:include page="../inc/bottom.jsp"/> --%>
</div>
</body>
</html>