package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import util.DBUtil;
import vo.CustomerList;

public class CustomerListDao {
	public List<CustomerList> selectCustomerListByPage(int beginRow, int rowPerPage) {
		
		List<CustomerList> list = new ArrayList<CustomerList>();
		Connection conn = null;
		conn = DBUtil.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT id, name, address, zip_code zipCode, phone, city, country, notes, SID sId FROM customer_list LIMIT ?,?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();
			while(rs.next()) {
				CustomerList c = new CustomerList();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setAddress(rs.getString("address"));
				System.out.println("test1");
				System.out.println(rs.getString("zipCode"));
				System.out.println("test2");
				System.out.println(rs.getInt("zipCode"));
				System.out.println("test3");
				c.setZipCode(rs.getInt("zipCode"));
				c.setPhone(rs.getLong("phone"));
				c.setCity(rs.getString("city"));
				c.setCountry(rs.getString("country"));
				c.setNotes(rs.getString("notes"));
				c.setsId(rs.getInt("sId"));
				list.add(c);
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
	public int totalRow() {
		int totalRow = 0;
		//DB연결
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DBUtil.getConnection();
		
		String sql = "SELECT COUNT(*) cnt FROM customer_list";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				totalRow = rs.getInt("cnt");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
		return totalRow;
	}
}
