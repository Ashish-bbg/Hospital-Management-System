package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class DoctorDao {

	private Connection conn;

	public DoctorDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean registerDoctor(Doctor d) {

		boolean f = false;

		try {

			String query = "insert into doctor(full_name, dob, qualification, specalist, email, mobno, password) values(?,?,?,?,?,?,?)";

			PreparedStatement pstm = conn.prepareStatement(query);
			pstm.setString(1, d.getFullName());
			pstm.setString(2, d.getDob());
			pstm.setString(3, d.getQualification());
			pstm.setString(4, d.getSpecialist());
			pstm.setString(5, d.getEmail());
			pstm.setString(6, d.getMobNo());
			pstm.setString(7, d.getPassword());

			int i = pstm.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Doctor> getAllDoctor() {
		List<Doctor> list = new ArrayList<Doctor>();

		try {
			String query = "select * from doctor order by id desc";
			PreparedStatement pstm = conn.prepareStatement(query);

			ResultSet result = pstm.executeQuery();
			Doctor d = null;
			while (result.next()) {
				d = new Doctor();
				d.setId(result.getInt("id"));
				d.setFullName(result.getString("full_name"));
				d.setDob(result.getString("dob"));
				d.setEmail(result.getString("email"));
				d.setQualification(result.getString("qualification"));
				d.setMobNo(result.getString("mobno"));
				d.setPassword(result.getString("password"));
				d.setSpecialist(result.getString("specalist"));

				list.add(d);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public Doctor getDoctorById(int id) {
		Doctor d = null;
		try {

			String query = "select * from doctor where id=?";
			PreparedStatement pstm = conn.prepareStatement(query);
			pstm.setInt(1, id);

			ResultSet result = pstm.executeQuery();

			while (result.next()) {
				d = new Doctor();
				d.setId(result.getInt("id"));
				d.setDob(result.getString("dob"));
				d.setEmail(result.getString("email"));
				d.setFullName(result.getString("full_name"));
				d.setMobNo(result.getString("mobno"));
				d.setPassword(result.getString("password"));
				d.setQualification(result.getString("qualification"));
				d.setSpecialist(result.getString("specalist"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}

	public boolean updateDoctor(Doctor d) {
		boolean f = false;

		try {
			String query = "update doctor set full_name=?," + " dob=?, qualification=?," + " specalist=?, email=?,"
					+ " mobno=?, password=? where id=?";
			PreparedStatement pstm = conn.prepareStatement(query);

			pstm.setString(1, d.getFullName());
			pstm.setString(2, d.getDob());
			pstm.setString(3, d.getQualification());
			pstm.setString(4, d.getSpecialist());
			pstm.setString(5, d.getEmail());
			pstm.setString(6, d.getMobNo());
			pstm.setString(7, d.getPassword());
			pstm.setInt(8, d.getId());

			int i = pstm.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteDoctor(int id) {
		boolean f = false;

		try {

			String query = "DELETE FROM doctor WHERE id=?";
			PreparedStatement pstm = conn.prepareStatement(query);
			pstm.setInt(1, id);

			int i = pstm.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public Doctor login(String email, String password) {

		Doctor d = null;

		try {

			String sql = "select * from doctor where email=? and password=?";

			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, email);
			pstm.setString(2, password);

			ResultSet result = pstm.executeQuery();

			while (result.next()) {
				d = new Doctor();
				d.setId(result.getInt("id"));
				d.setDob(result.getString("dob"));
				d.setEmail(result.getString("email"));
				d.setFullName(result.getString("full_name"));
				d.setMobNo(result.getString("mobno"));
				d.setPassword(result.getString("password"));
				d.setQualification(result.getString("qualification"));
				d.setSpecialist(result.getString("specalist"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}
	
	/********/
	// count 
	
	public int utilCount(String name) {
		int i = 0;
		try {
			String query = "select count(*) from" + " " + name;
			PreparedStatement pstm = conn.prepareStatement(query);
			ResultSet result = pstm.executeQuery();
			if(result.next()) {
				i = result.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public int countDoctor() {
		return utilCount("doctor");
	}

	public int countUser() {
		return utilCount("user_details");
	}
	
	public int countAppointment() {
		return utilCount("appointment");
	}
	
	public int countSpecalist() {
		return utilCount("specalist");
	}
	
	
	public int countAppointmentByDoctorId(int id) {
		int i = 0;
		try {
			String query = "select count(*) from appointment where doctor_id=?";
			PreparedStatement pstm = conn.prepareStatement(query);
			pstm.setInt(1, id);
			ResultSet result = pstm.executeQuery();
			if(result.next()) {
				i = result.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public boolean checkOldPassword(int userId, String oldPassword) {
		boolean f = false;
		try {
			
			String query = "select * from doctor where id=? and password=?";
			
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
			
			String query = "update doctor set password=? where id=?";
			
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
	
	public boolean editDoctorProfile(Doctor d) {
		boolean f = false;

		try {
			String query = "update doctor set full_name=?," + " dob=?, qualification=?," + " specalist=?, email=?,"
					+ " mobno=? where id=?";
			PreparedStatement pstm = conn.prepareStatement(query);

			pstm.setString(1, d.getFullName());
			pstm.setString(2, d.getDob());
			pstm.setString(3, d.getQualification());
			pstm.setString(4, d.getSpecialist());
			pstm.setString(5, d.getEmail());
			pstm.setString(6, d.getMobNo());
			pstm.setInt(7, d.getId());

			int i = pstm.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	

}
