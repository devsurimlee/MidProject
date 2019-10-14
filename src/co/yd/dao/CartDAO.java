package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
import co.yd.dto.CartDTO;

public class CartDAO {
	
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	
	//싱글톤 인스턴트화 안하고 바로 가능
	public static CartDAO instance = new CartDAO(); 
	
	public static CartDAO getInstance() {
		return instance;
	}
	
	public CartDTO delectAllCart(CartDTO cdto) {
		String sql = "delete from cart where m_id = ?";
		
		try {
			conn = JDBCutil.connect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cdto.getmId());
			
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 장바구니 삭제완료");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		
		return cdto;
	}
	
	
	public CartDTO delectCart (CartDTO cdto) {
		String sql = "delete from cart where m_id = ? and amount_id = ?";
		
		try {
			conn = JDBCutil.connect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cdto.getmId());
			pstmt.setInt(2, cdto.getAmountId());
			
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 장바구니 삭제완료");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		
		return cdto;
	}
	
	
	public ArrayList<CartDTO> selectOptionCart (CartDTO cdto) {
		String sql = "select c.amount_id, c.m_id, a.p_id, a.amount_size, a.amount_color, a.amount_count, p.p_name, p.p_price, p.p_detail, c.a_count "
				+ "from cart c, amount a, product p "
				+ "where c.amount_id = a.amount_id and p.p_id = a.p_id and c.m_id = ? ";
		
		ArrayList<CartDTO> optionList = new ArrayList<CartDTO>();
		
		try {
			conn = JDBCutil.connect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cdto.getmId());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setAmountId(rs.getInt("amount_id"));
				dto.setmId(rs.getString("m_id"));
				dto.setP_id(rs.getInt("p_id"));
				dto.setAmount_size(rs.getString("amount_size"));
				dto.setAmount_color(rs.getString("amount_color"));
				dto.setA_count(rs.getInt("amount_count"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_detail(rs.getString("p_detail"));
				dto.setA_count(rs.getInt("a_count"));
				
				optionList.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return optionList;

	}
	
	
	
	public CartDTO insertCart (CartDTO dto) {
		//1)장바구니인덱스 2)유저아이디 3)상품옵션아이디 4)주문수량
		String sql = "select cart_seq.nextval from dual";

		conn = JDBCutil.connect();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			dto.setCartId(rs.getInt(1));
			
			sql = "insert into cart (c_id, m_id, amount_id, a_count) values(?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getCartId());
			pstmt.setString(2, dto.getmId());
			pstmt.setInt(3, dto.getAmountId());
			pstmt.setInt(4, dto.getOrderProductCount());
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		
		return dto;
	}

}
