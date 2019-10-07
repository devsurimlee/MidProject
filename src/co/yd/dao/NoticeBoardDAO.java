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
		String sql = "select * from notice_board";
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
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); //클로즈
		}
		return dto;
	}
	
	// 3. 공지글 쓰기
	
	// 4. 공지글 수정
	
	// 5. 공지글 삭제
}
