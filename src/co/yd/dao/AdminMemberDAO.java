package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
import co.yd.dto.MemberDTO;

public class AdminMemberDAO extends DAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	public static AdminMemberDAO instance = new AdminMemberDAO();

	public static AdminMemberDAO getInstance() {
		return instance;
	}

	public ArrayList<MemberDTO> SelectAll() {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		try {

			conn = JDBCutil.connect(); // 커넥트
			String sql = "select m_id,m_name,m_email,m_phone,m_address1,m_address2,g_grade from members where m_id != 'admin' and"
					+ " g_grade != 'null'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setmId(rs.getString("m_id"));
				dto.setmName(rs.getString("m_name"));
				dto.setmEmail(rs.getString("m_email"));
				dto.setmPhone(rs.getString("m_phone"));
				dto.setmAddress1(rs.getString("m_address1"));
				dto.setmAddress2(rs.getString("m_address2"));
				dto.setgGrade(rs.getString("g_grade"));

				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return list;
	}
	
	public MemberDTO addAll_O_Total_Price(MemberDTO dto){
		
		try {

			conn = JDBCutil.connect(); // 커넥트
			String sql = "select sum(o_total_price) o_total_price from orders where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto.setSumOrder(rs.getInt(1));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return dto;
	}
	
	public ArrayList<MemberDTO> selectLeaveAll(){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		try {

			conn = JDBCutil.connect(); // 커넥트
			String sql = "select m_id,m_name,m_email,m_phone,m_address1,m_address2,g_grade from members where g_grade ='null'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setmId(rs.getString("m_id"));
				dto.setmName(rs.getString("m_name"));
				dto.setmEmail(rs.getString("m_email"));
				dto.setmPhone(rs.getString("m_phone"));
				dto.setmAddress1(rs.getString("m_address1"));
				dto.setmAddress2(rs.getString("m_address2"));
				dto.setgGrade(rs.getString("g_grade"));

				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return list;
	}
	
	public MemberDTO select(String mId) {
		MemberDTO dto = new MemberDTO();
		try {

			conn = JDBCutil.connect(); // 커넥트
			String sql = "select m_id,m_name,m_email,m_phone,m_address1,m_address2,g_grade,m_Postcode from members where m_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto.setmId(rs.getString("m_id"));
				dto.setmName(rs.getString("m_name"));
				dto.setmEmail(rs.getString("m_email"));
				dto.setmPhone(rs.getString("m_phone"));
				dto.setmAddress1(rs.getString("m_address1"));
				dto.setmAddress2(rs.getString("m_address2"));
				dto.setgGrade(rs.getString("g_grade"));
				dto.setmPostcode(rs.getString("m_Postcode"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return dto;
	}

	public int delete(MemberDTO dto) {
		MemberDAO dao = new MemberDAO();
		return dao.deleteMember(dto.getmId());
	}

	public int deleteList(ArrayList<MemberDTO> list) {
		int result = 0;
		for (MemberDTO dto : list) {
			result += delete(dto);
		}
		return result;
	}
	
	public int insert(MemberDTO dto ) {
		MemberDAO dao = new MemberDAO();
		return dao.insertMember(dto);
	}
	public int update(MemberDTO dto) {
		MemberDAO dao = new MemberDAO();
		return dao.updateMember(dto);
	}

}
