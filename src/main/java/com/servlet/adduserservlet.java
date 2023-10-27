package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.userDAO;
import com.db.DBconnect;
import com.entity.user;

/**
 * Servlet implementation class adduserservlet
 */
@WebServlet("/adduser")
public class adduserservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	                     
		try {
		
		  String name=request.getParameter("name");
		  String qua =request.getParameter("qua");
		  String email=request.getParameter("email");
		  String ps=request.getParameter("ps");
		  userDAO dao= new userDAO(DBconnect.getconn());
		  user u = new user(name,email,ps,qua,"user");
		  boolean f=dao.adduser(u);
		  HttpSession session =request.getSession();
		  
		  if(f) {
			  session.setAttribute("msg", "user added succesfully");
			  response.sendRedirect("signup.jsp");
			  
			  
		  }
		  else {
			  session.setAttribute("msg", "error in server");
			  response.sendRedirect("signup.jsp");
		  }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
