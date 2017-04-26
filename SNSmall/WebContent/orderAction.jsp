<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script>
/* $(document).ready(function(){
	IMP.init(imp29540450);
)}; */

function pay(){
	IMP.init('imp29540450');
	IMP.request_pay({
	    pg : 'danal_tpay', //������Ʈ �����ڿ��� danal_tpay�� �⺻PG�� �����Ͻ� ���� ���� ����
	    pay_method : 'card', //card(�ſ�ī��), trans(�ǽð�������ü), vbank(�������), phone(�޴����Ҿװ���)
	    merchant_uid : 'merchant_' + new Date().getTime(), //�������� �����Ͻô� ���� �ֹ���ȣ�� ����
	    name : '�ֹ���:�����׽�Ʈ',
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '�������̸�',
	    buyer_tel : '010-1234-5678', //�����Ǹ� ī��� ������ ������ �� ������ �������ּ���
	    buyer_addr : '����Ư���� ������ �Ｚ��',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
	    	$.ajax({
	    		url: '/Test/complete.jsp',
	    		type: 'POST',
	    		data: {
	        		imp_uid : rsp.imp_uid,
	        		merchant_uid: rsp.merchant_uid
	    		},
	    		success : function(result, status){
	    			console.log(result);
	    			console.log(status);
	    			location.href="done.jsp";
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
</script>
</head>
<body>
<button onclick="pay()">����</button>
</body>
</html>