package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specalist;

public class SpecalistDAO {

	private Connection conn;

	public SpecalistDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addSpecalist(String spe) {
		boolean f = false;
		try {
			String query = "insert into specalist(spec_name) values(?)";
			PreparedStatement pstm = conn.prepareStatement(query);

			pstm.setString(1, spe);
			int i = pstm.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public List<Specalist > getAllSpecalist() {
		List<Specalist> list = new ArrayList<Specalist>();
		Specalist s = null;
		try {
			
			String query = " select * from specalist";
			PreparedStatement pstm = conn.prepareStatement(query);
			
			ResultSet result = pstm.executeQuery();
			
			while(result.next()) {
				
				s = new Specalist();
				s.setId(result.getInt(1));
				s.setSpecalistName(result.getString(2));
				list.add(s);
				
			}
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		return list;
		
		
	}
	
	

}
