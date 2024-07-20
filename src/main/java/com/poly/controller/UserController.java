package com.poly.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import com.poly.constant.SessionAttr;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.EmailService;
import com.poly.service.UserService;
import com.poly.service.VideoService;
import com.poly.service.impl.EmailServiceImpl;
import com.poly.service.impl.UserServiceImpl;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = { "/login", "/logout", "/signup","/forgotPass","/changePass" })
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService = new UserServiceImpl();
	private EmailService emailService = new EmailServiceImpl();
	
	@Override
	protected void doGet( HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		switch (path) {
		case "/login":
			doGetLogin(req, resp);
			break;
		case "/signup":
			doGetSignUp(req, resp);
			break;
		case "/logout":
			doGetLogout(session,req,resp);
			break;
		case "/forgotPass":
			doGetForgotPass(req,resp);
			break;
		default:
			break;
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		switch (path) {
		case "/login":
			doPostLogin(session, req, resp);
			break;
		case "/signup":
			doPostSignUp(session, req, resp);
			break;
		case "/forgotPass":
			doPostForgotPass( req, resp);
			break;
		case "/changePass":
			doPostChangePass(session, req, resp);
			break;
		default:
			break;
		}
	}
//	Login
	private void doGetLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/views/user/login.jsp");
		rd.forward(req, resp);
	}

	private void doPostLogin(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		User user = userService.login(username, password);

		if (user != null) {
			session.setAttribute(SessionAttr.CURRENT_USER, user);
			resp.sendRedirect("index");
		} else {
			resp.sendRedirect("login");
		}
	}
	
	// Sign Up
	private void doGetSignUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/views/user/signup.jsp");
		rd.forward(req, resp);
	}
	

	private void doPostSignUp(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String cfmPass = req.getParameter("cfmPass");
		String email = req.getParameter("email");

		if (password.equals(cfmPass)) {
			User user = userService.create(username,password,email);
			if (user != null) {
				emailService.sendEmail(getServletContext(), user, "welcome");
				session.setAttribute(SessionAttr.CURRENT_USER, user);
				resp.sendRedirect("index");
			} else {
				resp.sendRedirect("signup");
			}
		}else {
			resp.sendRedirect("signup");
		}
		
	}
	
	private void doGetLogout(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		session.removeAttribute(SessionAttr.CURRENT_USER);
		resp.sendRedirect("index");
	}
	
	private void doGetForgotPass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/views/user/forgot-pass.jsp");
		rd.forward(req, resp);
	}
	
	private void doPostForgotPass( HttpServletRequest req, HttpServletResponse resp)
			 throws ServletException, IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		String email = req.getParameter("email");
		
		User  userWithNewPass = userService.resetPassword(email);
		
		if (userWithNewPass != null ) {
			emailService.sendEmail(getServletContext(), userWithNewPass, "forgot");
			resp.setStatus(204);
		}else {
			resp.setStatus(400);
		}
		
	}
	
	private void doPostChangePass(HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		String currentPass = req.getParameter("currentPass");
		String newPass = req.getParameter("newPass");
		
		User  currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		
		if (currentUser.getPassword().equals(currentPass)) {
			currentUser.setPassword(newPass);
			User updateUser = userService.update(currentUser);
			if (updateUser != null) {
				session.setAttribute(SessionAttr.CURRENT_USER, updateUser);
				resp.setStatus(204);
			}else {
				resp.setStatus(400);
			}
		}else {
			resp.setStatus(400);
		}
	}


}
