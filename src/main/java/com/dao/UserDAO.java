package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {
		
	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean UserRegister(User u) {
		boolean f = false;
		try {
			
			String query = "insert into user_details(full_name, email, password) values(?,?,?)";
			PreparedStatement pstm = conn.prepareStatement(query);
			pstm.setString(1, query);	
			
			pstm.setString(1, u.getFullName());
			pstm.setString(2, u.getEmail());
			pstm.setString(3, u.getPassword());
			
			
			int i = pstm.executeUpdate();
			if(i==1){
				f = true;
			}else {
				f = false;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	public User login(String email, String password) {
		User u = null;
		
		try{
			
			String query = "select * from user_details where email=? and password=?";
			PreparedStatement pstm = conn.prepareStatement(query);
			pstm.setString(1, email);
			pstm.setString(2, password);
			
			ResultSet result = pstm.executeQuery();
			
			while(result.next()) {
				u = new User();
				u.setId(result.getInt("id"));
				u.setFullName(result.getString("full_name"));
				u.setEmail(result.getString("email"));
				u.setPassword(result.getString("password"));
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return u;
	}
	
	public boolean checkOldPassword(int userId, String oldPassword) {
		boolean f = false;
		try {
			
			String query = "select * from user_details where id=? and password=?";
			
			PreparedStatement pstm = conn.prepareStatement(query);
			pstm.setInt(1, userId);
			pstm.setString(2, oldPassword);
			
			ResultSet result = pstm.executeQuery();
			if(result.next()) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean changePassword(int userId, String newPassword) {
		boolean f = false;
		try {
			
			String query = "update user_details set password=? where id=?";
			
			PreparedStatement pstm = conn.prepareStatement(query);
			pstm.setString(1, newPassword);
			pstm.setInt(2, userId);
						
			int result = pstm.executeUpdate();
			if(result==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
}
