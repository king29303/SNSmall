package web.sns.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
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

	// sns id濡� SnsBean 由ы꽩
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
				sb.setDetail_img(rs.getString("detail_img"));
				sb.setName(rs.getString("name"));
				sb.setProfile_img(rs.getString("profile_img"));
				sb.setSell(rs.getInt("sell"));
				sb.setSns_profit(rs.getInt("sns_profit"));
				sb.setCategory(rs.getString("category"));
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

	// sns star 媛쒖닔 由ы꽩
	public int getListCount(String category) {
		int num = 0;

		try {
			con = getConnection();
			StringBuffer sql = new StringBuffer("select count(sns_id) from sns ");
			if (category.equals("fashion")) {
				sql.append("where category = 'fashion'");
			} else if (category.equals("beauty")) {
				sql.append("where category = 'beauty'");
			} else if (category.equals("baby")) {
				sql.append("where category = 'baby'");
			} else if (category.equals("daily")) {
				sql.append("where category = 'daily'");
			} else if (category.equals("gym")) {
				sql.append("where category = 'gym'");
			} else if (category.equals("etc")) {
				sql.append("where category = 'etc'");
			}
			pstmt = con.prepareStatement(sql.toString());
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

	// sns紐⑸줉
	public List<Object> snsList(int start, int pageSize, String category, String order) {
		List<Object> list = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer("select * from sns ");
		SnsBean sb = null;
		try {
			con = getConnection();
			if (category.equals("fashion")) {
				sql.append("where category = 'fashion'");
			} else if (category.equals("beauty")) {
				sql.append("where category = 'beauty'");
			} else if (category.equals("baby")) {
				sql.append("where category = 'baby'");
			} else if (category.equals("daily")) {
				sql.append("where category = 'daily'");
			} else if (category.equals("gym")) {
				sql.append("where category = 'gym'");
			} else if (category.equals("etc")) {
				sql.append("where category = 'etc'");
			}

			if (order.equals("sell")) {
				sql.append(" order by sell desc");
			} else if (order.equals("date")) {
				sql.append(" order by date desc");
			} else if (order.equals("sns_profit")) {
				sql.append(" order by sell desc");
			}

			sql.append(" limit ?,?;");
			pstmt = con.prepareStatement(sql.toString());
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

	// sns_id�쉶�썝媛��엯
	public void insertMember_sns(SnsBean sb) {

		try {

			con = getConnection();

			sql = "insert into sns(sns_id,pass,name,content,profile_img,sns_profit,date,type,detail_img,category) values(?,?,?,?,?,?,now(),?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, sb.getSns_id());
			pstmt.setString(2, sb.getPass());
			pstmt.setString(3, sb.getName());
			pstmt.setString(4, sb.getContent());
			pstmt.setString(5, sb.getProfile_img());
			pstmt.setInt(6, 0);
			pstmt.setString(7, "sns");
			pstmt.setString(8, sb.getDetail_img());
			pstmt.setString(9, sb.getCategory());

			pstmt.executeUpdate();

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

	}// insertMember_sns(SnsBean sb)

	// sns_id id以묐났泥댄겕
	public int joinIdCheck(String sns_id) {
		int check = 0;

		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();
			sql = "select sns_id from sns where sns_id=? union select vendor_id from vendor where vendor_id=?"
					+ " union select client_id from client where client_id=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sns_id);
			pstmt.setString(2, sns_id);
			pstmt.setString(3, sns_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				check = 1;
			} else {
				check = 0;
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

		return check;
	}// joinIdCheck(String sns_id)

	// sns�젙蹂대낫湲�->�쉶�썝�닔�젙媛�湲� �쟾 password check
	public int passCheck(String id, String pass) {

		int check = -1;

		try {

			con = getConnection();
			sql = "select pass,type from client where client_id=? union select pass,type from vendor where vendor_id=? union select pass,type from sns where sns_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (pass.equals(rs.getString("pass"))) {
					check = 1;
				}
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
		return check;
	}

	// sns 스타가 판매한 물품
	public List<Integer> snsProductList(String sns_id, String order) {
		List<Integer> list = new ArrayList<Integer>();
		String sql2;

		ResultSet rs2 = null;
		try {
			con = getConnection();
			if (order.equals("date")) {
				sql = "select product_num from payment where sns_id=? group by product_num order by date desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, sns_id);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					list.add(rs.getInt(1));
				}
			} else if (order.equals("sell")) {
				sql2 = "select product_num, count(*) from payment  where sns_id = ? group by product_num order by count(*) desc";
				pstmt = con.prepareStatement(sql2);
				pstmt.setString(1, sns_id);
				rs2 = pstmt.executeQuery();
				while (rs2.next()) {
					list.add(rs2.getInt("product_num"));
				}
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
			if (rs2 != null) {
				try {
					rs2.close();
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
