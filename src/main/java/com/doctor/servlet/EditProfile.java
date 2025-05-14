package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/doctorUpdateProfile")
public class EditProfile extends HttpServlet {

	/**
		 * 
		 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String fullName = req.getParameter("full_name");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String spec = req.getParameter("specalist");
			String email = req.getParameter("email");
			String mobNo = req.getParameter("mob_no");

			int id = Integer.parseInt(req.getParameter("id"));

			Doctor d = new Doctor(id, fullName, dob, qualification, spec, email, mobNo, "");

			DoctorDao dao = new DoctorDao(DBConnect.getConn());

			HttpSession session = req.getSession();

			if (dao.editDoctorProfile(d)) {
				Doctor upadateDoctor = dao.getDoctorById(id);
				session.setAttribute("succMsg", "Doctor Updated Successfully");
				session.setAttribute("doctObj", upadateDoctor);
				resp.sendRedirect("doctor/edit_profile.jsp");
			} else {
				session.setAttribute("errorMsg", "Something went wrong...");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
