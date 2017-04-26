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
	<link href="./himu/css/bootstrap.min.css" rel="stylesheet">
	<link href="./himu/css/main.css" rel="stylesheet">
	<link href="./himu/css/inner.css" rel="stylesheet">
<title>Insert title here</title>
<style>

#buyer, #product, #pay{
    width: 900px;
    margin: auto;
}
#policy{
    margin-top: 55px;
}
#policy1, #policy2{
    border: 1px solid;
}
#footer{
    height: 100px;
    width: 971px;
    margin-right: auto;
    margin-left: auto;
    background-color: #969696;
    margin-top: 50px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script>
<%
String id = "test";
String product_str = "1,2,3";
String amount_str = "1,2,3"; //����
String vendor_id = "dolistar6";
String sns_id = "wndms4142";

ClientBean cb = new ClientBean();
ClientDAO cdao = new ClientDAO();
cb = cdao.getMember(id);
%>
function pay(){
	price = document.getElementById('price').innerText;
	point = document.getElementById('myPoint').innerText;
	message = document.getElementById('message').value;
	
	IMP.init('imp29540450');
	IMP.request_pay({
	    pg : 'danal_tpay', //������Ʈ �����ڿ��� danal_tpay�� �⺻PG�� �����Ͻ� ���� ���� ����
	    pay_method : 'card', //card(�ſ�ī��), trans(�ǽð�������ü), vbank(�������), phone(�޴����Ҿװ���)
	    merchant_uid : 'high_' + new Date().getTime(), //�������� �����Ͻô� ���� �ֹ���ȣ�� ����
	    name : '���� ������',
	    amount : price,
	    buyer_email : '<%=cb.getEmail()%>',
	    buyer_name : '<%=cb.getName()%>',
	    buyer_tel : '<%=cb.getPhone()%>', //�����Ǹ� ī��� ������ ������ �� ������ �������ּ���
	    buyer_addr : '<%=cb.getAddress()%>',
	    //buyer_postcode : '123-456'
	   custom_data: {
		   price : price,
		   amount_str : '<%=amount_str%>',
		   product_str : '<%=product_str%>',
		   point : point,
		   vendor_id : '<%=vendor_id%>',
		   sns_id : '<%=sns_id%>',
		   message : message,
	   }

	}, function(rsp) {
	    if ( rsp.success ) {
	    	console.log(rsp);
	    	$.ajax({
	    		url: 'PayCompleteAction.pa',
	    		type: 'POST',
	    		data: {
	        		merchant_uid: rsp.merchant_uid,
	        		price: rsp.custom_data.price,
	        		amount_str: rsp.custom_data.amount_str,
	        		product_str: rsp.custom_data.product_str,
	        		point: rsp.custom_data.point,
	        		vendor_id : rsp.custom_data.vendor_id,
	        		sns_id : rsp.custom_data.sns_id,
	        		message : rsp.custom_data.message,
	    		},
	    		success : function(result, status){
	    			console.log(result);
	    			console.log(status);
	    			//location.href="./Paydone.pa";
	    		},
	    		error: function(xhr, status, error){
	    			console.log(xhr);
	    			console.log(status);
	    			console.log(error);
	    		}
	    	});
	    } else {
	        var msg = '������ �����Ͽ����ϴ�.';
	        msg += '�������� : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
}

 function pointChanged(price, myPoint){
	point =  document.getElementById('usingPoint').value;
	if(myPoint-point>=0){
		document.getElementById('price').innerText = price-point;
		document.getElementById('myPoint').innerText = myPoint-point;
	}else{
		alert('����Ʈ�� �����մϴ�.');
	}	
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
<div class="container">
 <div class="content">
   <div id="title">
    <h1>�ֹ�/����</h1>
    <hr>
   </div>
  <div id="user_info">
   <div id="title_in"><h2>������ ����</h2></div>
   <table id="buyer" border="1">
    <tr><td style="width: 150px;">�̸�</td><td>������</td></tr>
    <tr><td>����ּ�</td><td>�λ걤���� ���� ����Ƽ��</td></tr>
    <tr><td>����ó</td><td>010-000-0000</td></tr>
    <tr><td>��� ��û �޼���</td><td><input type="text" id="message"></td></tr>
   </table>
  </div>

  <div id="product_info">
   <div id="title_in"><h2>��ǰ ����</h2></div>
   <table id="product" border="1">
    <tr><th rowspan="<%=list_size+1 %>"  style="width: 150px;">��ۻ�ǰ</th><th>��ۻ�ǰ �̸�</th><th>����</th><th>����</th></tr>
    <%for(int i=0; i<list_size; i++){ 
    ProductBean pb = (ProductBean)product_list.get(i);%>
    <tr><td><%=pb.getSubject() %></td><td><%=amount[i] %></td><td><%=pb.getPrice()*Integer.parseInt(amount[i]) %></td></tr>
    <%price += pb.getPrice()*Integer.parseInt(amount[i]);} %>
   </table>
  </div>

  <div id="product_info">
   <div id="title_in"><h2>���� ����</h2></div>
   <table id="pay" border="1">
    <tr><td style="width: 150px;">��ǰ����</td><td><%=price %></td></tr>
    <tr><td>����Ʈ���</td><td><input type="number" id="usingPoint"> <button onclick="pointChanged(<%=price%>,<%=cb.getPoint()%>)">����</button><span style="float: right;" id="myPoint"><%=cb.getPoint() %></span></td></tr>
    <tr><td>�Ѱ����ݾ�</td><td><span id="price"><%=price %></span></td></tr>
    <tr><td>�������</td>
        <td><input type="radio" value="card">�ſ�ī��
            <input type="radio" value="deposit">�������Ա�
            <input type="radio" value="kakao">īī������</td>
    </tr>
   </table>
   <input type="checkbox">������ ������������ ���� ���� �̿뿡 �����մϴ�. (����)
  </div>
  <div id="policy">
   <div id="policy1">
    <p>
 �������� �� 3�� ���� ����

ȸ���� ���������� ����� ����������޹�ħ�� ���� �����ϰ� ��ȣ�˴ϴ�.
��ȸ�硱�� �̿��ڵ��� ���������� "�������� ��޹�ħ�� ���������� ���� �� �̿����"���� ������ ���� ������ ����ϸ�, �̿����� ���� ���� ���̴� �� ������ �ʰ��Ͽ� �̿��ϰų� ��Ģ������ �̿����� ���������� �ܺο� �������� �ʽ��ϴ�.
ȸ�簡 �����ϴ� ���񽺸� ���Ͽ� �ֹ� �� ������ �̷���� ��� ������ Ȯ�� �� ������ �� �ŷ������� ���Ͽ� ���õ� ������ �ʿ��� ���� ������ �ŷ� ��ü���� �����մϴ�.
��ǰ��
�����޴���	��������	��������	���� �� �̿�Ⱓ
���ʺ��� ������ ���� ���ö�� �Ͱ���, ���
���ʺ���	���� ����, �������, ������Ȯ��, ������	����, �޴���ȭ��ȣ(�Ǵ� �Ƚɹ�ȣ), ������ּ�, �̸���
�� �����ڿ� �������� �ٸ� ��쿡�� �������� ����(�ؿ� ��� ��ǰ�� �������������ȣ �Ǵ� ���ǹ�ȣ ����)�� ������ �� �ֽ��ϴ�.	��ȭ �Ǵ� ������ ������ �Ϸ�� ��� �ı� (��, ������ɿ� ������ ������ ���� �����Ⱓ ���� ����)
�� ���� �źα� � ���� ����
�������� ������ ���� �̿��� ���� �� �ʿ��մϴ�. �������� ������ �ź��Ͻ� �� ������, �� ��� ���� �̿��� ���ѵ� �� �ֽ��ϴ�.
    </p>
   </div>
   <div id="policy1_check"><input type="checkbox">������ �������� ��3�� ���� ���ǿ� ���� ������ ��� �����Ͽ����� �̿� �����մϴ�.</div>
   <div id="policy2">
    <p>
 �������� �� 3�� ���� ����

ȸ���� ���������� ����� ����������޹�ħ�� ���� �����ϰ� ��ȣ�˴ϴ�.
��ȸ�硱�� �̿��ڵ��� ���������� "�������� ��޹�ħ�� ���������� ���� �� �̿����"���� ������ ���� ������ ����ϸ�, �̿����� ���� ���� ���̴� �� ������ �ʰ��Ͽ� �̿��ϰų� ��Ģ������ �̿����� ���������� �ܺο� �������� �ʽ��ϴ�.
ȸ�簡 �����ϴ� ���񽺸� ���Ͽ� �ֹ� �� ������ �̷���� ��� ������ Ȯ�� �� ������ �� �ŷ������� ���Ͽ� ���õ� ������ �ʿ��� ���� ������ �ŷ� ��ü���� �����մϴ�.
��ǰ��
�����޴���	��������	��������	���� �� �̿�Ⱓ
���ʺ��� ������ ���� ���ö�� �Ͱ���, ���
���ʺ���	���� ����, �������, ������Ȯ��, ������	����, �޴���ȭ��ȣ(�Ǵ� �Ƚɹ�ȣ), ������ּ�, �̸���
�� �����ڿ� �������� �ٸ� ��쿡�� �������� ����(�ؿ� ��� ��ǰ�� �������������ȣ �Ǵ� ���ǹ�ȣ ����)�� ������ �� �ֽ��ϴ�.	��ȭ �Ǵ� ������ ������ �Ϸ�� ��� �ı� (��, ������ɿ� ������ ������ ���� �����Ⱓ ���� ����)
�� ���� �źα� � ���� ����
�������� ������ ���� �̿��� ���� �� �ʿ��մϴ�. �������� ������ �ź��Ͻ� �� ������, �� ��� ���� �̿��� ���ѵ� �� �ֽ��ϴ�.
   </p>
   </div>
  <div id="policy2_check"><input type="checkbox">������ �������� ��3�� ���� ���ǿ� ���� ������ ��� �����Ͽ����� �̿� �����մϴ�.</div>
  </div>
  <div style="text-align: center; margin-top: 50px;">
  <input type="button" value="�����ϱ�" onclick="pay()">
  <input type="button" value="����ϱ�">
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
 <!-- /.row -->
 </footer>
<!-- /.container -->

</div>
</body>
</html>