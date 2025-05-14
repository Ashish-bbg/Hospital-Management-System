package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDao {

	private Connection conn;

	public AppointmentDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addAppointment(Appointment ap) {

		boolean f = false;

		try {

			String query = "insert into appointment(user_id," + " fullname," + " gender," + " age, appoint_date, email,"
					+ " phno, diseases, doctor_id," + " status, address) values(?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement pstm = conn.prepareStatement(query);

			pstm.setInt(1, ap.getUserId());
			pstm.setString(2, ap.getFullName());
			pstm.setString(3, ap.getGender());
			pstm.setString(4, ap.getAge());
			pstm.setString(5, ap.getAppointDate());
			pstm.setString(6, ap.getEmail());
			pstm.setString(7, ap.getPhNo());
			pstm.setString(8, ap.getDiseases());
			pstm.setInt(9, ap.getDoctorId());
			pstm.setString(10, ap.getStatus());
			pstm.setString(11, ap.getAddress());

			int i = pstm.executeUpdate();

			if (i == 1)
				f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<Appointment> getAllAppointmentByLoginUser(int userId) {

		List<Appointment> list = new ArrayList<Appointment>();

		Appointment ap = null;
		try {

			String query = "select * from appointment where user_id=?";
			PreparedStatement pstm = conn.prepareStatement(query);
			pstm.setInt(1, userId);

			ResultSet result = pstm.executeQuery();

			while (result.next()) {
				ap = new Appointment();
				ap.setId(result.getInt(1));
				ap.setUserId(result.getInt("user_id"));
				ap.setFullName(result.getString("fullname"));
				ap.setGender(result.getString("gender"));
				ap.setAge(result.getString("age"));
				ap.setAppointDate(result.getString("appoint_date"));
				ap.setEmail(result.getString("email"));
				ap.setPhNo(result.getString("phno"));
				ap.setDiseases(result.getString("diseases"));
				ap.setDoctorId(result.getInt("doctor_id"));
				ap.setAddress(result.getString("address"));
				ap.setStatus(result.getString("status"));

				list.add(ap);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Appointment getAppointmentById(int id) {

		Appointment ap = null;
		try {

			String query = "select * from appointment where id=?";
			PreparedStatement pstm = conn.prepareStatement(query);
			pstm.setInt(1, id);

			ResultSet result = pstm.executeQuery();

			while (result.next()) {
				ap = new Appointment();
				ap.setId(result.getInt(1));
				ap.setUserId(result.getInt("user_id"));
				ap.setFullName(result.getString("fullname"));
				ap.setGender(result.getString("gender"));
				ap.setAge(result.getString("age"));
				ap.setAppointDate(result.getString("appoint_date"));
				ap.setEmail(result.getString("email"));
				ap.setPhNo(result.getString("phno"));
				ap.setDiseases(result.getString("diseases"));
				ap.setDoctorId(result.getInt("doctor_id"));
				ap.setAddress(result.getString("address"));
				ap.setStatus(result.getString("status"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ap;
	}

	public List<Appointment> getAllAppointmentByDoctorLogin(int doctId) {

		List<Appointment> list = new ArrayList<Appointment>();

		Appointment ap = null;
		try {

			String query = "select * from appointment where doctor_id=?";
			PreparedStatement pstm = conn.prepareStatement(query);
			pstm.setInt(1, doctId);

			ResultSet result = pstm.executeQuery();

			while (result.next()) {
				ap = new Appointment();
				ap.setId(result.getInt(1));
				ap.setUserId(result.getInt("user_id"));
				ap.setFullName(result.getString("fullname"));
				ap.setGender(result.getString("gender"));
				ap.setAge(result.getString("age"));
				ap.setAppointDate(result.getString("appoint_date"));
				ap.setEmail(result.getString("email"));
				ap.setPhNo(result.getString("phno"));
				ap.setDiseases(result.getString("diseases"));
				ap.setDoctorId(result.getInt("doctor_id"));
				ap.setAddress(result.getString("address"));
				ap.setStatus(result.getString("status"));

				list.add(ap);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean updateCommentStatus(int id, int doctId, String comm) {
		boolean f = false;

		try {
			String query = "update appointment set status=? where id=? and doctor_id=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, comm);
			ps.setInt(2, id);
			ps.setInt(3, doctId);

			int i = ps.executeUpdate();
			if (i == 1)
				f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Appointment> getAllAppointment() {

		List<Appointment> list = new ArrayList<Appointment>();

		Appointment ap = null;
		try {

			String query = "select * from appointment order by id desc";
			PreparedStatement pstm = conn.prepareStatement(query);

			ResultSet result = pstm.executeQuery();

			while (result.next()) {
				ap = new Appointment();
				ap.setId(result.getInt(1));
				ap.setUserId(result.getInt("user_id"));
				ap.setFullName(result.getString("fullname"));
				ap.setGender(result.getString("gender"));
				ap.setAge(result.getString("age"));
				ap.setAppointDate(result.getString("appoint_date"));
				ap.setEmail(result.getString("email"));
				ap.setPhNo(result.getString("phno"));
				ap.setDiseases(result.getString("diseases"));
				ap.setDoctorId(result.getInt("doctor_id"));
				ap.setAddress(result.getString("address"));
				ap.setStatus(result.getString("status"));

				list.add(ap);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
