package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
import co.yd.dto.CartDTO;
import co.yd.dto.WishListDTO;

public class WishListDAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	
	//싱글톤 인스턴트화 안하고 바로 가능
	public static WishListDAO instance = new WishListDAO(); 
	
	public static WishListDAO getInstance() {
		return instance;
	}
	
	public ArrayList<WishListDTO> selectOptionCart (WishListDTO wdto) {
		String sql = "select w.w_id, w.m_id, w.p_id, p.p_name, p.p_price, p.p_price, p.p_color, p.p_detail "
				+ "from wish_list w, product p "
				+ "where w.p_id = p.p_id and w.m_id = ? ";
		
		ArrayList<WishListDTO> optionList = new ArrayList<WishListDTO>();
		
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

}
