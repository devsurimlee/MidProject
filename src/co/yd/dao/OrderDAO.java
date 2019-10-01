package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.yd.common.JDBCutil;
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
	
	public OrderDetailDTO insertOrderDetail(OrderDetailDTO odDto) {
		
		//1) 오더디테일 교유 인덱스, 2)오더번호, 3)제품명, 4)재고명(사이즈/색상등), 5)주문수량
		String sql ="insert into order_detail values(ORDER_DETAIL_SEQ.nextval, ?, ?, ?, ?)";
		
		try {
			conn = JDBCutil.connect(); //커넥트
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
