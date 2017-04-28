package web.product.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import web.client.db.ClientBean;

public class ProductDAO {

	Connection con = null;

	private Connection getConnection() throws Exception {

		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();
		return con;
	} // getConnection()

	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;

	// getProduct()
	public List<ProductBean> getProduct(String num) {
		ProductBean pb = null;
		List<ProductBean> list = new ArrayList<ProductBean>();
		try {
			con = getConnection();
			String[] number = num.split(",");
			StringBuffer sql = new StringBuffer("select * from product where product_num IN(");

			for (int i = 0; i < number.length; i++) {
				if (i == number.length - 1) {
					sql.append("?");
				} else {
					sql.append("?,");
				}
			}
			sql.append(")");
			pstmt = con.prepareStatement(sql.toString());
			for (int i = 0; i < number.length; i++) {
				pstmt.setString(i + 1, number[i]);
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				pb = new ProductBean();
				pb = new ProductBean();
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setCategory(rs.getString("category"));
				pb.setSubject(rs.getString("subject"));
				pb.setContent(rs.getString("content"));
				pb.setMain_img(rs.getString("main_img"));
				pb.setDetail_img(rs.getString("detail_img"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setPrice(rs.getInt("price"));
				pb.setAmount(rs.getInt("amount"));
				pb.setCount(rs.getInt("count"));
				list.add(pb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception ex) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception ex) {
				}
			}
		}
		return list;
	}

	// getProduct()
	public ProductBean getProduct(int num) {
		ProductBean pb = null;
		try{
			con = getConnection();
			sql = "select * from product where product_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				pb = new ProductBean();
				pb.setProduct_num(num);
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setCategory(rs.getString("category"));
				pb.setSubject(rs.getString("subject"));
				pb.setContent(rs.getString("content"));
				pb.setMain_img(rs.getString("main_img"));
				pb.setDetail_img(rs.getString("detail_img"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setPrice(rs.getInt("price"));
				pb.setAmount(rs.getInt("amount"));
				pb.setCount(rs.getInt("count"));
				pb.setDate(rs.getDate("date"));
			}
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
		
		return pb;
	}
	
	public void insertProduct(ProductBean prb){ // 등록상품정보 DB 삽입
		ResultSet rs = null;
		int product_num = 0;
		Connection con = null;
		try{
			
			con = getConnection();
			sql = "select max(product_num) from product";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) product_num = rs.getInt(1)+1;
			sql = "insert into product(product_num,vendor_id,category,subject,content,"
					+ "main_img,detail_img,option1,option2,option3,price,amount,count,date) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			pstmt.setString(2, prb.getVendor_id());
			pstmt.setString(3, prb.getCategory());
			pstmt.setString(4, prb.getSubject());
			pstmt.setString(5, prb.getContent());
			pstmt.setString(6, prb.getMain_img());
			pstmt.setString(7, prb.getDetail_img());
			pstmt.setString(8, prb.getOption1());
			pstmt.setString(9, prb.getOption2());
			pstmt.setString(10, prb.getOption3());
			pstmt.setInt(11, prb.getPrice());
			pstmt.setInt(12, prb.getAmount());
			pstmt.setInt(13, 0);
			pstmt.executeUpdate();
			 
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
	}// insertProduct() end
	
	public int getProductCount(String id){ // 등록 상품 갯수 구하기
		ResultSet rs = null;
		int count = 0;
		Connection con = null;
		try{			
			con = getConnection();
			sql = "select count(*) from product where vendor_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) count = rs.getInt(1);
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		return count;
	}// getProductCount() end
	
	//등록상품 리스트 불러오기
	public List<ProductBean> getProductList(String id, int startRow, int pageSize){
		ResultSet rs = null;
		List<ProductBean> productList = new ArrayList<ProductBean>();
		Connection con = null;
		try{
			
			//1,2디비연결 메서드호출
			con = getConnection();
			//num 게시판 글번호 구하기
			//sql 함수 최대값 구하기 max()
			sql = "select * from product where vendor_id=? order by product_num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ProductBean prb = new ProductBean();
				prb.setProduct_num(rs.getInt(1));
				prb.setVendor_id(rs.getString(2));
				prb.setCategory(rs.getString(3));
				prb.setSubject(rs.getString(4));
				prb.setContent(rs.getString(5));
				prb.setMain_img(rs.getString(6));
				prb.setDetail_img(rs.getString(7));
				prb.setOption1(rs.getString(8));
				prb.setOption2(rs.getString(9));
				prb.setOption3(rs.getString(10));
				prb.setPrice(rs.getInt(11));
				prb.setAmount(rs.getInt(12));				
				prb.setCount(rs.getInt(12));
				prb.setDate(rs.getDate(14));
				productList.add(prb);
			}

		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		return productList;
	} //getProductList() end 
	// 상품 정보 수정(이미지 파일 수정 X)
	public void updateProduct(ProductBean prb){
		ResultSet rs = null;
		Connection con = null;
		try{
			
			con = getConnection();
			sql = "update product set category=?,subject=?,content=?,"
					+ "option1=?,option2=?,option3=?,price=?,amount=? where product_num=?";					
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prb.getCategory());
			pstmt.setString(2, prb.getSubject());
			pstmt.setString(3, prb.getContent());
			pstmt.setString(4, prb.getOption1());
			pstmt.setString(5, prb.getOption2());
			pstmt.setString(6, prb.getOption3());
			pstmt.setInt(7, prb.getPrice());
			pstmt.setInt(8, prb.getAmount());
			pstmt.setInt(9, prb.getProduct_num());
			//4. 실행
			pstmt.executeUpdate();
			 
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
	}// updateProduct() end
	
	// 상품 정보 수정(메인 이미지만 수정)
	public void updateProduct1(ProductBean prb){
		ResultSet rs = null;
		Connection con = null;
		try{
			
			con = getConnection();
			sql = "update product set category=?,subject=?,content=?,"
					+ "main_img=?,option1=?,option2=?,option3=?,price=?,amount=? where product_num=?";					
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prb.getCategory());
			pstmt.setString(2, prb.getSubject());
			pstmt.setString(3, prb.getContent());
			pstmt.setString(4, prb.getMain_img());
			pstmt.setString(5, prb.getOption1());
			pstmt.setString(6, prb.getOption2());
			pstmt.setString(7, prb.getOption3());
			pstmt.setInt(8, prb.getPrice());
			pstmt.setInt(9, prb.getAmount());
			pstmt.setInt(10, prb.getProduct_num());
			//4. 실행
			pstmt.executeUpdate();
			 
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
	}// updateProduct1() end
	
	
	// 상품 정보 수정(상세이미지 파일만 수정)
	public void updateProduct2(ProductBean prb){
		ResultSet rs = null;
		Connection con = null;
		try{
			
			con = getConnection();
			sql = "update product set category=?,subject=?,content=?,"
					+ "detail_img=?,option1=?,option2=?,option3=?,price=?,amount=? where product_num=?";					
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prb.getCategory());
			pstmt.setString(2, prb.getSubject());
			pstmt.setString(3, prb.getContent());
			pstmt.setString(4, prb.getDetail_img());
			pstmt.setString(5, prb.getOption1());
			pstmt.setString(6, prb.getOption2());
			pstmt.setString(7, prb.getOption3());
			pstmt.setInt(8, prb.getPrice());
			pstmt.setInt(9, prb.getAmount());
			pstmt.setInt(10, prb.getProduct_num());
			//4. 실행
			pstmt.executeUpdate();
			 
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
	}// updateProduct2() end
	
	// 상품 정보 수정(모든 정보 수정)
	public void updateProduct3(ProductBean prb){
		ResultSet rs = null;
		Connection con = null;
		try{
			
			con = getConnection();
			sql = "update product set category=?,subject=?,content=?,"
					+ "main_img=?,detail_img=?,option1=?,option2=?,option3=?,price=?,amount=? where product_num=?";					
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prb.getCategory());
			pstmt.setString(2, prb.getSubject());
			pstmt.setString(3, prb.getContent());
			pstmt.setString(4, prb.getMain_img());
			pstmt.setString(5, prb.getDetail_img());
			pstmt.setString(6, prb.getOption1());
			pstmt.setString(7, prb.getOption2());
			pstmt.setString(8, prb.getOption3());
			pstmt.setInt(9, prb.getPrice());
			pstmt.setInt(10, prb.getAmount());
			pstmt.setInt(11, prb.getProduct_num());
			//4. 실행
			pstmt.executeUpdate();
			 
			
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
		
	}// updateProduct3() end
	
	
	// 등록 상품 삭제
	public void deleteProduct(int product_num){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql num해당하는 상품 삭제
			sql="delete from product where product_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, product_num);
			//4 실행
			pstmt.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
		finally {if(rs != null){try {rs.close();} catch (Exception ex) {}}
		if(pstmt != null){try {pstmt.close();}catch(Exception ex){}}
		if(con != null){try {con.close();}catch(Exception ex) {}}}
	}//deleteProduct()
	
	
	
} // ProductDAO
