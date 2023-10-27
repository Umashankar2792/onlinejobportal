package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.*;

import java.io.IOException;
import java.sql.Connection;

import org.apache.catalina.Session;

import com.dao.jobDAO;
import com.db.DBconnect;
import com.entity.jobs;

/**
 * Servlet implementation class addjobservlet
 */
@WebServlet("/add_jobs")
public class addjobservlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	try {
		String tittle =request.getParameter("tittle");
		String location=request.getParameter("location");
		String category =request.getParameter("category");
		String status =request.getParameter("status");
		String desc =request.getParameter("desc");
		jobs j=new jobs();
		j.setTittle(tittle);
		j.setLocation(location);
		j.setCategory(category);
		j.setDescription(desc);
		j.setStatus(status);
		
		jobDAO dao= new jobDAO(DBconnect.getconn());
		
		boolean f=dao.add_jobs(j);
		HttpSession session = request.getSession();
		if(f) {
			session.setAttribute("msg", "job post succesfully");
			response.sendRedirect("add_job.jsp");
			
		}
		else {
			session.setAttribute("msg", "error in server");
			response.sendRedirect("add_job.jsp");
			
		}
		
		
		
		
		
		
		
	}
	catch(Exception e) {
		e.printStackTrace();
		
	}
	
	}

}
