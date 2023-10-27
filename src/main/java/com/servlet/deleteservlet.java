package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.jobDAO;
import com.db.DBconnect;
import com.entity.jobs;

/**
 * Servlet implementation class deleteservlet
 */
@WebServlet("/delete")
public class deleteservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
		
			jobs j = new jobs();
	
			j.setId(id);
			jobDAO dao = new jobDAO(DBconnect.getconn());

			boolean f = dao.delete_jobs(j);
			HttpSession session = request.getSession();
			if (f) {
				session.setAttribute("msg", "job deleted succesfully");
				response.sendRedirect("view_jobs.jsp");

			} else {
				session.setAttribute("msg", "error in server");
				response.sendRedirect("view_jobs.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
}
}
