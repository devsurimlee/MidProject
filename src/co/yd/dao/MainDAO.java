package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
import co.yd.dto.ProductDTO;

public class MainDAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	
	//싱글톤 인스턴트화 안하고 바로 가능
	public static MemberDAO instance = new MemberDAO(); 
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	public ArrayList<ProductDTO> selectDisplayAll(ProductDTO pDto) {
		String sql = "select P_ID,P_NAME,P_PRICE,P_SIZE,P_COLOR,P_DETAIL,P_CATEGORY,P_SHOW_STATE from product  where p_show_state ='진열'";
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setP_id(rs.getInt("P_ID"));
				dto.setP_name(rs.getString("P_NAME"));
				dto.setP_price(rs.getInt("P_PRICE"));
				dto.setP_size(rs.getString("P_SIZE"));
				dto.setP_color(rs.getString("P_COLOR"));
				dto.setP_detail(rs.getString("P_DETAIL"));
				dto.setP_category(rs.getString("P_CATEGORY"));
				dto.setP_show_state(rs.getString("P_SHOW_STATE"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return list;
	}
	
	
	

}


