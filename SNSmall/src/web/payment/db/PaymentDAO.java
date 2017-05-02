package web.payment.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import web.client.db.ClientBean;
import web.product.db.ProductBean;
import web.sns.db.SnsBean;

public class PaymentDAO {

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

	public void insertPay(List<PaymentBean> list_pb, int usedPoint, String state) {
		PaymentBean pb = null;
		int max = 0;
		try {
			con = getConnection();
			sql = "select max(num) from payment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				max = rs.getInt(1);
			}

			sql = "insert into payment(order_num, product_num, sns_id, vendor_id, client_id, amount, message, date, num, option1, option2, option3, state, usedPoint) "
					+ "values(?,?,?,?,?,?,?,now(),?,?,?,?,?,?); ";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < list_pb.size(); i++) {
				pb = (PaymentBean) list_pb.get(i);
				pstmt.setString(1, pb.getOrder_num());
				pstmt.setInt(2, pb.getProduct_num());
				pstmt.setString(3, pb.getSns_id());
				pstmt.setString(4, pb.getVendor_id());
				pstmt.setString(5, pb.getClient_id());
				pstmt.setInt(6, pb.getAmount());
				pstmt.setString(7, pb.getMessage());
				pstmt.setInt(8, max + i + 1);
				pstmt.setString(9, pb.getOption1());
				pstmt.setString(10, pb.getOption2());
				pstmt.setString(11, pb.getOption3());
				pstmt.setString(12, state);
				pstmt.setInt(13, usedPoint);
				pstmt.executeUpdate();
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
	}

