package com.jsp.ojpms.controller;

import java.io.IOException;
import java.net.http.HttpClient;

import javax.net.ssl.HttpsURLConnection;
import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

@WebServlet("/editprofile")
public class EditProfileController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId=req.getParameter("userId");
		int id=Integer.parseInt(userId);
		
		EntityManager em = JPAUtil.getEm();
		User user=em.find(User.class, id);
		
		req.setAttribute("user", user);
		
		req.getRequestDispatcher("editprofile.jsp").forward(req, resp);
	}
	
}
