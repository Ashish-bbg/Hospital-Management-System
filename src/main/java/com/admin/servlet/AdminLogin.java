package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			String adminUser = "admin@gmail.com";
			String adminPass = "admin123";
			HttpSession session = req.getSession();
			if(adminUser.equals(email) && adminPass.equals(password)) {
				
				session.setAttribute("adminObj", new User() );
				resp.sendRedirect("admin/index.jsp");
			}
			else {
				session.setAttribute("errorMessage", "Invalid Email or Password");
				resp.sendRedirect("admin_login.jsp");
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
		
	
	
	
}
