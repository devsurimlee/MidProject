package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
import co.yd.dto.QnaBoardDTO;

public class QnaBoardDAO extends DAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	
	//싱글톤 인스턴트화 안하고 바로 가능
	public static QnaBoardDAO instance = new QnaBoardDAO(); 
	
	public static QnaBoardDAO getInstance() {
		return instance;
	}
	
	// 지원: 문의글 리스트(카테고리별), 문의글 조회, 문의글 남기기, 답글 달기, 문의글 삭제
	
	// 1. 카테고리별 문의글 리스트(title로 카테고리를 받아온다)
	// 답글은 빼고 그냥 고객이 문의한 글만 받아옴
	public ArrayList<QnaBoardDTO> qnaList(String title) {
		QnaBoardDTO dto = new QnaBoardDTO();
		ArrayList<QnaBoardDTO> list = new ArrayList<>();
		// 1qb_id  2m_id  3qb_title  4qb_contents  5qb_date  6qb_hit  7qb_origin  8qb_pw
		String sql = "select q.qb_id, q.m_id,(select m_name from members m where m.m_id = q.m_id) m_name, " +
					"q.qb_title, q.qb_contents, q.qb_date, q.qb_hit, q.qb_pw " + 
					"from qna_board q " + 
					"where q.qb_origin is null and q.qb_title = ?";
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new QnaBoardDTO();
				dto.setQbId(rs.getInt("qb_id"));
				String mId = rs.getString("m_id");
				dto.setmId(mId);
				if(mId.equals(""))
					dto.setmName(mId);
				else
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

	
	// 2. 문의글 조회
	// 2-1. 문의글 하나 조회(고객이 쓴 거)
	public QnaBoardDTO qnaRead(int qbId) {
		QnaBoardDTO dto = new QnaBoardDTO();
		// 1qb_id  2m_id  3qb_title  4qb_contents  5qb_date  6qb_hit  7qb_origin  8qb_pw
		String sql = "select q.qb_id, q.m_id, m.m_name, q.qb_title, q.qb_contents, q.qb_date, q.qb_hit, q.qb_origin, q.qb_pw " + 
					"from qna_board q, members m " + 
					"where q.m_id = m.m_id and q.qb_id=? and q.qb_origin is null";
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qbId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setQbId(rs.getInt("qb_id"));
				dto.setmId(rs.getString("m_id"));
				dto.setmName(rs.getString("m_name"));
				dto.setQbTitle(rs.getString("qb_title"));
				dto.setQbContents(rs.getString("qb_contents"));
				dto.setQbDate(rs.getDate("qb_date"));
				dto.setQbHit(rs.getInt("qb_hit"));
				dto.setQbOrigin(rs.getInt("qb_origin"));
				dto.setQbPw(rs.getInt("qb_pw"));
				
				readCount(qbId);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return dto;
	}
	
	// 2-2. 비밀번호 체크
	public int qnaPasswordCheck(int qbId, int qbPw) {
		int r = 0;
		String sql = "select * from qna_board where qb_id=? and qb_pw=?";
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qbId);
			pstmt.setInt(2, qbPw);
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return r;
	}
	
	// 2-3. 조회수 올리기
	private void readCount(int nbId) {
		String sql = "update qna_board set qb_hit=qb_hit+1 where qb_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nbId);
			pstmt.execute();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
	}
	
	// 2-4. 답글 조회
	public QnaBoardDTO qnaReadAnswer(int qbOrigin) {
		QnaBoardDTO dto = new QnaBoardDTO();
		// 1qb_id  2m_id  3qb_title  4qb_contents  5qb_date  6qb_hit  7qb_origin  8qb_pw
		String sql = "select * from qna_board where qb_origin=?";
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qbOrigin);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setQbId(rs.getInt("qb_id"));
				dto.setQbTitle(rs.getString("qb_title"));
				dto.setQbContents(rs.getString("qb_contents"));
				dto.setQbDate(rs.getDate("qb_date"));
				dto.setQbHit(rs.getInt("qb_hit"));
				dto.setQbOrigin(rs.getInt("qb_origin"));
				dto.setQbPw(rs.getInt("qb_pw"));
				
				readCount(rs.getInt("qb_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return dto;
	}
	
	
	// 3. 문의글 작성
	public int qnaWrite(QnaBoardDTO dto) {
		int r = 0;
		// 1qb_id  2m_id  3qb_title  4qb_contents  5qb_date  6qb_hit  7qb_origin  8qb_pw
		String sql = "insert into qna_board values(qb_seq.nextval, ?, ?, ?, sysdate, 0, null, ?)";
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, dto.getQbTitle());
			pstmt.setString(3, dto.getQbContents());
			pstmt.setInt(4, dto.getQbPw());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return r;
	}
	
	
	// 4. 답글 달기
	public int qnaWriteAnswer(QnaBoardDTO dto) {
		int r = 0;
		// 1qb_id  2m_id  3qb_title  4qb_contents  5qb_date  6qb_hit  7qb_origin  8qb_pw
		String sql = "insert into qna_board values(qb_seq.nextval, 'admin', '답변입니다ʕ·͡ᴥ·ʔﾉ', ?, sysdate, 0, ?, ?)";
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getQbContents());
			pstmt.setInt(2, dto.getQbOrigin());
			pstmt.setInt(3, dto.getQbPw());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return r;
	}
	
	
	// 5. 문의글 삭제
	public int qnaDelete(int qbId) {
		int r = 0;
		String sql = "delete from qna_board where qb_id = ?";
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qbId);
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return r;
	}
}
