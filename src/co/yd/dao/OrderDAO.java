package co.yd.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.yd.dto.MemberDTO;

public class OrderDAO extends DAO{
	
	PreparedStatement pstmt;
	ResultSet rs;

	public OrderDAO() {
		super();
	}
	
	public MemberDTO selectUserInfo(MemberDTO dto) {
		String sql ="select * from members where m_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new MemberDTO();
				dto.setmId(rs.getString("m_id"));
				dto.setmName(rs.getString("m_name"));
				dto.setmAddress1(rs.getString("m_address1"));
				dto.set

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return dto;
		
	}
	
	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
