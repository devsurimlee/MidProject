package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
import co.yd.dto.OrderDTO;
import co.yd.dto.OrderDetailDTO;

public class AdminOrderDAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;

	// 싱글톤 인스턴트화 안하고 바로 가능
	public static AdminOrderDAO instance = new AdminOrderDAO();

	public static AdminOrderDAO getInstance() {
		return instance;
	}

	// 지원 1전체주문내역수 2주문목록 3상세주문 4배송상태에따른목록

	// 1. 전체 주문 내역 수
	public int countOrders(String status, String selectKey, String keyword) {
		String where = "where 1=1 ";
		int i = 0;
		if (status != null) {
			if (!status.equals("전체"))
				where += "and o_deliver_state = ? ";
		}
		if(keyword != null && selectKey != null) {
			where += "and " + selectKey + " LIKE '%" + keyword + "%'";
		}
		String sql = "select count(*) as count from orders " + where;
		int count = 0;
		try {
			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			if (status != null) {
				if (!status.equals("전체"))
					pstmt.setString(++i, status);
			}
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt("count");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return count;
	}

	// 2. 주문 목록(조건부 검색)
	public ArrayList<OrderDTO> orderList(OrderDTO dto, int first, int last, String selectKey, String keyword) throws Exception {
		ArrayList<OrderDTO> list = new ArrayList<>();
		try {
			String where = "where 1=1 ";
			if (dto.getOrderDeliverState() != null) {
				if (!dto.getOrderDeliverState().equals("전체"))
					where += "and o_deliver_state = ? ";
			}
			if(keyword != null && selectKey != null) {
				where += "and " + selectKey + " LIKE '%" + keyword + "%'";
			}
			String sql = "select b.* from ( select a.*, rownum  rnum from ( " + " select * from orders " + where
					+ " order by o_id )a" + " )b where rnum between ? and ?";

			conn = JDBCutil.connect();
			pstmt = conn.prepareStatement(sql);
			int i = 0;
			if (dto.getOrderDeliverState() != null) {
				if (!dto.getOrderDeliverState().equals("전체"))
					pstmt.setString(++i, dto.getOrderDeliverState());
			}
			pstmt.setInt(++i, first);
			pstmt.setInt(++i, last);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderDTO ndto = new OrderDTO();
				ndto.setOrderId(rs.getInt("o_id"));
				ndto.setOrderDate(rs.getDate("o_date"));
				ndto.setOrderDeliveredDate(rs.getDate("o_delivered_date"));
				ndto.setmId(rs.getString("m_id"));
				ndto.setOrderName(rs.getString("o_name"));
				ndto.setOrderAddress1(rs.getString("o_address1"));
				ndto.setOrderPostCode(rs.getString("o_postcode"));
				ndto.setOrderPhoneNum(rs.getString("o_phone"));
				// 금액에 천단위로 콤마 넣기
				String totalPrice = String.format("%,d", rs.getInt("o_total_price"));
				ndto.setOrderTotalPrice(totalPrice);
				ndto.setOrderDeliverState(rs.getString("o_deliver_state"));
				ndto.setOrderAddress2(rs.getString("o_address2"));
				list.add(ndto);
			}
		} catch (Throwable e) {
			System.out.println("comment selectAll error" + e.getMessage());
			throw new Exception(e.getMessage());
		} finally {
			JDBCutil.disconnect(pstmt, conn);
		}
		return list;
	}

	// 3. 상세주문내역
	public ArrayList<OrderDetailDTO> orderRead(int orderId) {
		ArrayList<OrderDetailDTO> list = new ArrayList<>();
		OrderDetailDTO dto = new OrderDetailDTO();
		String sql = "select od.o_id, p.p_name, a.amount_size, a.amount_color, count(*), count(*)*p.p_price \"가격\""
				+ "from order_detail od, amount a, product p "
				+ "where od.amount_id = a.amount_id and od.p_id = p.p_id " + "        and od.o_id=? "
				+ "group by od.o_id, p.p_name, a.amount_size, a.amount_color, p.p_price";
		try {
			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new OrderDetailDTO();
				dto.setOrderId(rs.getInt("o_id"));
				dto.setpName(rs.getString("p_name"));
				dto.setaSize(rs.getString("amount_size"));
				dto.setaColor(rs.getString("amount_color"));
				dto.setOrderProductCount(rs.getInt("count(*)"));
				// 금액에 천단위로 콤마 넣기
				String price = String.format("%,d", rs.getInt("가격"));
				dto.setpPrice(price);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return list;
	}

	// 4. 배송상태 배송완료로 바꾸기
	public int changeDeliverStatus(OrderDTO dto) {
		int r = 0;
		String sql = "update orders set o_delivered_date=?, o_deliver_state=? where o_id=?";
		try {
			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			String status = dto.getOrderDeliverState();
			if(status.equals("배송준비중"))
				pstmt.setString(1, null);
			else if(status.equals("배송완료"))
				pstmt.setString(1, new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date()));
			else if(status.equals("입금완료"))
				pstmt.setString(1, null);
			pstmt.setString(2, dto.getOrderDeliverState());
			pstmt.setInt(3, dto.getOrderId());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return r;
	}

}
