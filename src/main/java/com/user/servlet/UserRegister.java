package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String fullName = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String redirect = req.getParameter("redirect");

			User user = new User(fullName, email, password);

			UserDAO userDao = new UserDAO(DBConnect.getConn());
			boolean f = userDao.UserRegister(user);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("userObj", user);
				if (!redirect.isEmpty() && redirect.equals("index.jsp")) {
					resp.sendRedirect(redirect);
				}
				else {
					session.setAttribute("successMessage", "Register Successfull");
					resp.sendRedirect("signup.jsp");
				}

				System.out.println("Data inserted successfully...");
			} else {
				session.setAttribute("errorMessage", "Something wrong on server");
				System.out.println("Something went wrong...");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
