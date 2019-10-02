package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
import co.yd.dto.AmountDTO;

public class AmountDAO extends DAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	public static AmountDAO instance = new AmountDAO();

	public static AmountDAO getInstance() {
		return instance;
	}

	public int insert(AmountDTO dto) {
		String sql = "insert into product(AMOUNT_ID,P_ID,AMOUNT_SIZE,AMOUNT_COLOR,AMOUNT_COUNT) " + "values(AMOUNT_SEQ.nextval,?,?,?,?)";
		int result = 0;
		try {
			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, dto.getAmount_id());
			pstmt.setInt(1, dto.getP_id());
			pstmt.setString(2, dto.getAmount_size());
			pstmt.setString(3, dto.getAmount_color());
			pstmt.setInt(4, dto.getAmount_count());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return result;

	}

	public int insert(ArrayList<AmountDTO> list) {
		int result = 0;
		try {
			for (AmountDTO amount : list) {
				result += insert(amount);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("아무튼 에러");
		}
		return result;
	}

	public int update(AmountDTO dto) {
		String sql = "update amount set " + "P_ID = ?,AMOUNT_SIZE = ?,AMOUNT_COLOR = ?,AMOUNT_COUNT = ? "
				+ "where AMOUNT_ID = ?";
		int result = 0;
		try {
			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getP_id());
			pstmt.setString(2, dto.getAmount_size());
			pstmt.setString(3, dto.getAmount_color());
			pstmt.setInt(4, dto.getAmount_count());
			pstmt.setInt(5, dto.getAmount_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return result;
	}

	public int delete(AmountDTO dto) {
		int result = 0;
		String sql = "delete from amount where AMOUNT_ID = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAmount_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(ArrayList<AmountDTO> list) {
		int result = 0;
		try {
			for (AmountDTO amount : list) {
				result += delete(amount);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("아무튼 에러");
		}
		return result;
	}
	
	public ArrayList<AmountDTO> selectAll(){
		String sql = "select AMOUNT_ID,P_ID,AMOUNT_SIZE,AMOUNT_COLOR,AMOUNT_COUNT " + "from amount";
		ArrayList<AmountDTO> list = new ArrayList<AmountDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AmountDTO dto = new AmountDTO();
				dto.setAmount_id(rs.getInt("AMOUNT_ID"));
				dto.setP_id(rs.getInt("P_ID"));
				dto.setAmount_size(rs.getString("AMOUNT_SIZE"));
				dto.setAmount_color(rs.getString("AMOUNT_COLOR"));
				dto.setAmount_count(rs.getInt("AMOUNT_COUNT"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public AmountDTO select(int amount_id) {
		String sql = "select AMOUNT_ID,P_ID,AMOUNT_SIZE,AMOUNT_COLOR,AMOUNT_COUNT " + "from amount where amount_id = ?";
		AmountDTO dto = new AmountDTO();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				dto.setAmount_id(rs.getInt("AMOUNT_ID"));
				dto.setP_id(rs.getInt("P_ID"));
				dto.setAmount_size(rs.getString("AMOUNT_SIZE"));
				dto.setAmount_color(rs.getString("AMOUNT_COLOR"));
				dto.setAmount_count(rs.getInt("AMOUNT_COUNT"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int selectAmountid(int p_id) {
		String sql = "select AMOUNT_ID,P_ID,AMOUNT_SIZE,AMOUNT_COLOR,AMOUNT_COUNT from amount where p_id = ? select AMOUNT_ID,P_ID,AMOUNT_SIZE,AMOUNT_COLOR,AMOUNT_COUNT from amount where p_id = ? order by AMOUNT_ID";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getString("AMOUNT_SIZE"));
				System.out.println(rs.getString("AMOUNT_COLOR"));
				System.out.println(rs.getString("AMOUNT_COUNT"));
				result = rs.getInt("AMOUNT_ID");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
