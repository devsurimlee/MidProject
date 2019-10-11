package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
import co.yd.dto.AmountDTO;
import co.yd.dto.MemberDTO;
import co.yd.dto.OrderDTO;
import co.yd.dto.OrderDetailDTO;

public class OrderDAO{
	
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;

	//싱글톤 인스턴트화 안하고 바로 가능
	public static OrderDAO instance = new OrderDAO(); 
	
	public static OrderDAO getInstance() {
		return instance;
	}
	
	

	// 지원 1전체주문내역수 2주문목록 3상세주문 4배송상태에따른목록

	// 1. 전체 주문 내역 수
	public int countOrders(String mid) {
		String where = "where 1=1 ";
		int i = 0;
		if (mid != null) {
				where += "and m_id = ? ";
		}
		String sql = "select count(*) as count from orders " + where;
		int count = 0;
		try {
			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			if (mid != null) {
					pstmt.setString(++i, mid);
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
	public ArrayList<OrderDTO> orderList(OrderDTO dto, int first, int last) throws Exception {
		ArrayList<OrderDTO> list = new ArrayList<>();
		try {
			String where = "where 1=1 ";
			if (dto.getmId() != null) {
					where += "and m_id = ? ";
			}
			String sql = "select b.* from ( select a.*, rownum  rnum from ( " + " select * from orders " + where
					+ " order by o_id )a" + " )b where rnum between ? and ?";

			conn = JDBCutil.connect();
			pstmt = conn.prepareStatement(sql);
			int i = 0;
			if (dto.getmId() != null) {
					pstmt.setString(++i, dto.getmId());
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
				ndto.setOrderTotalPrice(rs.getInt("o_total_price"));
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
	
	
	
	
	public ArrayList<OrderDTO> selectMyOrders (OrderDTO odto) {
		String sql = "select o_id, o_date, o_delivered_date, o_name, o_address1, o_postcode, o_phone, o_total_price, o_deliver_state, o_address2 from orders "
				   + "where m_id = ? order by o_id" ;
		
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, odto.getmId());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setOrderId(rs.getInt("o_id"));
				dto.setOrderDate(rs.getDate("o_date"));
				dto.setOrderDeliveredDate(rs.getDate("o_delivered_date"));
				dto.setOrderName(rs.getString("o_name"));
				dto.setOrderAddress1(rs.getString("o_address1"));
				dto.setOrderPostCode(rs.getString("o_postcode"));
				dto.setOrderPhoneNum(rs.getString("o_phone"));
				dto.setOrderTotalPrice(rs.getInt("o_total_price"));
				dto.setOrderDeliverState(rs.getString("o_deliver_state"));
				dto.setOrderAddress2(rs.getString("o_address2"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
	
	return list;
	}
	

	
	public void subAllAmount(ArrayList<AmountDTO> amountList) {
		String sql = "update amount set amount_count = (amount_count - ? ) where amount_id = ? and p_id = ? ";
		
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			
			for(int i = 0; i < amountList.size(); i++) {
				AmountDTO dto = amountList.get(i);
				pstmt.setInt(1, dto.getOrderProductCount());
				pstmt.setInt(2, dto.getAmount_id());
				pstmt.setInt(3, dto.getP_id());
				pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}

		
	}
	
	
	// 재고에서 주문 수량 빼기, 재고수량 amount_count, 주문수량 getOrderProductCount
	public void subAmount(AmountDTO amDto) {
		String sql = "update amount set amount_count = (amount_count - ? ) where amount_id= ? and p_id = ? ";
		
		conn = JDBCutil.connect(); //커넥트
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, amDto.getOrderProductCount());
			pstmt.setInt(2, amDto.getAmount_id());
			pstmt.setInt(3, amDto.getP_id());
			int r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}

	}
	
public ArrayList<OrderDetailDTO> insertAllOrderDetail(ArrayList<OrderDetailDTO> list) {
		
		//od_id, o_id, p_id, amount_id, a_count
		//1) 오더디테일 고유 인덱스, 2)오더번호, 3)제품명, 4)재고명(사이즈/색상등), 5)주문수량
		String sql ="insert into order_detail values(ORDER_DETAIL_SEQ.nextval, ?, ?, ?, ?)";
		
		
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			
			for(int i = 0; i < list.size(); i++) {
			
				OrderDetailDTO dto = list.get(i);
				pstmt.setInt(1, dto.getOrderId());
				pstmt.setInt(2, dto.getProductId());
				pstmt.setInt(3, dto.getAmountId());
				pstmt.setInt(4, dto.getOrderProductCount());
				pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return list;
	}
	
	public OrderDetailDTO insertOrderDetail(OrderDetailDTO odDto) {
		
		//od_id, o_id, p_id, amount_id, a_count
		//1) 오더디테일 고유 인덱스, 2)오더번호, 3)제품명, 4)재고명(사이즈/색상등), 5)주문수량
		String sql1 = "select ORDER_DETAIL_SEQ.nextval from dual";
		String sql ="insert into order_detail values(?, ?, ?, ?, ?)";
		
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql1);
			rs =  pstmt.executeQuery();
			rs.next();
			odDto.setOrderDetailId(rs.getInt(1));
			
			OrderDTO dto = new OrderDTO();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, odDto.getOrderDetailId());
			pstmt.setInt(2, odDto.getOrderId());
			pstmt.setInt(3, odDto.getProductId());
			pstmt.setInt(4, odDto.getAmountId());
			pstmt.setInt(5, odDto.getOrderProductCount());
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		
		return odDto;
		
	}
	
	
	public OrderDTO insertOrders(OrderDTO dto) {
		String sql1 ="select ORDERS_SEQ.nextval from dual";
		String sql = "insert into orders VALUES(?, sysdate, null, ?, ?, ?, ?, ?, ?, '배송준비중', ?)";

				try {
					conn = JDBCutil.connect(); //커넥트
					//
					pstmt = conn.prepareStatement(sql1);
					rs =  pstmt.executeQuery();
					rs.next();
					dto.setOrderId(rs.getInt(1));
					
					//
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, dto.getOrderId());
					pstmt.setString(2, dto.getmId());
					pstmt.setString(3, dto.getOrderName());
					pstmt.setString(4, dto.getOrderAddress1());
					pstmt.setString(5, dto.getOrderPostCode());
					pstmt.setString(6, dto.getOrderPhoneNum());
					pstmt.setInt(7, dto.getOrderTotalPrice());
					pstmt.setString(8, dto.getOrderAddress2());
					
					pstmt.executeUpdate();
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					JDBCutil.disconnect(pstmt, conn); //클로즈
				}
		
		
		return dto;
	}
	
	public MemberDTO selectUserInfo(MemberDTO Mdto) {
		String sql ="select * from members where m_id = ?";
		
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Mdto.getmId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Mdto = new MemberDTO();
				Mdto.setmId(rs.getString("m_id"));
				Mdto.setmName(rs.getString("m_name"));
				Mdto.setmAddress1(rs.getString("m_address1"));
				Mdto.setmPostcode(rs.getString("m_postcode"));
				Mdto.setmPhone(rs.getString("m_phone"));
				Mdto.setmAddress1(rs.getString("m_address1"));
				Mdto.setmAddress2(rs.getString("m_address2"));
				Mdto.setgGrade(rs.getString("g_grade"));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return Mdto;
	}
	

}
