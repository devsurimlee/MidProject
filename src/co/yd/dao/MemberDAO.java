package co.yd.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.yd.dto.MemberDTO;

public class MemberDAO extends DAO {
	PreparedStatement pstmt;
	ResultSet rs;

	public MemberDAO() {
		super();
	}

	// 지원: 1회원가입, 2회원정보수정(비밀번호, 주소, 전화번호), 3회원탈퇴(아이디, 주문목록, 게시글 남김)
	// 4주문내역조회(운송장번호 조회), 5로그인, 6아이디 찾기, 7비밀번호 찾기

	// 1. 회원가입
	// 1-1. 회원가입
	public int insertMember(MemberDTO dto) {
		// m_id, m_pw, m_name, m_email, m_phone, m_address, m_postcode, g_grade
		String sql = "insert into members values(?, ?, ?, ?, ?, ?, ?, 'green')";
		int r = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, dto.getmPw());
			pstmt.setString(3, dto.getmName());
			pstmt.setString(4, dto.getmEmail());
			pstmt.setString(5, dto.getmPhone());
			pstmt.setString(6, dto.getmAddress());
			pstmt.setString(7, dto.getmPostcode());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return r;
	}

	// 1-2. 아이디 중복 체크
	public boolean isIdCheck(String id) {
		String sql = "select * from members where m_id=?";
		boolean flag = true;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				flag = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return flag;
	}
	
	
	// 2. 회원 정보 수정(비밀번호, 주소, 전화번호)
	
	
	// 3. 회원 탈퇴(아이디, 주문 목록, 게시글은 남겨야 함)
	
	
	// 4. 주문 내역 조회(운송장번호 조회)

	
	// 5. 로그인
	public MemberDTO loginCheck(MemberDTO dto) {
		String sql = "select * from members where m_id = ? and m_pw = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, dto.getmPw());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new MemberDTO();
				dto.setmId(rs.getString("m_id"));
				dto.setgGrade(rs.getString("m_grade"));
				dto.setmName(rs.getString("m_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return dto;
	}

	
	// 6. 아이디 찾기
	
	
	// 7. 비밀번호 찾기
	
	
	// close
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
