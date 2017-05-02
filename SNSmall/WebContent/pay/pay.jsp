<%@page import="web.client.db.ClientDAO"%>
<%@page import="web.client.db.ClientBean"%>
<%@page import="java.util.List"%>
<%@page import="web.product.db.ProductDAO"%>
<%@page import="web.product.db.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta name="description" content="Creative One Page Parallax Template">
	<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
	<meta name="author" content=""> 
	<title>HIMU - OnePage HTML Parallax template</title> 
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<link href="./css/main.css" rel="stylesheet">
	<link href="./css/inner.css" rel="stylesheet">
	<link href="./css/header.css" rel="stylesheet">
<style>

#buyer, #product, #pay{
    width: 900px;
    margin: auto;
}
#policy{
    margin-top: 55px;
}
#policy1{
    border: 1px solid;
} 

</style>
<%
String id = "test";
String product_str = request.getParameter("product_num");
String amount_str = request.getParameter("amount"); //갯수
String vendorId_str = request.getParameter("vendor_id");
String option1_str = request.getParameter("option1");
String option2_str = request.getParameter("option2");
String option3_str = request.getParameter("option3");
String snsId_str = "wndms4142,wndms5555";
//request.setAttribute("id", id);
ClientBean cb = new ClientBean();
ClientDAO cdao = new ClientDAO();
cb = cdao.getMember(id);
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script>
var method;
var merchant_uid='high_' + new Date().getTime();
var price;
var point;
var message;
//결제 제어
function pay(){
	if($("input:checkbox[id='policyChecked1']").is(":checked")){
		if($("input:checkbox[id='policyChecked2']").is(":checked")){
			method = $(":input:radio[name=method]:checked").val();
			if(method == null) alert("결제수단을 결정해주세요");
			else if(method == 'card') card();
	 		else if(method == 'deposit') deposit();
	 		else if(method == 'kakao') card();
		 }else{alert("개인정보 제공에 동의해주세요");}
	}else{alert("결제수단에 동의해 주세요");}
}

