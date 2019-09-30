package co.yd.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.yd.controller.SHA256Util;
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
		// 컬럼 순서 주의!!
		// 1m_id, 2m_pw, 3m_name, 4m_email, 5m_phone, 6m_address1, 7m_postcode, 8g_grade, 9m_address2, 10m_salt
		String sql = "insert into members values(?, ?, ?, ?, ?, ?, ?, 'green', '일단 임시 상세주소', ?)";
		int r = 0;
		try {
			String salt = SHA256Util.generateSalt();
			String newPassword = SHA256Util.getEncrypt(dto.getmPw(), salt);

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, newPassword);
			pstmt.setString(3, dto.getmName());
			pstmt.setString(4, dto.getmEmail());
			pstmt.setString(5, dto.getmPhone());
			pstmt.setString(6, dto.getmAddress1());
			pstmt.setString(7, dto.getmPostcode());
//			pstmt.setString(8, dto.getmAddress2());
			pstmt.setString(8, salt);
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
		MemberDTO rdto = new MemberDTO();
		try {
			String memberSalt;
			String sql = "select * from members where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// 해당 아이디의 salt를 가져와서
				memberSalt = rs.getString("m_salt");
				
				// salt를 이용해서 입력 받은 비밀번호를 암호화한다
				String inputPassword = dto.getmPw();
				String newPassword = SHA256Util.getEncrypt(inputPassword, memberSalt);
				
				// 이제 로그인 체크
				if(newPassword.equals(rs.getString("m_pw"))) {
					rdto.setmId(rs.getString("m_id"));
					rdto.setmName(rs.getString("m_name"));
					rdto.setgGrade(rs.getString("g_grade"));
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		close();
		return rdto;
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
