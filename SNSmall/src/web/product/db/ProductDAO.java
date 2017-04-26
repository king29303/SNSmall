package web.product.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ProductDAO {

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
	
	//getProduct()
		public List<ProductBean> getProduct(String num){
			ProductBean pb = null;
			List<ProductBean> list = new ArrayList<ProductBean>();
			try {
				con = getConnection();
				String[] number = num.split(",");
				//String number = num.substring(1, num.length()-1);
				//System.out.println(number);
				StringBuffer sql = new StringBuffer("select * from product where product_num IN(");
				
				for(int i=0; i<number.length; i++){
					if(i==number.length-1){
						sql.append("?");
					}else{
						sql.append("?,");
					}
				}
				sql.append(")");
				pstmt = con.prepareStatement(sql.toString());
				for(int i=0; i<number.length; i++){
					pstmt.setString(i+1, number[i]);
				}
				
				rs = pstmt.executeQuery();
				while(rs.next()){
					pb = new ProductBean();
					pb.setSubject(rs.getString("subject"));
					pb.setPrice(rs.getInt("price"));
					list.add(pb);
				}
			} catch (Exception e) {e.printStackTrace();}
			finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
			if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
			if(con != null){try {con.close();}catch(Exception ex) {}}}
			return list;
		}
	

}	//ProductDAO


