//카드 결제
function card(){
	price = document.getElementById('price').innerText;
	point = document.getElementById('myPoint').innerText;
	message = document.getElementById('message').value;

	IMP.init('imp29540450');
	IMP.request_pay({
	    pg : 'danal_tpay', //아임포트 관리자에서 danal_tpay를 기본PG로 설정하신 경우는 생략 가능
	    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
	    merchant_uid : merchant_uid, //상점에서 관리하시는 고유 주문번호를 전달
	    name : '결제 진행중',
	    amount : price,
	    buyer_email : '<%=cb.getEmail()%>',
	    buyer_name : '<%=cb.getName()%>',
	    buyer_tel : '<%=cb.getPhone()%>', //누락되면 카드사 인증에 실패할 수 있으니 기입해주세요
	    buyer_addr : '<%=cb.getAddress()%>',
	   custom_data: {
		   price : price,
		   amount_str : '<%=amount_str%>',
		   product_str : '<%=product_str%>',
		   point : point,
		   vendorId_str : '<%=vendorId_str%>',
		   snsId_str : '<%=snsId_str%>',
		   message : message,
		   option1_str : '<%=option1_str%>',
		   option2_str : '<%=option2_str%>',
		   option3_str : '<%=option3_str%>',
		   method : method,
	   }
	}, function(rsp) {
	    if ( rsp.success ) {
	    	console.log(rsp);
	    	$.ajax({
	    		url: 'PayCompleteAction.pa',
	    		type: 'POST',
	    		data: {
	        		merchant_uid : rsp.merchant_uid,
	        		price : rsp.custom_data.price,
	        		amount_str : rsp.custom_data.amount_str,
	        		product_str : rsp.custom_data.product_str,
	        		point : rsp.custom_data.point,
	        		vendorId_str : rsp.custom_data.vendorId_str,
	        		snsId_str : rsp.custom_data.snsId_str,
	        		message : rsp.custom_data.message,
	        		option1_str : rsp.custom_data.option1_str,
	        		option2_str : rsp.custom_data.option2_str,
	        		option3_str : rsp.custom_data.option3_str,
	        		method : rsp.custom_data.method,
	    		},
	    		success : function(result, status){
	    			console.log(result);
	    			console.log(status);
	    			location.href="./PayDone.pa?merchant_uid="+rsp.merchant_uid;
	    		},
	    		error: function(xhr, status, error){
	    			console.log(xhr);
	    			console.log(status);
	    			console.log(error);
	    		}
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        alert(msg);
	    }
	});
}

//무통장 입금
function deposit(){
	price = document.getElementById('price').innerText;
	point = document.getElementById('myPoint').innerText;
	message = document.getElementById('message').value;
	window.open("Deposit.pa?price="+price+"&merchant_uid="+merchant_uid+"&point="+point+"&message="+message+"&method="+method, "Deposit" , "width=500,height=500");
}

//포인트 변경
function pointChanged(price, myPoint){
	point =  document.getElementById('usingPoint').value;
	if(myPoint-point>=0){
		document.getElementById('price').innerText = price-point;
		document.getElementById('myPoint').innerText = myPoint-point;
	}else{alert('포인트가 부족합니다.');}	
}
 

</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<!-- Page Content -->
<%
String[] amount = amount_str.split(",");
ProductDAO pdao = new ProductDAO();
List<ProductBean> product_list = pdao.getProduct(product_str);
int list_size = product_list.size(); 
int price=0;
%>
<form action="" name="fr">
<input type="hidden" name="amount_str" value=<%=amount_str %>>
<input type="hidden" name="product_str" value=<%=product_str %>>
<input type="hidden" name="vendorId_str" value=<%=vendorId_str %>>
<input type="hidden" name="snsId_str" value=<%=snsId_str %>>
<input type="hidden" name="option1_str" value=<%=option1_str %>>
<input type="hidden" name="option2_str" value=<%=option2_str %>>
<input type="hidden" name="option3_str" value=<%=option3_str %>>
</form>
<div class="container">
	<div class="content">
		<div id="title">
			<h1>주문/결제</h1>
			<hr>
  		</div>
	<div id="user_info">
  		<div id="title_in"><h2>구매자 정보</h2></div>
		<table id="buyer" border="1">
			<tr><td style="width: 150px;">이름</td><td>정선주</td></tr>
			<tr><td>배송주소</td><td>부산광역시 서면 아이티윌</td></tr>
			<tr><td>연락처</td><td>010-000-0000</td></tr>
			<tr><td>배송 요청 메세지</td><td><input type="text" id="message"></td></tr>
		</table>
	</div>
	<div id="product_info">
		<div id="title_in"><h2>상품 정보</h2></div>
		<table id="product" border="1">
			<tr><th rowspan="<%=list_size+1 %>"  style="width: 150px;">배송상품</th><th>배송상품 이름</th><th>수량</th><th>가격</th></tr>
 			<%for(int i=0; i<list_size; i++){ 
				ProductBean pb = (ProductBean)product_list.get(i);%>
 				<tr><td><%=pb.getSubject() %></td><td><%=amount[i] %></td><td><%=pb.getPrice()*Integer.parseInt(amount[i]) %></td></tr>
				<%price += pb.getPrice()*Integer.parseInt(amount[i]);} %>
		</table>
	</div>
	<div id="product_info">
		<div id="title_in"><h2>결제 정보</h2></div>
		<table id="pay" border="1">
			<tr><td style="width: 150px;">상품가격</td><td><%=price %></td></tr>
			<tr><td>포인트사용</td><td><input type="number" id="usingPoint"> <button onclick="pointChanged(<%=price%>,<%=cb.getPoint()%>)">적용</button><span style="float: right;" id="myPoint"><%=cb.getPoint() %></span></td></tr>
			<tr><td>총결제금액</td><td><span id="price"><%=price %></span></td></tr>
			<tr><td>결제방법</td>
				<td><input type="radio" value="card" name="method">신용카드
            		<input type="radio" value="deposit" name="method">무통장입금
            		<input type="radio" value="kakao" name="method">카카오페이</td>
			</tr>
		</table>
		<input type="checkbox" id="policyChecked1">선택한 결제수단으로 향후 결제 이용에 동의합니다. (선택)
	</div>
	<div id="policy">
		<div id="policy1">
		<p>
			 개인정보 제 3자 제공 동의
			회원의 개인정보는 당사의 개인정보취급방침에 따라 안전하게 보호됩니다.
			“회사”는 이용자들의 개인정보를 "개인정보 취급방침의 개인정보의 수집 및 이용목적"에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다.
			회사가 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 구매자 확인 및 해피콜 등 거래이행을 위하여 관련된 정보를 필요한 범위 내에서 거래 업체에게 제공합니다.
			상품명
			제공받는자	제공목적	제공정보	보유 및 이용기간
			워너비스톤 여성용 블루밍 쉘플라워 귀걸이, 골드
			워너비스톤	서비스 제공, 사은행사, 구매자확인, 해피콜	성명, 휴대전화번호(또는 안심번호), 배송지주소, 이메일
			※ 구매자와 수취인이 다를 경우에는 수취인의 정보(해외 배송 상품은 개인통관고유부호 또는 여권번호 포함)가 제공될 수 있습니다.	재화 또는 서비스의 제공이 완료된 즉시 파기 (단, 관계법령에 정해진 규정에 따라 법정기간 동안 보관)
			※ 동의 거부권 등에 대한 고지
			개인정보 제공은 서비스 이용을 위해 꼭 필요합니다. 개인정보 제공을 거부하실 수 있으나, 이 경우 서비스 이용이 제한될 수 있습니다.
		</p>
		</div>
		<div id="policy1_check"><input type="checkbox" id="policyChecked2">본인은 개인정보 제3자 제공 동의에 관한 내용을 모두 이해하였으며 이에 동의합니다.</div>
	</div>
	<div style="text-align: center; margin-top: 50px;">
		<input type="button" value="결제하기" onclick="pay()">
		<input type="button" value="취소하기">
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
<!-- /.container -->
</body>
</html>