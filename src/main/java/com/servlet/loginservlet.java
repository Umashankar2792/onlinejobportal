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

@WebServlet("/login")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public loginservlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String em = request.getParameter("email");
			String ps=request.getParameter("Password");
			user u =new user();
			HttpSession session =request.getSession();
             if("admin@gmail.com".equals(em) && "admin123".equals(ps)) {
            	 response.sendRedirect("admin.jsp");
	             u.setRole("admin");
	 			session.setAttribute("userobj", u);

				
			}
//		
             else {
            	 userDAO dao=new userDAO(DBconnect.getconn());
            	 user use =dao.login(em, ps);
            	  
             
             if(use!=null) {
            	 session.setAttribute("userobj", use);
                  response.sendRedirect("home.jsp");
            	 
             }
             else {
            	 session.setAttribute("msg","invalid username or password");
            	 response.sendRedirect("login.jsp");
             }
             }
             
		}
		catch(Exception e) {
			System.out.println(e);
		}
		

	

	}
}
