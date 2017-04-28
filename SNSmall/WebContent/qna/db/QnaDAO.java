package web.qna.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class QnaDAO {

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
	
	//insertQna()
	public void insertQna(QnaBean qb){
		int q_num=1;
		
		try {
			con = getConnection();
			sql = "select max(q_num) from qna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){q_num = rs.getInt(1)+1;}
			
			sql = "insert into qna values(?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, q_num);
			pstmt.setString(2, qb.getClient_id());
			pstmt.setInt(3, qb.getProduct_num());
			pstmt.setString(4, qb.getContent());
			pstmt.setString(5, qb.getQ_img());
			pstmt.setInt(6, 0);
			pstmt.executeUpdate();
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();}catch(SQLException ex){}}
		if(pstmt != null){try {pstmt.close();}catch(SQLException ex){}}
		if(con != null){try {con.close();}catch(SQLException ex) {}}}
	}
	
	//getQnaCount()
	public int getQnaCount(){
		int count = 0;
		
		try {
			con = getConnection();
			sql = "select count(*) from qna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){count = rs.getInt(1);}
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();}catch(SQLException ex){}}
		if(pstmt != null){try {pstmt.close();}catch(SQLException ex){}}
		if(con != null){try {con.close();}catch(SQLException ex) {}}}
		
		return count;
	}

	//getQnaList()
	public List<QnaBean> getQnaList(int product_num){
		List<QnaBean> qnaList = new ArrayList<QnaBean>();
	
		try{
			
		con = getConnection();
		sql = "select * from qna where product_num=? order by q_num";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, product_num);
		//pstmt.setInt(1, startRow-1);
		//pstmt.setInt(2, pageSize);
		rs = pstmt.executeQuery();

		while(rs.next()){
			QnaBean qb = new QnaBean();
			qb.setQ_num(rs.getInt("q_num"));
			qb.setClient_id(rs.getString("client_id"));
			qb.setProduct_num(rs.getInt("product_num"));
			qb.setContent(rs.getString("content"));
			qb.setQ_img(rs.getString("q_img"));
			qb.setPopular(rs.getInt("popular"));
			qb.setDate(rs.getDate("date"));
			qnaList.add(qb);
		}
		
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();}catch(SQLException ex){}}
		if(pstmt != null){try {pstmt.close();}catch(SQLException ex){}}
		if(con != null){try {con.close();}catch(SQLException ex) {}}}
		
		return qnaList;
	}
	
	//updatePopular()
	public void updatePopular(int q_num){
		
		try {
			con = getConnection();
			sql = "update qna set popular=popular+1 where q_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, q_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();}catch(SQLException ex){}}
		if(pstmt != null){try {pstmt.close();}catch(SQLException ex){}}
		if(con != null){try {con.close();}catch(SQLException ex) {}}}
	}
	
	//deleteQna()
	public void deleteQna(int q_num){
		
		try {
			con = getConnection();
			sql = "delete from qna where q_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, q_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();}catch(SQLException ex){}}
		if(pstmt != null){try {pstmt.close();}catch(SQLException ex){}}
		if(con != null){try {con.close();}catch(SQLException ex) {}}}
	}
	
	
	//checkClientId()
	public int checkClientId(String client_id){
		int check = 0;
		
		try {
			con = getConnection();
			sql = "select client_id from payment where client_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, client_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){check = 1;}
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();}catch(SQLException ex){}}
		if(pstmt != null){try {pstmt.close();}catch(SQLException ex){}}
		if(con != null){try {con.close();}catch(SQLException ex) {}}}
		
		return check;
	}
	

	
}












