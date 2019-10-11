package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
import co.yd.controller.SHA256Util;
import co.yd.dto.MemberDTO;
import co.yd.dto.QnaBoardDTO;

public class MemberDAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	
	//싱글톤 인스턴트화 안하고 바로 가능
	public static MemberDAO instance = new MemberDAO(); 
	
	public static MemberDAO getInstance() {
		return instance;
	}


	// 지원: 1회원가입, 2회원정보수정(전화번호, 이메일, 주소, 비밀번호), 3회원탈퇴(아이디, 주문목록, 게시글 남김)
	// 4주문내역조회(운송장번호 조회), 5로그인, 6아이디 찾기, 7비밀번호 찾기, 8내가 쓴 글 보기

	// 1. 회원가입
	// 1-1. 회원가입
	public int insertMember(MemberDTO dto) {
		// 컬럼 순서 주의!!
		// 1m_id, 2m_pw, 3m_name, 4m_email, 5m_phone, 6m_address1, 7m_postcode, 8g_grade, 9m_address2, 10m_salt
		String sql = "insert into members values(?, ?, ?, ?, ?, ?, ?, 'green', ?, ?)";
		int r = 0;
		try {
			String salt = SHA256Util.generateSalt();
			String newPassword = SHA256Util.getEncrypt(dto.getmPw(), salt);
			
			conn = JDBCutil.connect(); //커넥트
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, newPassword);
			pstmt.setString(3, dto.getmName());
			pstmt.setString(4, dto.getmEmail());
			pstmt.setString(5, dto.getmPhone());
			pstmt.setString(6, dto.getmAddress1());
			pstmt.setString(7, dto.getmPostcode());
			pstmt.setString(8, dto.getmAddress2());
			pstmt.setString(9, salt);
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return r;
	}

	// 1-2. 아이디 중복 체크 / 사용 가능하면 true / 사용 불가능 false
	public boolean isIdCheck(String id) {
		String sql = "select * from members where m_id=?";
		boolean flag = true;
		try {
			conn = JDBCutil.connect(); //커넥트

			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				flag = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}

		return flag;
	}
	
	
	// 2. 회원 정보 수정
	// 2-1. 정보 변경(전화번호, 이메일, 주소)
	public int updateMember(MemberDTO dto) {
		String sql = "update members set m_email=?, m_phone=?, m_postcode=?, m_address1=?, m_address2=?,g_grade = ? where m_id=?";
		int r = 0;
		try {
			//post 없어서 에러
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmEmail());
			pstmt.setString(2, dto.getmPhone());
			pstmt.setString(3, dto.getmPostcode());
			pstmt.setString(4, dto.getmAddress1());
			pstmt.setString(5, dto.getmAddress2());
			pstmt.setString(6, dto.getgGrade());
			pstmt.setString(7, dto.getmId());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return r;
	}
	
	// 2-2. 비밀번호 변경 -> 7.2 메서드
	
	// 3. 회원 탈퇴(아이디, 주문 목록, 게시글은 남겨야 함)
	public int deleteMember(String id) {
		// 1m_id, 2m_pw, 3m_name, 4m_email, 5m_phone, 6m_address1, 7m_postcode, 8g_grade, 9m_address2, 10m_salt
		String sql = "update members set m_pw='null', m_name='null', m_email='null', m_phone='null', m_address1='null', m_postcode='null',"
				+ "g_grade='null', m_address2='null', m_salt='null' where m_id=?";
		int r = 0;
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return r;
	}
	
	
	// 4. 주문 내역 조회(운송장번호 조회)

	
	// 5. 로그인
	public MemberDTO loginCheck(MemberDTO dto) {
		MemberDTO rdto = new MemberDTO();
		try {
			String memberSalt;
			String sql = "select * from members where m_id = ?";
			
			conn = JDBCutil.connect(); //커넥트
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
					rdto.setmEmail(rs.getString("m_email"));
					rdto.setmPhone(rs.getString("m_phone"));
					rdto.setmPostcode(rs.getString("m_postcode"));
					rdto.setmAddress1(rs.getString("m_address1"));
					rdto.setmAddress2(rs.getString("m_address2"));
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return rdto;
	}
	
	
	// 6. 아이디 찾기
	public String forgotId(String name, String email) {
		String sql = "select m_id from members where m_name=? and m_email=?";
		String getId = null;
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				getId = rs.getString("m_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return getId;
	}
	
	
	// 7. 비밀번호 찾기
	// 7-1. 비밀번호를 찾기 위해 등록된 회원정보가 맞는지 체크
	public int forgotPw(MemberDTO dto) {
		String sql = "select m_id from members where m_id=? and m_name=? and m_email=?";
		int r = 0;
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, dto.getmName());
			pstmt.setString(3, dto.getmEmail());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return r;
	}
	
	// 7-2. 비밀번호 바꿈
	public int resetPw(String id, String pw) {
		String sql = "update members set m_pw=?, m_salt=? where m_id=?";
		int r = 0;
		try {
			String salt = SHA256Util.generateSalt();
			String newPassword = SHA256Util.getEncrypt(pw, salt);
			
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, salt);
			pstmt.setString(3, id);
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return r;
	}
	
	// 7-3. 현재 비밀번호 확인
	public boolean checkPw(String id, String pw) {
		boolean flag = false;
		try {
			String memberSalt;
			String sql = "select * from members where m_id = ?";
			
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// 해당 아이디의 salt를 가져와서
				memberSalt = rs.getString("m_salt");
				
				// salt를 이용해서 입력 받은 비밀번호를 암호화한다
				String inputPassword = pw;
				String newPassword = SHA256Util.getEncrypt(inputPassword, memberSalt);
				
				// 이제 비밀번호 맞는지 체크
				if(newPassword.equals(rs.getString("m_pw"))) {
					flag = true;
				}
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return flag;
	}
	
	
	// 8. 내가 쓴 글 보기
	public ArrayList<QnaBoardDTO> myBoardList(String id) {
		QnaBoardDTO dto = new QnaBoardDTO();
		ArrayList<QnaBoardDTO> list = new ArrayList<>();
		// 1qb_id  2m_id  3qb_title  4qb_contents  5qb_date  6qb_hit  7qb_origin  8qb_pw
		String sql = "select q.qb_id, q.m_id, m.m_name, q.qb_title, q.qb_contents, q.qb_date, q.qb_hit, q.qb_pw "
						+ "from qna_board q, members m where q.m_id = m.m_id and q.m_id = ?";
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new QnaBoardDTO();
				dto.setQbId(rs.getInt("qb_id"));
				dto.setmId(rs.getString("m_id"));
				dto.setmName(rs.getString("m_name"));
				dto.setQbTitle(rs.getString("qb_title"));
				dto.setQbContents(rs.getString("qb_contents"));
				dto.setQbDate(rs.getDate("qb_date"));
				dto.setQbHit(rs.getInt("qb_hit"));
				dto.setQbPw(rs.getInt("qb_pw"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return list;
	}
}
