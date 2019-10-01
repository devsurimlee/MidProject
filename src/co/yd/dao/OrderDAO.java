package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.yd.common.JDBCutil;
import co.yd.dto.MemberDTO;
import co.yd.dto.OrderDTO;

public class OrderDAO{
	
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;

	//싱글톤 인스턴트화 안하고 바로 가능
	public static OrderDAO instance = new OrderDAO(); 
	
	public static OrderDAO getInstance() {
		return instance;
	}
	
	public OrderDTO insertOrders(OrderDTO dto) {
		String sql = "insert into orders VALUES(ORDERS_SEQ.nextval, sysdate, null, ?, ?, ?, ?, ?, ?, '배송준비중', ?)";

				try {
					conn = JDBCutil.connect(); //커넥트
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dto.getmId());
					pstmt.setString(2, dto.getOrderName());
					pstmt.setString(3, dto.getOrderAddress1());
					pstmt.setString(4, dto.getOrderPostCode());
					pstmt.setString(5, dto.getOrderPhoneNum());
					pstmt.setInt(6, dto.getOrderTotalPrice());
					pstmt.setString(7, dto.getOrderAddress2());
					
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
