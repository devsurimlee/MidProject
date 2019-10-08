package co.yd.dao;

import java.sql.SQLException;

import co.yd.common.JDBCutil;
import co.yd.dto.NoticeBoardDTO;

public class AdminNoticeBoardDAO extends NoticeBoardDAO {
	public int insert(NoticeBoardDTO dto) {
		int result = 0;
		try {

			conn = JDBCutil.connect(); // 커넥트

			String sql = "select NB_SEQ.nextval from dual";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			dto.setNbId(rs.getInt(1));

			sql = "insert into notice_board(NB_ID,NB_TITLE,NB_CONTENTS,NB_DATE,NB_HIT) " + "values(?,?,?,sysdate,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNbId());
			pstmt.setString(2, dto.getNbTitle());
			pstmt.setString(3, dto.getNbContents());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return result;
	}

	public int update(NoticeBoardDTO dto) {
		int result = 0;
		try {

			conn = JDBCutil.connect(); // 커넥트
			String sql = "update notice_board set " + "NB_TITLE = ?,NB_CONTENTS = ?,NB_DATE = sysdate,NB_HIT = ? "
					+ "where NB_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNbTitle());
			pstmt.setString(2, dto.getNbContents());
			pstmt.setInt(3, dto.getNbHit());
			pstmt.setInt(4, dto.getNbId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return result;
	}

	public int delete(int nbId) {

		int result = 0;
		try {

			conn = JDBCutil.connect(); // 커넥트
			String sql = "delete from notice_board where NB_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nbId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.disconnect(pstmt, conn); // 클로즈
		}
		return result;
	}
}
