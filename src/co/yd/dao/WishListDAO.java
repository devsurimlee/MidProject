package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
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
	
	
	public WishListDTO delectAllWishList(WishListDTO dto) {
		String sql = "delete from wish_list where m_id = ?";
		
		try {
			conn = JDBCutil.connect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getM_id());
			
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 위시리스트 삭제완료");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		
		return dto;
	}
	
	
	
	public WishListDTO delectWishList (WishListDTO dto) {
		String sql = "delete wish_list where m_id= ? and p_id= ? ";
		conn = JDBCutil.connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getM_id());
			pstmt.setInt(2, dto.getP_id());
			
			int r = pstmt.executeUpdate();
			System.out.println(r + "위시리스트 삭제 삭제완료");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		
		return dto;
	}
	
	
	public WishListDTO insertWishList (WishListDTO dto) {
		String sql = "select wishlist_seq.nextval from dual";
		conn = JDBCutil.connect();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			
			dto.setWishList_id(rs.getInt(1));
			//1)인덱스, 2)유저아이디, 3) 물품명
			sql = "insert into wish_list values(?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getWishList_id());
			pstmt.setString(2, dto.getM_id());
			pstmt.setInt(3, dto.getP_id());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return dto;
	}
	
	
	
	public ArrayList<WishListDTO> selectWishlist (WishListDTO wdto) { 
		  String sql = "select w.w_id, w.m_id, w.p_id, p.p_name, p.p_price, p.p_size, p.p_color, p.p_detail "
				  	+ "from wish_list w, product p " + "where w.p_id = p.p_id and w.m_id = ? ";
	  
		  ArrayList<WishListDTO> optionList = new ArrayList<WishListDTO>();
	  
		  try { 
			  	conn = JDBCutil.connect();
			  	pstmt = conn.prepareStatement(sql);
			  	pstmt.setString(1, wdto.getM_id()); 
			  	rs = pstmt.executeQuery();
		  
			  while(rs.next()) { 
				  WishListDTO dto = new WishListDTO();
				  dto.setWishList_id(rs.getInt("w_id"));
				  dto.setM_id(rs.getString("m_id"));
				  dto.setP_id(rs.getInt("p_id"));
				  dto.setP_name(rs.getString("p_name"));
				  dto.setP_price(rs.getInt("p_price"));
				  dto.setP_size(rs.getString("p_size"));
				  dto.setP_color(rs.getString("p_color"));
				  dto.setP_detail(rs.getString("p_detail"));
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
