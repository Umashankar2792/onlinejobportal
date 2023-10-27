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
 * Servlet implementation class updatejobservlet
 */
@WebServlet("/update")
public class updatejobservlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String tittle = request.getParameter("tittle");
			String location = request.getParameter("location");
			String category = request.getParameter("category");
			String status = request.getParameter("status");
			String desc = request.getParameter("desc");
			jobs j = new jobs();
		
			j.setCategory(category);
			j.setDescription(desc);
			j.setLocation(location);
			j.setStatus(status);
			j.setTittle(tittle);
			j.setId(id);
			jobDAO dao = new jobDAO(DBconnect.getconn());

			boolean f = dao.update_jobs(j);
			HttpSession session = request.getSession();
			if (f) {
				session.setAttribute("msg", "job updated succesfully");
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
