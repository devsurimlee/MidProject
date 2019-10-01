package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.yd.common.JDBCutil;
import co.yd.dto.AddAmountDto;

public class AddAmountDAO extends DAO{
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	public static AddAmountDAO instance = new AddAmountDAO();

	public static AddAmountDAO getInstance() {
		return instance;
	}
	
	public int countIncrease(AddAmountDto dto) {
		String sql = "insert into add_amount(AMOUNT_ID,AA_DATE,AA_COUNT) "
				+ "values(?,sysdate,?)";
		int result = 0;
		try {
			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAmount_id());
			pstmt.setInt(2,dto.getAa_Count());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return result;
	}
	
	public int countDecrease(AddAmountDto dto ) {
		String sql = "insert into add_amount(AMOUNT_ID,AA_DATE,AA_COUNT) "
				+ "values(?,sysdate,?)";
		int result = 0;
		try {
			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAmount_id());
			pstmt.setInt(2,-(dto.getAa_Count()));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return result;
	}
	
	public AddAmountDto selectAll() {
		return null;
	}
	
	
	
}
