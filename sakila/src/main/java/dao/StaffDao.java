package dao;

import java.util.*;

import util.DBUtil;

import java.sql.*;

public class StaffDao {
	public List<Map<String,Object>> selectStaffList(){
		List<Map<String,Object>> staffList = new ArrayList<>(); //다형성
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			//Class.forName("org.mariadb.jdbc.Driver");
			//conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sakila","root","java1234");
			// pw가 변경되도 DBUtil 내부 getConnection에서 변경만 하면 되도록 util.DBUtil을 만듬
			conn = DBUtil.getConnection();
			String sql = "SELECT"
					+ "	 sta.staff_id staffId,"
					+ "	 sto.store_id storeId,"
					+ "	 CONCAT(sta.first_name, ' ' , sta.last_name) staffName,"
					+ "	 sta.address_id addressId,"
					+ "  IFNULL(sta.picture, ' ') picture,"
					+ "	 CONCAT(a.address, IFNULL(a.address2, ' '), district) staffAddress,"
					+ "	 IFNULL(sta.email, ' ') email,"
					+ "	 sta.active,"
					+ "	 sta.username,"
					+ "	 IFNULL(sta.password, ' ') password,"
					+ "	 sta.last_update lastUpdate"
					+ " FROM staff sta"
					+ " INNER JOIN store sto"
					+ " INNER JOIN address a"
					+ " ON sta.store_id = sto.store_id"
					+ " AND sta.staff_id = sto.manager_staff_id"
					+ " AND sta.address_id = a.address_id;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<>();
				map.put("staffId", rs.getInt("staffId"));
				map.put("storeId", rs.getInt("storeId"));
				map.put("staffName", rs.getString("staffName"));
				map.put("addressId", rs.getInt("addressId"));
				map.put("picture", rs.getString("picture"));
				map.put("staffAddress", rs.getString("staffAddress"));
				map.put("email", rs.getString("email"));
				map.put("active", rs.getInt("active"));
				map.put("username", rs.getString("username"));
				map.put("password", rs.getString("password"));
				map.put("lastUpdate", rs.getString("lastUpdate"));
				staffList.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예외발생");
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return staffList;
	}
	
	public static void main(String[] args) {
		StaffDao dao = new StaffDao();
		List<Map<String, Object>> staffList = dao.selectStaffList();
			for(Map m : staffList) {
				System.out.print("staffId"+", ");
				System.out.print("storeId"+", ");
				System.out.print("staffName"+", ");
				System.out.print("addressId"+", ");
				System.out.print("picture"+", ");
				System.out.print("staffAddress"+", ");
				System.out.print("email"+", ");
				System.out.print("active"+", ");
				System.out.print("username"+", ");
				System.out.print("password"+", ");
				System.out.print("lastUpdate"+", ");
				System.out.println("");
			}
	}
}
