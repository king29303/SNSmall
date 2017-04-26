package web.payment.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import web.client.db.ClientBean;

public class PaymentDAO {

Connection con = null;
	
	private Connection getConnection() throws Exception{

		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();
		return con;
	}	//getConnection()
	
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	
	
	//Payment insert
	public void insertPay(List<PaymentBean> list_pb){
		PaymentBean pb = null;
		int max = 0;
		try{
			con = getConnection();
			sql = "select max(num) from payment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				max = rs.getInt(1);
			}
			
			sql = "insert into payment(order_num, product_num, sns_id, vendor_id, client_id, amount, message, date, num) values(?,?,?,?,?,?,?,now(),?); ";
			pstmt = con.prepareStatement(sql);
			for(int i=0; i<list_pb.size(); i++){
				pb = (PaymentBean)list_pb.get(i);

				pstmt.setString(1, pb.getNum());
				pstmt.setInt(2, pb.getProduct_num());
				pstmt.setString(3, pb.getSns_id());
				pstmt.setString(4, pb.getVendor_id());
				pstmt.setString(5, pb.getClient_id());
				pstmt.setInt(6, pb.getAmount());
				pstmt.setString(7, pb.getMessage());
				pstmt.setInt(8, max+i+1);
				
				pstmt.executeUpdate();

			}		
				
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		

	}
	
	//포인트 변경
	public void subPoint(int point, String id){
		try{
			con = getConnection();
			sql = "update client set point=? where client_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, id);
			pstmt.executeUpdate();			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}	
	}
	
	//sns profit 변경
	public void addSnsProfit(int price, String sns_id){
		PaymentBean pb = null;
		try{
			con = getConnection();
			int profit = (int)(price*0.01);
			sql = "update sns set sns_profit=sns_profit+? where sns_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, profit);
			pstmt.setString(2, sns_id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}		
	}
	
	//sns profit 변경
		public void addVendorProfit(int price, String vendor_id){
			PaymentBean pb = null;
			try{
				con = getConnection();
				int profit = (int)(price*0.01);
				sql = "update vendor set vendor_profit=vendor_profit+? where vendor_id=? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, profit);
				pstmt.setString(2, vendor_id);
				pstmt.executeUpdate();
				
			} catch (Exception e) {e.printStackTrace();}
			finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
			if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
			if(con != null){try {con.close();}catch(Exception ex) {}}}		
		}
	
	//product amount변경
		public void subAmount(List<PaymentBean> list_pb){
			PaymentBean pb = null;
			try{
				con = getConnection();
				sql = "update product set amount=amount-?, count=count+1 where product_num=? ";
				pstmt = con.prepareStatement(sql);
				
				for(int i=0; i<list_pb.size(); i++){
					pb = list_pb.get(i);
					pstmt.setInt(1, pb.getAmount());
					pstmt.setInt(2, pb.getProduct_num());
					pstmt.executeUpdate();
				}
				
				
			} catch (Exception e) {e.printStackTrace();}
			finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
			if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
			if(con != null){try {con.close();}catch(Exception ex) {}}}			
		}
	
	
}