	public void deletePay(int num) {
		try {
			con = getConnection();
			sql = "delete from payment where num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	}

	public void deletePay(String order_num) {
		try {
			con = getConnection();
			sql = "delete from payment where order_num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order_num);
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
	}

	public void deletePayRequest(String order_num) {
		try {
			con = getConnection();
			sql = "update payment set state='cancle' where order_num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order_num);
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
	}

	public void deletePayRequest(int num) {
		try {
			con = getConnection();
			sql = "update payment set state='cancle' where num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	}

	public void subPoint(int point, String id) {
		try {
			con = getConnection();
			sql = "update client set point=? where client_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, id);
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
	}

	public void addPoint(int point, String id) {
		try {
			System.out.println("addPoint: " + point);
			System.out.println("addPointId: " + id);
			con = getConnection();
			sql = "update client set point=point+? where client_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, id);
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
	}

	public int usingPoint(int point, String id) {
		int usedPoint = 0;
		try {
			con = getConnection();
			sql = "select point from client where client_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				usedPoint = rs.getInt(1) - point;
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
		return usedPoint;
	}

	public void addSnsPay(int price, String sns_id) {
		PaymentBean pb = null;
		try {
			System.out.println("price: " + price);
			con = getConnection();
			int profit = (int) (price * 0.01);
			sql = "update sns set sns_profit=sns_profit+?, sell=sell+1 where sns_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, profit);
			pstmt.setString(2, sns_id);
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
	}

	public void subSnsPay(int price, String sns_id) {
		PaymentBean pb = null;
		try {
			System.out.println("price: " + price);
			con = getConnection();
			int profit = (int) (price * 0.01);
			sql = "update sns set sns_profit=sns_profit-?, sell=sell-1 where sns_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, profit);
			pstmt.setString(2, sns_id);
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
	}

	public void addVendorProfit(int price, String vendor_id) {
		PaymentBean pb = null;
		try {
			con = getConnection();
			int profit = (int) (price * 0.01);
			sql = "update vendor set vendor_profit=vendor_profit+? where vendor_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, profit);
			pstmt.setString(2, vendor_id);
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
	}

	public void subVendorProfit(int price, String vendor_id) {
		PaymentBean pb = null;
		try {
			con = getConnection();
			int profit = (int) (price * 0.01);
			sql = "update vendor set vendor_profit=vendor_profit-? where vendor_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, profit);
			pstmt.setString(2, vendor_id);
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
	}

	// product amount蹂�寃�
	public void subAmount(int amount, int product_num) {
		PaymentBean pb = null;
		try {
			con = getConnection();
			sql = "update product set amount=amount-?, count=count-1 where product_num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, amount);
			pstmt.setInt(2, product_num);
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
	}

	// getPaymentBean
	public List<PaymentBean> getPayment(String order_num) {
		List<PaymentBean> list = new ArrayList<>();
		PaymentBean pb = null;
		try {
			con = getConnection();
			sql = "select * from payment where order_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				pb = new PaymentBean();
				pb.setAmount(rs.getInt("amount"));
				pb.setDate(rs.getDate("date"));
				pb.setMessage(rs.getString("message"));
				pb.setProduct_num(rs.getInt("product_num"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setOrder_num(rs.getString("order_num"));
				pb.setSns_id(rs.getString("sns_id"));
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setState(rs.getString("state"));
				pb.setNum(rs.getInt("num"));
				pb.setUsedPoint(rs.getInt("usedPoint"));

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

	// getPaymentBean by product_num
	public PaymentBean getPaymentByNum(int num) {
		List<PaymentBean> list = new ArrayList<>();
		PaymentBean pb = null;
		try {
			con = getConnection();
			sql = "select * from payment where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				pb = new PaymentBean();
				pb.setAmount(rs.getInt("amount"));
				pb.setDate(rs.getDate("date"));
				pb.setMessage(rs.getString("message"));
				pb.setProduct_num(rs.getInt("product_num"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setOrder_num(rs.getString("order_num"));
				pb.setSns_id(rs.getString("sns_id"));
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setState(rs.getString("state"));
				pb.setNum(rs.getInt("num"));
				pb.setUsedPoint(rs.getInt("usedPoint"));
				pb.setClient_id(rs.getString("client_id"));

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

		return pb;
	}

	// getPaymentBean 아이디로 찾음
	public List<PaymentBean> getPaymentById(String client_id) {
		List<PaymentBean> list = new ArrayList<>();
		PaymentBean pb = null;
		try {
			con = getConnection();
			sql = "select * from payment where client_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, client_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				pb = new PaymentBean();
				pb.setAmount(rs.getInt("amount"));
				pb.setDate(rs.getDate("date"));
				pb.setMessage(rs.getString("message"));
				pb.setProduct_num(rs.getInt("product_num"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setOrder_num(rs.getString("order_num"));
				pb.setSns_id(rs.getString("sns_id"));
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setState(rs.getString("state"));
				pb.setNum(rs.getInt("num"));
				pb.setUsedPoint(rs.getInt("usedPoint"));

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

	// getPaymentBean 아이디,start,pageSize, order로 찾음
	public List<PaymentBean> getPaymentById(int pageSize, String client_id, String method) {
		List<PaymentBean> list = new ArrayList<PaymentBean>();
		StringBuffer sql = new StringBuffer("select * from payment where client_id = ? and ");
		PaymentBean pb = null;
		try {
			con = getConnection();
			if (method.equals("payDone")) {
				sql.append("state = 'payDone' or state = 'delivery' or state = 'cancle' or state = 'waiting'");
			} else if (method.equals("done")) {
				sql.append("state = 'done'");
			} else if (method.equals("delivery")) {
				sql.append("state = 'delivery'");
			} else if (method.equals("cancle")) {
				sql.append("state = 'cancle'");
			} else if (method.equals("waiting")) {
				sql.append("state = 'waiting'");
			}
			sql.append(" order by date desc limit ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, client_id);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pb = new PaymentBean();
				pb.setAmount(rs.getInt("amount"));
				pb.setDate(rs.getDate("date"));
				pb.setMessage(rs.getString("message"));
				pb.setProduct_num(rs.getInt("product_num"));
				pb.setOption1(rs.getString("option1"));
				pb.setOption2(rs.getString("option2"));
				pb.setOption3(rs.getString("option3"));
				pb.setOrder_num(rs.getString("order_num"));
				pb.setSns_id(rs.getString("sns_id"));
				pb.setVendor_id(rs.getString("vendor_id"));
				pb.setState(rs.getString("state"));
				pb.setNum(rs.getInt("num"));
				pb.setUsedPoint(rs.getInt("usedPoint"));

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

}
