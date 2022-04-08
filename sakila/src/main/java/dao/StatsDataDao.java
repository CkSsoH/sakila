package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.DBUtil;

public class StatsDataDao {
	public List<Map<String, Object>> amountByCustomer(){

		// #제일 많이 (금액) 빌려간 사람을 내림차순으로 정렬해라 (customer 별 총 amount)
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = "SELECT p.customer_id customerId,"
				+ "		CONCAT(c.first_name,' ',c.last_name) name,"
				+ " 	SUM(p.amount) total"
				+ " 	FROM payment p INNER JOIN customer c"
				+ " 	ON p.customer_id = c.customer_id"
				+ " 	GROUP BY p.customer_id"
				+ "		HAVING SUM(amount) >= 180"
				+ " 	ORDER BY SUM(amount) DESC";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<>();
				m.put("customerId", rs.getInt("customerId"));
				m.put("name", rs.getString("name"));
				m.put("total", rs.getString("total"));
				list.add(m);
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
		
		return list;// 마지막에 list 반환으로 수정
	}
	
	// rental_rate별 영화갯수
	public List<Map<String, Object>> filmCountByRentalRate(){
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = " SELECT rental_rate rentalRate, COUNT(*) rcnt"
				+ "		FROM film"
				+ "		GROUP BY rental_rate"
				+ "		ORDER BY COUNT(*) desc";
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<>();
				m.put("rentalRate", rs.getDouble("rentalRate"));
				m.put("rcnt", rs.getInt("rcnt"));
				list.add(m);
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
	
	//rating 별 영화갯수
	public List<Map<String, Object>> filmCountByRating(){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		String sql = " SELECT rating, COUNT(*) cnt"
				+ "		FROM film"
				+ "		GROUP BY rating"
				+ "		ORDER BY COUNT(*) desc";
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String,Object> m = new HashMap<>();
				m.put("rating", rs.getString("rating"));
				m.put("cnt", rs.getString("cnt"));
				list.add(m);
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
	
	//language 별 영화 갯수
	public List<Map<String, Object>> filmCountByLanguage(){
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		
		String sql = "SELECT l.name name, COUNT(*) cnt"
				+ "		FROM film f INNER JOIN language l"
				+ "		ON f.language_id = l.language_id"
				+ "		GROUP BY l.name";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Map<String, Object> m = new HashMap<>();
				m.put("name", rs.getString("name"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
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
	
	//length 별 영화갯수 (구간, 기준을 정해서)
	public List<Map<String, Object>> filmCountByLength(){
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		
		String sql = "SELECT t.length2 length, COUNT(*) cnt"
				+ "		FROM (SELECT title, LENGTH,"
				+ "			CASE when LENGTH<=60 then 'less60'"
				+ "				when LENGTH BETWEEN 61 AND 120 then 'between61and120'"
				+ "				when LENGTH between 121 and 180 then 'between121and180'"
				+ "				ELSE 'more180'"
				+ "			end LENGTH2"
				+ "		FROM film) t"
				+ "		GROUP BY t.length2";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<>();
				m.put("length", rs.getString("length"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
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
	
	//category별 영화 갯수
	public List<Map<String, Object>> filmCountByCategory(){
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		
		String sql ="SELECT c.category_id categoryId, c.name, COUNT(*) cnt"
				+ "		FROM category c"
				+ "		INNER JOIN film_category fc"
				+ "		ON c.category_id = fc.category_id"
				+ "		INNER JOIN film f"
				+ "		ON f.film_id = fc.film_id"
				+ "		GROUP BY c.category_id"
				+ "		ORDER BY c.category_id";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<>();
				m.put("categoryId", rs.getInt("categoryId"));
				m.put("name", rs.getString("name"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
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
	
	
	//매장별 요일별 매출
	public List<Map<String, Object>> storePaymentByWeek(){
		List<Map<String,Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		
		String sql = "SELECT s.store_id storeId, t.weekNum, case t.weekNum"
				+ "									when 0 then '월'"
				+ "									when 1 then '화'"
				+ "									when 2 then '수'"
				+ "									when 3 then '목'"
				+ "									when 4 then '금'"
				+ "									when 5 then '토'"
				+ "									when 6 then '일'"
				+ "								END DAYOFWEEK, t.cnt"
				+ " FROM (SELECT staff_id, WEEKDAY(payment_date) weekNum, COUNT(*) cnt"
				+ "		FROM payment"
				+ "		GROUP BY staff_id, WEEKDAY(payment_date)) t"
				+ "		INNER JOIN staff s"
				+ "		ON t.staff_id = s.staff_id"
				+ " ORDER BY store_id, t.weekNum ASC";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<>();
				m.put("storeId", rs.getInt("storeId"));
				m.put("weekNum", rs.getInt("weekNum"));
				m.put("dayOfWeek", rs.getString("dayOfWeek"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
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
	
	// actor 별 영화 출연 횟수
	public List<Map<String, Object>> actorCountByfilm(){
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		
		String sql = "SELECT a.actor_id actorId,"
				+ " 	CONCAT(a.first_name,' ',a.last_name) name, COUNT(*) cnt"
				+ "		FROM actor a"
				+ "		INNER JOIN film_actor fa"
				+ "		ON a.actor_id = fa.actor_id"
				+ "		GROUP BY a.actor_id"
				+ "		ORDER BY fa.actor_id ASC";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<>();
				m.put("actorId", rs.getInt("actorId"));
				m.put("name", rs.getString("name"));
				m.put("cnt", rs.getString("cnt"));
				list.add(m);
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
	
	//배우별 수입
	public List<Map<String,Object>> actorByIncome(){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		
		String sql ="SELECT fa.actor_id actorId,CONCAT (a.first_name,' ',a.last_name) name ,SUM(p.amount) income"
				+ "		FROM film_actor fa"
				+ "		INNER JOIN actor a"
				+ "		ON fa.actor_id =a.actor_id"
				+ "		INNER JOIN film f"
				+ "		ON f.film_id =fa.film_id"
				+ "		INNER JOIN inventory i"
				+ "		ON f.film_id = i.film_id"
				+ "		INNER JOIN rental r"
				+ "		ON r.inventory_id = i.inventory_id"
				+ "		INNER JOIN payment p"
				+ "		ON p.rental_id = r.rental_id "
				+ "		GROUP BY fa.actor_id";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<>();
				m.put("actorId", rs.getInt("actorId"));
				m.put("name", rs.getString("name"));
				m.put("income", rs.getDouble("income"));
				list.add(m);
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
	
	//나라별 고객수
	public List<Map<String,Object>> customerCountByCountry(){
		List<Map<String,Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		
		String sql ="SELECT co.country,"
				+ "		COUNT(*) cnt"
				+ "		FROM  country co"
				+ "		INNER JOIN city ci"
				+ "		ON ci.country_id = co.country_id"
				+ "		INNER JOIN address ad"
				+ "		ON ad.city_id = ci.city_id"
				+ "		INNER JOIN customer c"
				+ "		ON c.address_id = ad.address_id"
				+ "		GROUP BY co.country_id";
		
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<>();
				m.put("country", rs.getString("country"));
				m.put("cnt", rs.getInt("cnt"));
				list.add(m);
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
}
