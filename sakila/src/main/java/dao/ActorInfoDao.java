package dao;

import java.util.ArrayList;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBUtil;
import vo.ActorInfo;

public class ActorInfoDao {
	public List<ActorInfo> selectActorInfoListByPage(int beginRow, int rowPerPage) {
		List<ActorInfo> list = new ArrayList<ActorInfo>();
		Connection conn = null;
		conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT actor_id actorId, first_name firstName, last_name lastName, film_info filmInfo FROM actor_info ORDER BY actor_id LIMIT ?,?";

		try{
			stmt = conn.prepareStatement(sql);
			//? 채우기
			stmt.setInt(1,beginRow);
			stmt.setInt(2, rowPerPage);
			//rs.next()... list.add
			rs = stmt.executeQuery();
			while(rs.next()){
				ActorInfo a = new ActorInfo();
				a.setActorId(rs.getInt("actorId"));
				a.setFirstName(rs.getString("firstName"));
				a.setLastName(rs.getString("lastName"));
				a.setFilmInfo(rs.getString("filmInfo"));
				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	// 총 행의 갯수 
	public int selectActorInfoTotalRow() {
		int totalRow = 0;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		
		String sql = "SELECT COUNT(*) cnt FROM actor_info";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				totalRow = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return totalRow;
		
	}
}
