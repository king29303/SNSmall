package web.sns.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import web.product.db.ProductBean;

public class SnsDAO {

	Connection con = null;

	private Connection getConnection() throws Exception {

		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysqlDB");
		con = ds.getConnection();
		return con;
	}

	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;

	// getSns()
	public SnsBean getSnsDetail(String sns_id) {
		SnsBean sb = null;
		try {
			con = getConnection();
			sql = "select * from sns where sns_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sns_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sb = new SnsBean();
				sb.setContent(rs.getString("content"));
				sb.setDate(rs.getDate("date"));
				// sb.setDetail_img(rs.getString("deatil_img"));
				sb.setName(rs.getString("name"));
				sb.setProfile_img(rs.getString("profile_img"));
				sb.setSell(rs.getInt("sell"));
				sb.setSns_profit(rs.getInt("sns_profit"));
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

		return sb;
	}

	// sns star 개수
	public int getListCount() {
		int num = 0;

		try {
			con = getConnection();
			sql = "select count(sns_id) from sns";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
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

		return num;
	}

	// 글목록
	public List<Object> snsList(int start, int pageSize) {
		List<Object> list = new ArrayList<Object>();
		SnsBean sb = null;
		try {
			con = getConnection();
			sql = "select * from sns order by sell limit ?,?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sb = new SnsBean();
				sb.setContent(rs.getString("content"));
				sb.setDate(rs.getDate("date"));
				sb.setDetail_img(rs.getString("detail_img"));
				sb.setName(rs.getString("name"));
				sb.setProfile_img(rs.getString("profile_img"));
				sb.setSell(rs.getInt("sell"));
				sb.setSns_id(rs.getString("sns_id"));
				sb.setSns_profit(rs.getInt("sns_profit"));
				sb.setCategory(rs.getString("category"));

				list.add(sb);
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

}
