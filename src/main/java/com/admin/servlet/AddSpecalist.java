package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecalistDAO;
import com.db.DBConnect;


@WebServlet("/addSpecalist")
public class AddSpecalist extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String specName = req.getParameter("specName");
		
		SpecalistDAO dao = new SpecalistDAO(DBConnect.getConn());
		boolean f = dao.addSpecalist(specName);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Specalist Added");
			resp.sendRedirect("admin/index.jsp");
			
			
		}else {
			session.setAttribute("errorMsg", "Something wrong on server");
			resp.sendRedirect("admin/index.jsp");
		}
		
		
		
	}

	
	
	
	
}
