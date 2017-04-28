<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<script type="text/javascript">
	function result() {
		// join id텍스트 상자 value = 선택한 id값 joinIdCheck id텍스트 상자 value
		// opener는 지금 현재 창의 부모창 -> 즉 이 창을 불러온 페이지를 가리킴.
		opener.document.fr.id.value = document.wfr.userid.value;		
		// 창닫기
		window.close();
	}
</script>
</head>
<body>
	<!-- WebContent/member/joinIdCheck.jsp -->
	<%
		request.setCharacterEncoding("utf-8");
		// userid 파라미터 가져오기
		// String id = request.getParameter("userid");
		String id = (String)request.getAttribute("id");
		boolean check = (boolean)request.getAttribute("check");
		// check==1 중복아이디 있음 "사용중인 아이디 입니다."
		// check == 0 중복아이디 없음 "사용가능한 아이디 입니다." out.print로
		if (check) {//첫번째행에 데이터 있는 경우
			//아이디 있음
			out.print("사용가능한 아이디 입니다.");
		%>
		<input type="button" value="아이디선택" onclick="result()">
		<%
		} else {
			out.print("사용중인 아이디 입니다.");			
		}
 	%>
	<form action="./dupIdCheck.ve" method="post" name="wfr">
		<input type="text" name="userid" value="<%=id%>"> <input
			type="submit" value="중복확인">
	</form>

</body>
</html>