package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
import co.yd.dto.AmountDTO;
import co.yd.dto.ProductDTO;

public class AmountDAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	public static AmountDAO instance = new AmountDAO();

	public static AmountDAO getInstance() {
		return instance;
	}

	public int insert(AmountDTO dto) {
		int result = 0;
		try {
			conn = JDBCutil.connect(); // 커넥트

			String sql = "select AMOUNT_SEQ.nextval from dual";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			dto.setAmount_id(rs.getInt(1));

			sql = "insert into amount(AMOUNT_ID,P_ID,AMOUNT_SIZE,AMOUNT_COLOR,AMOUNT_COUNT) " + "values(?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAmount_id());
			pstmt.setInt(2, dto.getP_id());
			pstmt.setString(3, dto.getAmount_size());
			pstmt.setString(4, dto.getAmount_color());
			pstmt.setInt(5, dto.getAmount_count());
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
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return result;
	}

	public int update(AmountDTO dto) {
		int success = 0;
		int returnValue = 0;
		try {
			conn = JDBCutil.connect(); // 커넥트
			String sql = "select amount_count from amount where amount_id = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAmount_id());
			rs = pstmt.executeQuery();
			rs.next();
			int beforeCount = rs.getInt(1);

			sql = "update amount set AMOUNT_SIZE = ?,AMOUNT_COLOR = ?,AMOUNT_COUNT = ? " + "where AMOUNT_ID = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAmount_size());
			pstmt.setString(2, dto.getAmount_color());
			pstmt.setInt(3, dto.getAmount_count());
			pstmt.setInt(4, dto.getAmount_id());
			success = pstmt.executeUpdate();
			if (success > 0) {
				returnValue = dto.getAmount_count() - beforeCount;
			} else {
				returnValue = 2147438647;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return returnValue;
	}
	
	public int update(int amount_id, int amount_count) {
		int success = 0;
		int returnValue = 0;
		try {
			conn = JDBCutil.connect(); // 커넥트
			String sql = "select amount_count from amount where amount_id = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, amount_id);
			rs = pstmt.executeQuery();
			rs.next();
			int beforeCount = rs.getInt(1);

			sql = "update amount set AMOUNT_COUNT = ? " + "where AMOUNT_ID = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, amount_count);
			pstmt.setInt(2, amount_id);
			success = pstmt.executeUpdate();
			if (success > 0) {
				returnValue = amount_count - beforeCount;
			} else {
				returnValue = 2147438647;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return returnValue;
	}

	public int delete(AmountDTO dto) {
		int result = 0;
		String sql = "delete from amount where AMOUNT_ID = ?";

		try {

			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAmount_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return result;
	}
	
	public int delete(ProductDTO productDto) {
		int success = 0;
		try {
			conn = JDBCutil.connect(); // 커넥트
			ArrayList<AmountDTO> list = new ArrayList<AmountDTO>();
			
			String sql = "select amount_id from amount where p_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productDto.getP_id());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AmountDTO amountDto = new AmountDTO();
				amountDto.setAmount_id(rs.getInt("amount_id"));
				list.add(amountDto);
			}
			success=delete(list);
//			
//			
//			int beforeCount = rs.getInt(1);
//
//			sql = "update amount set AMOUNT_COUNT = ? " + "where AMOUNT_ID = ?";
//
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, amount_count);
//			pstmt.setInt(2, amount_id);
//			success = pstmt.executeUpdate();
//			if (success > 0) {
//				returnValue = amount_count - beforeCount;
//			} else {
//				returnValue = 2147438647;
//			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return success;
	}

	public int delete(ArrayList<AmountDTO> list) {
		int result = 0;
		try {
			for (AmountDTO amount : list) {
				result += delete(amount);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return result;
	}

	public ArrayList<AmountDTO> selectAll() {
		String sql = "select b.p_name p_name,a.AMOUNT_ID AMOUNT_ID, a.p_id p_id,a.amount_size amount_size,a.amount_color amount_color ,a.amount_count amount_count  from amount a,product b where a.p_id =b.p_id order by 1";
		ArrayList<AmountDTO> list = new ArrayList<AmountDTO>();
		try {

			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AmountDTO dto = new AmountDTO();
				dto.setP_name(rs.getString("p_name"));
				dto.setAmount_id(rs.getInt("AMOUNT_ID"));
				dto.setP_id(rs.getInt("P_ID"));
				dto.setAmount_size(rs.getString("AMOUNT_SIZE"));
				dto.setAmount_color(rs.getString("AMOUNT_COLOR"));
				dto.setAmount_count(rs.getInt("AMOUNT_COUNT"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return list;
	}

	public AmountDTO select(int amount_id) {
		String sql = "select AMOUNT_ID,P_ID,AMOUNT_SIZE,AMOUNT_COLOR,AMOUNT_COUNT " + "from amount where amount_id = ?";
		AmountDTO dto = new AmountDTO();
		try {

			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				dto.setAmount_id(rs.getInt("AMOUNT_ID"));
				dto.setP_id(rs.getInt("P_ID"));
				dto.setAmount_size(rs.getString("AMOUNT_SIZE"));
				dto.setAmount_color(rs.getString("AMOUNT_COLOR"));
				dto.setAmount_count(rs.getInt("AMOUNT_COUNT"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return dto;
	}

	public int selectAmountid(int p_id) {
		String sql = "select AMOUNT_ID,P_ID,AMOUNT_SIZE,AMOUNT_COLOR,AMOUNT_COUNT from amount where p_id = ? order by AMOUNT_ID";
		int result = 0;
		try {

			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println(rs.getString("AMOUNT_SIZE"));
				System.out.println(rs.getString("AMOUNT_COLOR"));
				System.out.println(rs.getString("AMOUNT_COUNT"));
				result = rs.getInt("AMOUNT_ID");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return result;
	}

	public ArrayList<AmountDTO> selectAllToProduct(ProductDTO product) {
		String sql = "select AMOUNT_ID,P_ID,AMOUNT_SIZE,AMOUNT_COLOR,AMOUNT_COUNT from amount where p_id = ?";
		ArrayList<AmountDTO> list = new ArrayList<AmountDTO>();
		try {

			conn = JDBCutil.connect(); // 커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product.getP_id());
			rs = pstmt.executeQuery();
			while (rs.next()) {
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
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return list;
	}

}
