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
	
	public MemberDTO selectUserInfo(MemberDTO Mdto) {
		String sql ="select * from members where m_id = ?";
		
		try {
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
		}
		close();
		return Mdto;
		
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
