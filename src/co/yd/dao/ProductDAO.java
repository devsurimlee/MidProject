package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
import co.yd.dto.ProductDTO;

public class ProductDAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;

	// 싱글톤 인스턴트화 안하고 바로 가능
	public static ProductDAO instance = new ProductDAO();

	public static ProductDAO getInstance() {
		return instance;
	}

	public int insert(ProductDTO dto) {

		int result = 0;
		try {

			conn = JDBCutil.connect(); // 커넥트

			String sql = "select PRODUCT_SEQ.nextval from dual";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			dto.setP_id(rs.getInt(1));
			
			sql = "insert into product(P_ID,P_NAME,P_PRICE,P_SIZE,P_COLOR,P_DETAIL,P_CATEGORY,P_SHOW_STATE) "
					+ "values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getP_id());
			pstmt.setString(2, dto.getP_name());
			pstmt.setInt(3, dto.getP_price());
			pstmt.setString(4, dto.getP_size());
			pstmt.setString(5, dto.getP_color());
			pstmt.setString(6, dto.getP_detail());
			pstmt.setString(7, dto.getP_category());
			pstmt.setString(8, dto.getP_show_state());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return result;

	}

	public int update(ProductDTO dto) {
		String sql = "update product set "
				+ "P_NAME = ?,P_PRICE = ?,P_DETAIL = ?,"
				+ "P_CATEGORY = ?,"
				+ "P_SHOW_STATE = ? "
				+ "where P_ID = ?";

		int result = 0;
		try {

			conn = JDBCutil.connect(); // 커넥트

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getP_name());
			pstmt.setInt(2, dto.getP_price());
			pstmt.setString(3, dto.getP_detail());
			pstmt.setString(4, dto.getP_category());
			pstmt.setString(5, dto.getP_show_state());
			pstmt.setInt(6, dto.getP_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return result;
	}

	public int delete(ProductDTO dto) {
		int result = 0;
		String sql = "delete from product where P_ID = ?";

		try {
			conn = JDBCutil.connect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getP_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return result;
	}

	public ArrayList<ProductDTO> selectAll() {
		String sql = "select P_ID,P_NAME,P_PRICE,P_SIZE,P_COLOR,P_DETAIL,P_CATEGORY,P_SHOW_STATE " + "from product";
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			conn = JDBCutil.connect();
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
	
	public ProductDTO select(int p_id){
		String sql = "select P_ID,P_NAME,P_PRICE,P_SIZE,P_COLOR,P_DETAIL,P_CATEGORY,P_SHOW_STATE " + "from product where p_id = ?";
		ProductDTO dto = new ProductDTO();
		try {
			conn = JDBCutil.connect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setP_id(rs.getInt("P_ID"));
				dto.setP_name(rs.getString("P_NAME"));
				dto.setP_price(rs.getInt("P_PRICE"));
				dto.setP_size(rs.getString("P_SIZE"));
				dto.setP_color(rs.getString("P_COLOR"));
				dto.setP_detail(rs.getString("P_DETAIL"));
				dto.setP_category(rs.getString("P_CATEGORY"));
				dto.setP_show_state(rs.getString("P_SHOW_STATE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return dto;
	}
	
	public ProductDTO select(String p_name){
		String sql = "select P_ID,P_NAME,P_PRICE,P_SIZE,P_COLOR,P_DETAIL,P_CATEGORY,P_SHOW_STATE " + "from product where p_name = ?";
		ProductDTO dto = new ProductDTO();
		try {
			conn = JDBCutil.connect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setP_id(rs.getInt("P_ID"));
				dto.setP_name(rs.getString("P_NAME"));
				dto.setP_price(rs.getInt("P_PRICE"));
				dto.setP_size(rs.getString("P_SIZE"));
				dto.setP_color(rs.getString("P_COLOR"));
				dto.setP_detail(rs.getString("P_DETAIL"));
				dto.setP_category(rs.getString("P_CATEGORY"));
				dto.setP_show_state(rs.getString("P_SHOW_STATE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return dto;
	}

}
