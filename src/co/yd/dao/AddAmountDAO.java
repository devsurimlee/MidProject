package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
import co.yd.dto.AddAmountDTO;
import co.yd.dto.AmountDTO;

public class AddAmountDAO extends DAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	public static AddAmountDAO instance = new AddAmountDAO();

	public static AddAmountDAO getInstance() {
		return instance;
	}

	public int countIncrease(AddAmountDTO dto) {
		String sql = "insert into add_amount(AMOUNT_ID,AA_DATE,AA_COUNT) " + "values(?,sysdate,?)";
		int result = 0;
		try {
			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAmount_id());
			pstmt.setInt(2, dto.getAa_Count());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return result;
	}

	public int countDecrease(AddAmountDTO dto) {
		String sql = "insert into add_amount(AMOUNT_ID,AA_DATE,AA_COUNT) " + "values(?,sysdate,?)";
		int result = 0;
		try {
			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAmount_id());
			pstmt.setInt(2, -(dto.getAa_Count()));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return result;
	}

	public ArrayList<AddAmountDTO> selectAll() {
		String sql = "select AMOUNT_ID,AA_DATE,AA_COUNT from add_amount";
		ArrayList<AddAmountDTO> list = new ArrayList<AddAmountDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				AddAmountDTO dto = new AddAmountDTO();
				dto.setAmount_id(rs.getInt("AMOUNT_ID"));
				dto.setAa_Date(rs.getDate("aa_Date"));
				dto.setAa_Count(rs.getInt("AA_COUNT"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}

		return null;
	}


}
