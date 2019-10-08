package co.yd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yd.common.JDBCutil;
import co.yd.dto.NoticeBoardDTO;

public class NoticeBoardDAO extends DAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	
	//싱글톤 인스턴트화 안하고 바로 가능
	public static NoticeBoardDAO instance = new NoticeBoardDAO(); 
	
	public static NoticeBoardDAO getInstance() {
		return instance;
	}
	
	// 지원: 공지글 리스트, 공지글 조회, 공지글 남기기, 공지글 수정, 공지글 삭제
	
	// 1. 공지 리스트
	public ArrayList<NoticeBoardDTO> noticeList() {
		NoticeBoardDTO dto = new NoticeBoardDTO();
		ArrayList<NoticeBoardDTO> list = new ArrayList<>();
		// 1nb_id  2nb_title  3nb_contents  4nb_date  5nb_hit
		String sql = "select * from notice_board order by nb_id desc";
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new NoticeBoardDTO();
				dto.setNbId(rs.getInt("nb_id"));
				dto.setNbTitle(rs.getString("nb_title"));
				dto.setNbContents(rs.getString("nb_contents"));
				dto.setNbDate(rs.getDate("nb_date"));
				dto.setNbHit(rs.getInt("nb_hit"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return list;
	}
	
	
	// 2. 공지글 한 개 조회
	// 2-1. 글 조회
	public NoticeBoardDTO noticeRead(int nbId) {
		NoticeBoardDTO dto = new NoticeBoardDTO();
		// 1nb_id  2nb_title  3nb_contents  4nb_date  5nb_hit
		String sql = "select * from notice_board where nb_id = ?";
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nbId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNbId(rs.getInt("nb_id"));
				dto.setNbTitle(rs.getString("nb_title"));
				dto.setNbContents(rs.getString("nb_contents"));
				dto.setNbDate(rs.getDate("nb_date"));
				dto.setNbHit(rs.getInt("nb_hit"));
				
				readCount(nbId);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return dto;
	}
	
	// 2-2. 조회수 올리기
	private void readCount(int nbId) {
		String sql = "update notice_board set nb_hit=nb_hit+1 where nb_id=? ";
		
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
	
	
	// 3. 공지글 쓰기
	public int noticeWrite(NoticeBoardDTO dto) {
		int r = 0;
		// 1nb_id  2nb_title  3nb_contents  4nb_date  5nb_hit
		String sql = "insert into notice_board values(nb_seq.nextval, ?, ?, sysdate, 0)";
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNbTitle());
			pstmt.setString(2, dto.getNbContents());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return r;
	}
	
	// 4. 공지글 수정
	public int noticeUpdate(NoticeBoardDTO dto) {
		int r = 0;
		// 1nb_id  2nb_title  3nb_contents  4nb_date  5nb_hit
		String sql = "update notice_board set nb_title=?, nb_contents=?, nb_date=sysdate where nb_id=?";
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNbTitle());
			pstmt.setString(2, dto.getNbContents());
			pstmt.setInt(3, dto.getNbId());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return r;
	}
	
	// 5. 공지글 삭제
	public int noticeDelete(int nbId) {
		int r = 0;
		String sql = "delete from notice_board where nb_id = ?";
		try {
			conn = JDBCutil.connect(); //커넥트
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nbId);
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return r;
	}
}
