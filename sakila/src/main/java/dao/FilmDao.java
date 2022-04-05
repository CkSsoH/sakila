package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.DBUtil;

public class FilmDao {
	//filmInStock 프로시져
	public Map<String, Object> filmInStockCall(int filmId, int storeId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		Connection conn = null;
		//PreparedStatement : 쿼리를 실행하는 타입
		//CallableStatement : 프로시저를 실행하는 타입
		CallableStatement stmt = null;
		ResultSet rs = null;
		//select inventory_id...
		List<Integer> list = new ArrayList<>();
		//select count(inventory_id)...
		Integer count = 0;
		conn = DBUtil.getConnection();
		try {
			stmt = conn.prepareCall("{CALL film_in_stock(?, ?, ?)}");
			stmt.setInt(1, filmId);
			stmt.setInt(2, storeId);
			stmt.registerOutParameter(3, Types.INTEGER);
			rs = stmt.executeQuery(); // 위의 쿼리 실행
			while(rs.next()) {
				list.add(rs.getInt(1)); //rs.getInt("inventory_id") 이거랑 같은것
			}
			//프로시저 3번째 OUT 변수 값
			count = stmt.getInt(3); // 실행시키고 나서 3번째 물음표에 들어가는 값을 받아주세요 라는것
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		map.put("list", list);
		map.put("count", count);
		
		return map;
	}
	
	//filmNotInStock 프로시져
	public Map<String, Object> filmNotInStockCall(int filmId, int storeId){
		Map<String, Object> map = new HashMap<String, Object>();
		
		Connection conn = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		List<Integer> list = new ArrayList<>();
		Integer count = 0;
		conn = DBUtil.getConnection();
		try {
			cstmt = conn.prepareCall("{CALL film_Not_in_stock(?, ?, ?)}");
			cstmt.setInt(1, filmId);
			cstmt.setInt(2, storeId);
			cstmt.registerOutParameter(3, Types.INTEGER);
			rs = cstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt(1));
			}
			count = cstmt.getInt(3);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		map.put("list", list);
		map.put("count", count);
		
		return map;
	}
	
	// 위 코드 테스트 (jsp 에서 해야함)
	public static void main(String[] args) {
		FilmDao fd = new FilmDao();
		int filmId = 1;
		int storeId = 2;
		Map<String, Object> map = fd.filmInStockCall(filmId, storeId);
		List<Integer> list = (List<Integer>)(map.get("list")); //List<Integer>로 형변환
		int count = (Integer)map.get("count");
		
		System.out.println(filmId + "번 영화가 " + storeId + "번 가게에 " + count + "개 남음");
		for(int id : list) {
			System.out.println(id);
		}
		// filmNotInStock
		Map<String,Object> map2 = fd.filmNotInStockCall(filmId, storeId);
		List<Integer> list2 =  (List<Integer>)map2.get("list");
		int count2 = (Integer)map2.get("count");
		System.out.println(filmId + "번 영화가 " + storeId + "번 가게에서 " + count2 + "개 나감");
		for(int i : list2) {
			System.out.println(i);
		}
	}
}
